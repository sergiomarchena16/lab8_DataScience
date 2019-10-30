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
dfDatos2 <- dfDatos2[!(dfDatos2$V1=="Pais de Proveniencia"),]
dfDatos2$V18 <- NULL
names(dfDatos2) <- c("Pais de Proveniencia","Aduana de Ingreso","Fecha de la Poliza","Partida Arancelaria","Modelo del Vehiculo","Marca","Linea","Centimetros Cubicos","Distintivo","Tipo de Vehiculo","Tipo de Importador","Tipo Combustible","Asientos","Puertas","Tonelaje","Valor CIF","Impuesto")

datos2011 <- dfDatos2[grepl("2014", dfDatos2$`Fecha de la Poliza`),]

barplot(sort(table(datos2011$`Pais de Proveniencia`), decreasing = TRUE)[1:5], main = "2014 - Top 5 paises" )
