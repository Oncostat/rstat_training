
# Installation et chargement des packages ----------------------------------



# Importation des données -------------------------------------------------
library(readxl)

data_clinique_raw <- readxl::read_xlsx(path = "./Data/data_clinique.xlsx",
                                       col_names = TRUE,
                                       sheet = "Sheet 1")

data_chimio_raw <- readxl::read_xlsx(path = "./Data/data_chimio.xlsx",
                                     col_names = TRUE,
                                     sheet = "Sheet 1")

data_AE_raw <- readxl::read_xlsx(path = "./Data/data_AE.xlsx",
                                 col_names = TRUE,
                                 sheet = "Sheet 1")
data_EOT_raw <- readxl::read_xlsx(path = "./Data/data_AE.xlsx",
                                  col_names = TRUE,
                                  sheet = "Sheet 1")

# Manipulation des données ------------------------------------------------
View(data_clinique_raw)
View(data_chimio_raw)
View(data_AE_raw)

library(janitor)
library(tidyverse)

data_clinique <- data_clinique_raw %>%
  janitor::clean_names()

data_chimio <- data_chimio_raw %>%  
  janitor::clean_names() %>%
  dplyr::rename(subjid = id)

data_AE <- data_AE_raw %>%
  janitor::clean_names() %>%
  dplyr::rename(soc = aesoc,
                grade = aegrade)


library(lubridate)

data_clinique <- data_clinique %>%
  
  dplyr::mutate(sex = if_else(sex == 1,
                              true = 'Male',
                              false = 'Female'),
                date_naissance = as_date(date_naissance, origin = "1899-12-30"), # De numeric à Date
                date_diagnosis = ymd(date_diagnosis)) %>% # de Character à Date
  
  dplyr::mutate_if(is_character, as_factor) # de Character à Factor


data_chimio <- data_chimio %>%
  
  dplyr::mutate(date_debut_tt = as_date(date_debut_tt, origin = "1899-12-30"))


data_AE <- data_AE %>%
  
  dplyr::mutate(arm = if_else(arm == 1,
                              true = 'Experimental',
                              false = 'Control')) %>%
  
  dplyr::mutate_if(is_character, as_factor) # de Character à Factor


data_clinique <- data_clinique %>%
  
  dplyr::mutate(age = interval(date_naissance, date_diagnosis) / years(1))


data_AE <- data_AE %>%
  
  dplyr::group_by(subjid) %>%
  dplyr::mutate(grade_max = max(grade, na.rm = TRUE)) %>%
  dplyr::ungroup()


library(tidyr)

data_AE_wide <- data_AE %>%
  
  tidyr::pivot_wider(id_cols = c(subjid, arm),
                     names_from = soc,
                     values_from = grade,
                     values_fn = max)


data <- data_clinique %>%
  
  dplyr::left_join(data_chimio, by = 'subjid')

creation de la variable OS et delai OS

# Construction de graphiques ----------------------------------------------


## Courbe d'inclusion ------------------------------------------------------
à l'aide de la table clinique


## Nuage de point ----------------------------------------------------------
donnee biologique en fonction du BMI smooth pour voir la droite de regression
et identifier des outlier aussi

## Histogramme -------------------------------------------------------------
type de chimio en fonction du groupe de traitement ou AE stack

## Courbe de survie --------------------------------------------------------
jointure table d'inlcuison + eot 

