# Utilizando como referencia el codigo anterior:
#   
# Elige un implicado en el caso Black y la url asociada que tabula sus movimientos black.
# 
# Scrapea la Fecha de la tabla de la Web y asignalo a un vector. 
# Puedes utilizar el Gadget Selector para identificar las etiquetas CSS de la columna en cuestión.
# 
# Scrapea la tabla entera (No es inmediato desde Gadget Selector encontrar su selector CSS) y 
# conviertela en Data Frame.

url_blesa <- urls[4]

web_blesa <- read_html(url_blesa)

Fecha_v <- html_text(html_nodes(web_blesa, '#tabla_datos.fecha'))
Fecha_v

Tabla_blesa <- html_table(html_nodes(web_blesa, '#tabla_datos'))[[1]]
Tabla_blesa

# Utilizar el paquete rvest para extraer la tabla de los componentes del Eurostoxx 50, que expresa su valor,
# cambios en el mismo y algunos fundamentals de la web de Expansión:
# http://www.expansion.com/mercados/cotizaciones/indices/eurostoxx_I.5E.html

#############################################
#  Web Scraping de Expansión              ###
#############################################
library(rvest)
library(lubridate) # install.packages("lubridate", repos ="https://cloud.r-project.org")
library(stringr)

# URL a importar
url.expansion <- "http://www.expansion.com/mercados/cotizaciones/indices/eurostoxx_I.5E.html"

# Para descubrir el encoding del HTML
guess_encoding(url.expansion)

# Lectura de la página
# SUGERENCIA: Prueba la función read_html
expansion.web <- read_html(url.expansion, encoding = "ISO-8859-1")

# Sacamos las tablas, objetos "table" de HTML
# SUGERENCIA: Prueba la función html_nodes
expansion.tables <- html_nodes(expansion.web, "table#listado_valores")

# Las convertimos a data.frames
# SUGERENCIA: Prueba la función html_table
eurostoxx.table <- html_table(expansion.tables[[1]], fill = TRUE, dec=",")

# Contenido de la tabla
head(eurostoxx.table)

# Quitamos la última columna (está vacía)
eurostoxx.table <- eurostoxx.table[, 1:ncol(eurostoxx.table) - 1]

# Cambiamos el nombre de las columnas: stock, last, var.perc, var, ytd, max, min, volume, capitalization, timestamp
colnames(eurostoxx.table) <- c("stock", "last", "var.perc", "var", "ytd", "max", "min", "volume", "capitalization", "timestamp")

# Obtenemos las clases de cada columna: hay mezcla de character, integer y numeric
sapply(eurostoxx.table, class)

character.cols <- c("stock")
numeric.cols <- c("last", "var", "max", "min")
numeric.perc.cols <- c("var.perc", "ytd")
integer.cols <- c("volume", "capitalization")
date.cols <- c("timestamp")

# Arreglamos las columnas con porcentajes pasandolas a tanto por uno
eurostoxx.table[, numeric.perc.cols] <- eurostoxx.table[, numeric.perc.cols] / 100

# Arreglamos las columnas con tipo entero
#  1. Eliminamos .
#  2. Convertimos en entero
eurostoxx.table[, integer.cols] <- sapply(eurostoxx.table[, integer.cols],
                                          function (element) {
                                            element <- str_replace_all(element, "\\.", "")
                                            element <- as.integer(element)
                                            return(element)
                                          }
)

# Arreglamos la columna timestamp
#  1. Si es una fecha (dd/mm) parseamos como fecha
#  2. Si es una hora (hh:mm) parseamos como hora

eurostoxx.table$timestamp <- dmy_hm(sapply(eurostoxx.table$time, 
                                           function (element) {
                                             # Parseamos de manera diferente si es una fecha o una hora
                                             if (str_detect(element, "^[0-9]{1,2}/[0-9]{1,2}$")) {
                                               element <- paste(paste(element,
                                                                      as.character(year(Sys.Date())),
                                                                      sep = "/"), "00:00")
                                             }
                                             else if (str_detect(element, "^[0-9]{1,2}:[0-9]{1,2}$")) {
                                               element <- paste(format(Sys.Date(), "%d/%m/%Y"), element)
                                             }
                                             else {
                                               return(format(Sys.time(), "%d/%m/%Y %H:%M"))
                                             }
                                             return(element)
                                           }
)
)

# Obtenemos las clases de cada columna: ahora cada una tiene el tipo que le corresponde
sapply(eurostoxx.table, class)

eurostoxx.table
