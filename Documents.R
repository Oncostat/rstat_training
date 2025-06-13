toto = c(1,2,3,4,5) # function c() forms a vector of elements of a common type

toto1 = as.character(toto)

# Commentaire 1
## Titre 1 ------------------------
toto[3]="last"


# intro -------------------------------------------------------------------

df = data.frame("name" = c("Albert Einstein","Martin Luther","Nelson Mandela","William Shakespeare", "Ludwig van Beethoven"),
                "gender" = rep(x = 1, times = 5))

df$gender = factor(x = df$gender, levels = c(0,1), labels = c("Woman", "Man"))


df[,"gender"]
df2 = df %>% filter(gender==1)


toto1 = c(1,2,3,4,5) # function c() forms a vector of elements of a common type
toto2 = c(1,2,3,4,5) # function c() forms a vector of elements of a common type
toto3 = c(1,2,3,4,5) # function c() forms a vector of elements of a common type
toto = c(1,2,3,4,5) # function c() forms a vector of elements of a common type
toto = c(1,2,3,4,5) # function c() forms a vector of elements of a common type
toto = c(1,2,3,4,5) # function c() forms a vector of elements of a common type




library(crosstable)

colnames(table)
af(crosstable(data = table, cols = c("sexe","job")))

  str_trim("    baba")




toto3 = 1:5         # creates a sequence of integers from 1 to 5
toto4 = seq( from = 1, to = 5, by = 1)  # function seq()


# exemple indentation ------

table %>%
  dplyr::select(name,sexe) %>%
  dplyr::filter(name!="Charles")

sum(population[,"AGE"])




as_factor(x = population[,"PAYS"],
          levels = c("FR","ESP","UK","MAR"),
          labels = c("FRANCE","ESPAGNE","ROYAUME-UNI","MAROC"))





population=data.frame(SUBJID=1:5,
                      AGE=sample(25:60,size = 5,replace = TRUE), # sampling with function sample()
                      PAYS=c("FR","ESP","UK","UK","MAR"))
population
