###################################
# sapply                          #
###################################

# La siguiente variable contiene muestras de temperatura de cada día de la semana.
temp <- list(monday = c(3, 7, 9, 6, -1),
             tuesday = c(6, 9, 12, 13, 5),
             wednesday = c(4, 8, 3, -1, -3),
             thursday = c(1, 4, 7, 2, -2),
             friday = c(5, 7, 9, 4, 2),
             saturday = c(-3, 5, 8, 9, 4),
             sunday = c(3, 6, 9, 4, 1))

str(temp)

# Utiliza lapply para encontrar la temeperatura mínima de cada día


# Utiliza sapply para encontrar la temeperatura mínima de cada día


# Utiliza lapply para encontrar la temeperatura máxima de cada día


# Utiliza sapply para encontrar la temeperatura máxima de cada día


# Crea una función extremes_avg que calcula la media entre la mínima del día y la máxima
extremes_avg <- function(x) {

}

# Aplica la nueva función utilizando sapply


# Aplica la nueva función utilizando lapply


# Crea una función extremes que devuelve un vector con:
#   1. La temperatura mínima
#   2. La temperatura máxima
extremes <- function(x) {

}

# Aplica la nueva función utilizando sapply


# Aplica la nueva función utilizando lapply


# Crea una función below_zero que devuelve las muestras menores que cero
below_zero <- function(x) {

}

# Aplica la nueva función utilizando sapply y guardarla en freezing_s


# Aplica la nueva función utilizando lapply y guardarla en freezing_l


# Compara freezing_s y freezing_l con identical


# Crea una función que devuelva los siguiente: cat("The average temperature is", mean(x), "\n")
print_info <- 



# Aplica la nueva función utilizando lapply


# Aplica la nueva función utilizando sapply


#¿Qué ha pasado?