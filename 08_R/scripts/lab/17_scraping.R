############################## 
# Ejemplos de Web Scraping ###
##############################

###############################################################
# Scraping de El País. Datos del caso de las Tarjetas Black ###
###############################################################

# install.packages('rvest', repos ="https://cloud.r-project.org")
# install.packages('magrittr', repos ="https://cloud.r-project.org")
library(rvest)
library(magrittr)

url.root <- "http://elpais.com/especiales/2014/tarjetas-opacas-caja-madrid/apuntes/"
url.names <- c('sanchezbarcojildefonsojose/', 'moralsantinjoseantonio/',
               'moradoiglesiasricardo/', 'blesadelaparramiguel/',
               'amatrocamatias/', 'ferrazricarteramon/',
               'perezclavermariano/', 'torremartinezenriquedela/',
               'astorquiporterajuanmanuel/', 'delamercedmongemariamercedes/')

abbr.names <- substr(url.names, 1,5)

bnames <- c('Sánchez', 'Moral', 'Morado', 'Blesa', 'Amat', 
            'Ferraz', 'Pérez', 'Torre', 'Astorqui', 'DeLaMerced')

urls <- paste(url.root, url.names, sep = '')

Tip.act <- read.csv('dat/Tipo.act.csv', sep = ';')

black <- c()
for (i in 1:10){
  tmp <- urls[i] %>%
    read_html() %>%
    html_nodes('#tabla_datos') %>% # xpath='//*[@id="tabla_datos"]') %>%
    html_table()
  tmp <- tmp[[1]]  
  black <- rbind(black, cbind(bnames[i],tmp))
}
colnames(black)[1] <- 'Implicado'
colnames(black)[5] <- 'comercio'
str(black)


