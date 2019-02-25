###################################
# tidyr                           #
###################################
library(tidyr)

# Arregla el siguiente data frame
people_1 <- data.frame(name = c("Jake", "Alice", "Tim", "Denise"), 
                       age = c(34, 55, 76, 19), 
                       brown = c(0, 0, 1, 0), 
                       blue = c(0, 1, 0, 0),
                       other = c(1, 0, 0, 1),
                       height = c(6.1, 5.9, 5.7, 5.1))




# Arregla el siguiente data frame
people_2 <- data.frame(name = c("Jake", "Jake", "Jake", "Alice", "Alice", "Alice"), 
                       measurement = c("n_dog", "n_cats", "n_birds", "n_dog", "n_cats", "n_birds"), 
                       value = c(1, 0, 1, 1, 2, 0))




# Arregla el siguiente data frame
people_3 <- data.frame(name = c("Jake", "Alice", "Tim", "Denise"), 
                       sex_age = c("M:34", "F:55", "M:76", "F:19"), 
                       eye_color = c("other", "blue", "brown", "other"), 
                       height = c(6.1, 5.9, 5.7, 5.1))




# Consigue el data frame original del último arreglo
