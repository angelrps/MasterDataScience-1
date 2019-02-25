###################################
# lapply                          #
###################################

# El siguiente vector tiene un listado con nombres de matemáticos y sus años de nacimiento.
# Ojo está todo codificado dentro de la misma cadena de caracteres.
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Separa los nombres y años utilizando la función strsplit
split_math <- 

# Aplica la función tolower a todos los elementos de split_math para convertirlos a minúsculas
split_low <- 

# Examina el conteido


# Escribe una función que devuelva el primer elemento de un vector
select_first <- function(x) {

}

# Aplica la función select_first a split_low
names <-

# Escribe una función que devuelva el segundo elemento de un vector
select_second <- function(x) {
  
}

# Aplica la función select_second a split_low
years <- 

# Utiliza las dos funciones anteriores como funciones anónimas
names <- 
years <- 

# Unifica las dos funciones en una única función que reciba como parámetros el vector y el índice del elemento a devolver
select_el <- function(x, el) { 
  
}

# Usa la nueva función para obtener los mismos resultados que antes
names <- 
years <- 

# ¿Qué pasa al ejecutar?
lapply(split_low, function(x) {
  if (nchar(x[1]) > 5) {
    return(NULL)
  } else {
    return(x[2])
  }
})