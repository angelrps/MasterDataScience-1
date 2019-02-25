###################################
# Data frames                     #
###################################

# Crea a partir de los vectores siguientes un data frame
planets <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune");
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883); 
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67);
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE);

planets_df  <- 

# Comprueba el contenido del data frame


# Selecciona la información de los primeros tres planetas (los más cercanos al sol)
closest_planets_df <- 

# Selecciona la información de los últimos tres planetas (los más lejanos al sol)
furthest_planets_df <- 

# Comprueba la selección



# Selecciona la columna diameter de los últimos seis planetas (los más lejanos al sol)
furthest_planets_diameter <- 

# Selecciona sólo los planetas que tienen anillos
planets_with_rings_df <- 

# Selecciona los planetas que tienen un diametro inferior al de la tierra (aquellos que tienen diametro < 1, 
# puesto que la variable es relativa al diametro de la tierra)
small_planets_df  <- 

# La función order devuelve las posiciones de un vector ordenado ascendentemente
a <- c(4, 10, 3)
order(a)
a[order(a)]

# Ordena el data frame según el diametro de los planetas ascendentemente
positions <- 
largest_first_df <- 
largest_first_df