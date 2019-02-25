#######################################
# Importación: fichero de texto plano #
#######################################

# Con read.table
mun_csv_1 <- read.table("dat/municipios1.csv",
                   header = TRUE, 
                   sep = ",", 
                   stringsAsFactors = FALSE)
str(mun_csv_1)

# Con read.csv
mun_csv_2 <- read.csv("dat/municipios1.csv", stringsAsFactors = FALSE)
str(mun_csv_2)

# Con read.table
mun_tsv_1 <- read.table("dat/municipios2.tsv",
                   header = TRUE, 
                   sep = "\t", 
                   stringsAsFactors = FALSE,
                   dec = ",",
                   quote = "")
str(mun_tsv_1)

# Con read.delim2
mun_tsv_2 <- read.delim2("dat/municipios2.tsv", stringsAsFactors = FALSE)
str(mun_tsv_2)

# Con readr
library(readr)
mun_csv_3 <- read_delim("dat/municipios1.csv",
                     delim = ",",
                     col_types = "ci") #c: characters, d: double, i: integer, l: logical, _: ignore
str(mun_csv_3)

mun_tsv_3 <- read_tsv("dat/municipios2.tsv", col_types = "cccccciiddi", 
                      locale = locale("es", decimal_mark = ","))
str(mun_tsv_3)

# Con fread
library(data.table)
mun_csv_4 <- fread("dat/municipios1.csv")
str(mun_csv_4)

#######################################
# Importación: fichero Excel          #
#######################################
library(readxl)
excel_sheets("dat/municipios.xlsx")

mun_xlsx <- read_excel("dat/municipios.xlsx")


#######################################
# Importación: Base de Datos          #
#######################################

# install.packages("RODBC", repos ="https://cloud.r-project.org")
library(RODBC)

userName <- ""
passwd <- ""
hive_schema <- "schema_name"
dataSourceName <- "Cloudera Hive 64-bit"


hiveConn <- odbcConnect(dataSourceName, uid=userName, pwd=passwd)
odbcGetInfo(hiveConn)

sqlQuery(hiveConn,"")

bdm_agentes <- sqlQuery(hiveConn,"SELECT * FROM TABLA_1;")