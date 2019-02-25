###################################
# dplyr                           #
###################################
library(hflights)
library(dplyr)

# Contiene información de vuelos de los aeropuertos de Houston
hflights

hflights.tbl <- tbl_df(hflights)

hflights.tbl

glimpse(hflights.tbl)

# Recodifica la variable UniqueCarrier a partir del vector recode.carrier
recode.carrier <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
                    "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
                    "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
                    "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")



# Comprueba de nuevo el contenido
glimpse(hflights.tbl)

# Recodifica la variable CancellationCode a partir del vector recode.cancellation
hflights.tbl[hflights.tbl$CancellationCode == "", "CancellationCode"] <- "E"
recode.cancellation <-  c("A" = "carrier", "B" = "weather", "C" = "FFA", "D" = "security", "E" = "not cancelled")


# Comprueba de nuevo el contenido
glimpse(hflights.tbl)

# Selecciona las variables: ActualElapsedTime, AirTime, ArrDelay, DepDelay


# Selecciona las variables desde Origin a Cancelled


# Selecciona todas las variables menos aquellas entre DepTime y AirTime


# Selecciona todas las variables que terminan en "Delay"


# Selecciona todas las variables que terminan en "Num" o empiezan por "Cancell"


# Selecciona todas las variables que terminan en "Num" o empiezan por "Cancell" y además la variable UniqueCarrier


# Selecciona todas las variables que terminan en "Time" o "Delay"


# Traduce las siguiente selecciones tradicionales empleando "select"
ex1r <- hflights.tbl[c("TaxiIn", "TaxiOut", "Distance")]
ex1d <- 

ex2r <- hflights.tbl[c("Year", "Month", "DayOfWeek", "DepTime", "ArrTime")]
ex2d <- 

ex3r <- hflights.tbl[c("TailNum", "TaxiIn", "TaxiOut")]
ex3d <- 

# Crea una nueva variable ActualGroundTime como la resta de ActualElapsedTime y AirTime. Guarda el resultado en g1
g1 <- 

# Añade a g1 una nueva variable GroundTime como la suma TaxiIn y TaxiOut
g2 <- 

# Añade a g2 una nueva variable AverageSpeed como Distance/AirTime*60
g3 <- 

# Pinta g3
g3

# Crea dos variables al tiempo y guardalas en m1:
#     loss como la resta de ArrDelay y DepDelay
#     loss_percent como el ratio de ArrDelay - DepDelay entre DepDelay
m1 <- 

# ¿Puedes simplificar la creación de la segunda variable con la primera? Guardalo en m2
m2 <- 

# Crea tres variables al timepo y guardalas en m3. Utiliza la simplificación anterior
#     TotalTaxi como la suma de TaxiIn y TaxiOut
#     ActualGroundTime como la diferencia de ActualElapsedTime y AirTime
#     Diff como la diferencia de las dos variables anteriores ¿Es siempre cero?
m3 <- 

# Filtra los vuelos con distancia recorrida mayor o igual que 3000


# Filtra los vuelos de JetBlue, Southwest, o Delta


# Filtra los vuelos en los que el tiempo en Taxi fue mayor que el tiempo de vuelo (No uses mutate)


# Filtra los vuelos que salieron antes de las 5am y llegaron después de las 10pm


# Filtra los vuelos que salieron con retraso y llegaron a tiempo


# Filtra los vueltos cancelados en fin de semana


# Filtra los vueltos cancelados después de haber sido retrasados


# Selecciona los vuelos con destino JFK
# Crea una nueva variable Date a partir de  Year, Month y DayofMont
# Muestra una selección de las variables Date, DepTime, ArrTime y TailNum
c1 <- 
c2 <- 


# Ordena la tabla dtc según el retraso de salida
dtc <- filter(hflights.tbl, Cancelled == 1, !is.na(DepDelay))


# Ordena la tabla dtc según el motivo de cancelación


# Ordena la tabla dtc según la compañía y el retraso de salida


# Ordena todos los vuelos según la compañía y el retraso de salida descendentemente


# Ordena todos los vuelos según el retraso total (No uses mutate)


# Filtra los vuelos con destino DFW y hora de salida anterior a las 8am, ordenalos según el tiempo en vuelo descendentemente
# Hazlo en una sola instrucción


# Calcula la distancia mínima y máxima de todos los vuelos


# Calcula la distancia máxima de todos los vuelos desviados


# Crea en una nueva variable con aquellos vuelos que no tienen NA en ArrDelay
# Calcula los siguientes estadísticos:
#    earliest: el mínimo retraso de llegada
#    average: el retraso medio de llegada
#    latest: el máximo retraso de llegada
#    sd: la desviación estandar en el retraso de llegada
temp1 <- 
  

# Crea en una nueva variable con aquellos vuelos que no tienen NA en TaxiIn y TaxiOut
# Calcula un estadístico (max_taxi_diff) que contenga la mayor diferencia en valor absoluto entre TaxiIn y TaxiOut
temp2 <- 


# Calcula los siguientes estadísticos:
#    n_obs: número de observaciones
#    n_carrier: número total de compañías
#    n_dest: número total de destinos
#    dest100: el destino del vuelo en la posición 100


# Crea en una nueva variable con aquellos vuelos de la compañía "American"

# Calcula los siguientes estadísticos:
#    n_flights: el número de vuelos
#    n_canc: el número de vuelos cancelados
#    p_canc: el porcentaje de vuelos cancelados
#    avg_delay: el tiempo medio de los vuelos (acuerdate de eliminar los NAs)


# Usando los pipes realiza:
#    1. Crea una variable diff como la diferencia de TaxiIn y TaxiOut
#    2. Filtra aquellas filas para las que diff no es NA
#    3. Calcula la media





# Usando los pipes realiza:
#    1. ¿Cuanto vuelos nocturos hay? Los vuelos nocturnos son aquellos para los que la hora de llegada es menor que la de salida
# Cuidado con los NAs




# Usando los pipes realiza:
#    1. Para cada compañía calcula los siguientes estadísticos:
#       n_flights: número de vuelos
#       n_canc: número de vuelos cancelados
#       p_canc: porcentaje de vuelos cancelados
#       avg_delay: retraso medio de llegada (cuidado con los NAs)
#    2. Ordena los resultados por el retraso medio y el porcentaje de vuelos cancelados








# Usando los pipes realiza:
#    1. Para cada día de la semana calcula los siguientes estadísticos:
#       avg_taxi: tiempo medio de la suma de las variables TaxiIn y TaxiOut (cuidado con los NAs)
#    2. Ordena los resultados descendentemente segun avg_taxi





# Usando los pipes realiza:
#    1. Filtra aquellos cuyo retraso de llegada es distinto de NA
#    2. Agrega por compañía
#    3. Calcula la proporción de vuelos con retraso (p_delay)
#    4. Crea una nueva variable rank, que es el ranking de p_delay
#    5. Ordena el resultado segun rank







# Usando los pipes realiza:
#    1. Filtra aquellos cuyo retraso de llegada es distinto de NA y mayor que cero
#    2. Agrega por compañía
#    3. Calcula el tiempo medio de restraso (avg_delay)
#    4. Crea una nueva variable rank, que es el ranking de avg_delay
#    5. Ordena el resultado segun rank







# Usando los pipes calcula que avión (TailNum) volo más veces. ¿Cuántas?





# ¿Cuántos aviones volaron a un único destino?






# ¿Cuál es el destino más visitado de cada compañía?






# ¿Qué compañías viaja más a cada destino?




