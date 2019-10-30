#Laboratorio número 8 acerca de visualizaciones
#Data science 1 
#Catedrática: Lynette García 
#Sergio Marchena - José Zuñiga - Pablo Viana 

install.packages("tidyverse")

library(tidyverse)

tempDatos2 <- setwd("./datos2")
tempDatos2 = list.files(pattern = "*.txt")
datos2 <- lapply(tempDatos2, function(x) read.delim(x, header = FALSE, sep = "|"))


dfDatos2 <- datos2 %>% reduce(full_join)

View(df)
