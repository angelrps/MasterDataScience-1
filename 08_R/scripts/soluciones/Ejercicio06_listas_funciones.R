###################################
# Listas                          #
###################################

actors <- c("Jack Nicholson", "Shelley Duvall", "Danny Lloyd", "Scatman Crothers", "Barry Nelson")
scores <- c(4.5, 4.0, 5.0)
sources <- c("IMDb1", "IMDb2", "IMDb3")
comments <- c("Best Horror Film I Have Ever Seen", "A truly brilliant and scary film from Stanley Kubrick", "A masterpiece of psychological horror")
reviews <- data.frame(scores, sources, comments)

# Crea una lista que contenga los siguientes componentes:
#   1. moviename: "The Shining"
#   2. actors: el vector de actores
#   3. reviews: el data frame de reviews
shining_list <- list(moviename = "The Shining", actors = actors, reviews = reviews)

# Selecciona el último actor del vector de actores de la lista
last_actor <- shining_list[["actors"]][5]

# Selecciona la segunda de las críticas del data frame de reviews de la lista
second_review <- shining_list[["reviews"]][2, ]

# Añade un nuevo elemento a lista:
#   1. year: 1980
shining_list_full <- c(shining_list, year = 1980)

# Comprueba el contenido de la lista empleando la función str
str(shining_list_full)


###################################
# Funciones                          #
###################################

#Crea una función que tome un vector y devuelva "True" si contiene algún múltiplo de 3.

#Esta no devuelve nada en caso de que no sea múltiplo de 3. Podemos pedirle que devuelva un mensaje.

multiplo_tres <- function(x){
  for (e in x){
    a = e %% 3 == 0
  if(a){
    print(a)
  }
    break
      }}


#Crea una función que dado un dataframe y un número o carácter, devuelva otro data frame con dicho valor cambiado a NA. 

convierte_na <- function(df, v){
  
  df[df==v] <- NA
  return (df)
  
}


#Escribe una función que pida un número entero al usuario y devuelva si es par o impar.

es_par <- function()
{ 
  n <- as.integer(readline("Introduzca un número entero: "))
  if(n%%2 ==0){
    print('Es par')
  }else{
    print('Es impar')
  }
  }


"""Escribe una función que dados dos vectores numéricos realice el siguiente cálculo: 
Contar cuántos números estrictamente positivos aparecerían como resultado de multiplicar (uno por uno) todos los
elementos del primer vector por todos los elementos del segundo."""


producto_positivo <- function(v,u){
  
  suma <- sum(u*v>0)
  return(suma)
  }


"""Escribe una función en R, llamada cinco, que pida al usuario 5
números por teclado. Si alguno de los números introducidos es mayor o igual que
100, el programa devolverá un mensaje avisando de esta situación. Si no, devuelve
la suma de los números introducidos que sean menores que 10."""

cinco <- function(){
  
  num <- readline("Introduce 5 números: ")
  num <-  as.numeric(as.vector(unlist(strsplit(num, ","))))
  if(any(num >100)){
    print('Hay al menos un número mayor que 100')
  }
  else{
    suma <- sum(num[num < 10])
    return(suma)
  }  
}


""" Escribe una función que, dados un vector numérico x y un número natural M, realice el siguiente cálculo: 
Sumar una a una las componentes del vector
x y detenerse una vez que pasemos de M. En este momento, devolver al usuario
lo siguiente:
a) La suma obtenida.
b) Un vector que contenga los elementos de x que hemos usado para obtener
dicha suma.

"""

suma_vector <- function(x,M){
  suma = 0
  vector <- c()
  for(e in x){
    suma = suma + e
    vector <- c(vector,e)
    if(suma >= M){
      return(list(suma =suma,vector = vector))
      break
    }
  }
}






