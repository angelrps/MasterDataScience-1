############################## 
# Ejemplos de API Web      ###
##############################

# install.packages('jsonlite', repos = "https://cloud.r-project.org"))
library(jsonlite)

plcUrl <- "https://maps.googleapis.com/maps/api/place/textsearch/json?query= "
key <- 'INSERT KEY HERE' #

black.comercios <- data.frame(comercio = unique(black$comercio))
black.comercios$location.lat <-0
black.comercios$location.lng <-0
black.comercios$address <- ""

for(i in 1:nrow(black.comercios)){
  query <- paste(black.comercios$comercio[i], 'Spain', sep = '+')
  strurl <- as.character(paste(plcUrl ,query,"&key=",key,sep=""))
  rd <- fromJSON(URLencode(strurl))
  if(rd$status == "OK")
  {
    black.comercios$location.lat[i] <- rd$results$geometry$location$lat
    black.comercios$location.lng[i] <- rd$results$geometry$location$lng
    black.comercios$address[i] <- rd$results$formatted_address
  }
}

# Pon en marcha el anterior código, muy probablemente te de error.

# En principio solo hay que añadir una key válida desde Google APIs 
# (https://console.developers.google.com/apis).

# Intenta entender el código y desentrañarlo línea a línea.

# Crees que se ha cumplido el objetivo final de geolocalizar los comercios?
# ¿En qué terminos? ¿Habría que incluir más información para conseguir el propósito planteado a priori?