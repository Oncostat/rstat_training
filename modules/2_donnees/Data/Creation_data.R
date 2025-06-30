################################################################################
# Script pour generer 2 bases de donnees fictives servant d'exemples a la      #
# manipulation des fonctions du tidyverse                                      #
################################################################################




# Chargement des packages
library(tidyverse)
library(openxlsx)  # Export Excel




set.seed(2025)  # Pour la reproductibilité
n <- 50  # Nombre de patients
n_ae_max <- 10
sample_soc = c("Infections and infestations",
               "Nervous system disorders",
               "Vascular disorders",
               "Cardiac disorders",
               "Immune system disorders",
               "Endocrine disorders",
               "Investigations")




data_clinique <- tibble(patient_id = 1:n,
                        sex = sample(c("Man", "Woman"), n, replace = TRUE),
                        age = sample(18:85, n, replace = TRUE),
                        bmi = round(runif(n, min = 19, max = 26), 2),
                        diagnosis_date = as.character(sample(seq.Date(from = as.Date("2017-01-01"), to = as.Date("2019-12-31"), by = "day"), n, replace = TRUE)),
                        initial_therapy = sample(c("Surgery", "Chemotherapy", "Chemotherapy + Surgery"), n, replace = TRUE),
                        chemotherapy = if_else(initial_therapy == "Surgery",
                                               true = NA, false = sample(c("Cisplatine", "Carboplatine"), n, replace = TRUE)))




data_AE <- tibble(patient_id = 1:n,
                  arm = sample(c("Control", "Experimental"), n, replace = TRUE),
                  n_ae = rbinom(n = n, size = n_ae_max, prob = 0.2)) %>%
  mutate(x = map(n_ae, ~seq_len(.x))) %>%
  unnest(x) %>%
  mutate(ae_grade = sample(1:4, size = n(), replace = TRUE, prob = c(0.3, 0.25, 0.2, 0.1)),
         ae_soc = sample(sample_soc, size = n(), replace = TRUE)) %>%
  select(patient_id, ae_soc, ae_grade)




data_chimio <- data_clinique %>% 
  filter(!is.na(chemotherapy)) %>%
  mutate(n_cycles = if_else(chemotherapy == "Cisplatine", sample(4:6, n(), replace = TRUE), sample(3:5, n(), replace = TRUE)),
         dose_mg_per_cycle = if_else(chemotherapy == "Cisplatine", sample(seq(70, 100, by = 10), n(), replace = TRUE),
                                     sample(seq(300, 400, by = 25), n(), replace = TRUE)),
         dose_totale_mg = n_cycles * dose_mg_per_cycle,
         date_debut = ymd(diagnosis_date) + sample(7:30, n(), replace = TRUE),
         date_fin = date_debut + weeks(n_cycles)) %>%
  select(patient_id, date_debut, dose_totale_mg) %>%
  as_tibble()



# Exportation en CSV
write.csv(data_clinique, "Data/data_clinique.csv", row.names = FALSE)
write.csv(data_AE, "Data/data_AE.csv", row.names = FALSE)
write.csv(data_chimio, "Data/data_chimio.csv", row.names = FALSE)



# Exportation en TXT avec tabulations comme séparateurs
write.table(data_clinique, "Data/data_clinique.txt", sep = "\t", row.names = FALSE, col.names = TRUE)
write.table(data_AE, "Data/data_AE.txt", sep = "\t", row.names = FALSE, col.names = TRUE)
write.table(data_chimio, "Data/data_chimio.txt", sep = "\t", row.names = FALSE, col.names = TRUE)


# Exportation en Excel
write.xlsx(data_clinique, "Data/data_clinique.xlsx")
write.xlsx(data_AE, "Data/data_AE.xlsx")
write.xlsx(data_chimio, "Data/data_chimio.xlsx")




rm(list = ls())



