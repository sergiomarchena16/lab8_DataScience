#Laboratorio número 8 acerca de visualizaciones
#Data science 1 
#Catedrática: Lynette García 
#Sergio Marchena - José Martinez - Pablo Viana 

install.packages("tidyverse")

library(tidyverse)

tempDatos2 <- setwd("./datos2")
tempDatos2 = list.files(pattern = "*.txt")
datos2 <- lapply(tempDatos2, function(x) read.delim(x, header = FALSE, sep = "|"))


dfDatos2 <- datos2 %>% reduce(full_join)
dfDatos2 <- dfDatos2[!(dfDatos2$V1=="Pais de Proveniencia"),]
dfDatos2$V18 <- NULL
names(dfDatos2) <- c("Pais de Proveniencia","Aduana de Ingreso","Fecha de la Poliza","Partida Arancelaria","Modelo del Vehiculo","Marca","Linea","Centimetros Cubicos","Distintivo","Tipo de Vehiculo","Tipo de Importador","Tipo Combustible","Asientos","Puertas","Tonelaje","Valor CIF","Impuesto")

datos2011 <- dfDatos2[grepl("2011", dfDatos2$`Fecha de la Poliza`),]
datos2012 <- dfDatos2[grepl("2012", dfDatos2$`Fecha de la Poliza`),]
datos2013 <- dfDatos2[grepl("2013", dfDatos2$`Fecha de la Poliza`),]
datos2014 <- dfDatos2[grepl("2014", dfDatos2$`Fecha de la Poliza`),]
datos2015 <- dfDatos2[grepl("2015", dfDatos2$`Fecha de la Poliza`),]

barplot(sort(table(datos2011$`Pais de Proveniencia`), decreasing = TRUE)[1:5], main = "2011 - Top 5 paises" )
barplot(sort(table(datos2012$`Pais de Proveniencia`), decreasing = TRUE)[1:5], main = "2012 - Top 5 paises" )
barplot(sort(table(datos2013$`Pais de Proveniencia`), decreasing = TRUE)[1:5], main = "2013 - Top 5 paises" )
barplot(sort(table(datos2014$`Pais de Proveniencia`), decreasing = TRUE)[1:5], main = "2014 - Top 5 paises" )
barplot(sort(table(datos2015$`Pais de Proveniencia`), decreasing = TRUE)[1:5], main = "2015 - Top 5 paises" )

sort(table(datos2011$`Pais de Proveniencia`), decreasing = TRUE)[1:5]

motos <- dfDatos2[dfDatos2$`Tipo de Vehiculo` == "MOTO",]
motos$anio_importacion <- substr(motos$`Fecha de la Poliza`, 7, 10)

barplot(table(motos$anio_importacion), main = "Importacion motos" )

automoviles <- dfDatos2[dfDatos2$`Tipo de Vehiculo` != "MOTO",]
automoviles$anio_importacion <- substr(automoviles$`Fecha de la Poliza`, 7, 10)
barplot(table(automoviles$anio_importacion), main = "Importacion de automoviles" )
