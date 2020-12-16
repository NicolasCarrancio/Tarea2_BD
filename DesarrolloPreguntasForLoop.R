# Fijar directorio

setwd("C:/Users/Usuario/Documents/big data/Tarea 2")

install.packages("tidyverse")
install.packages("hrbrthemes")
install.packages("viridis")


library("tidyverse")
library("hrbrthemes")
library("viridis")


# Bases de datos
grandes_chile <- read.csv2("grandes_chile.csv")
grandes_colombia <- read.csv2("grandes_colombia.csv")
grandes_peru <- read.csv2("grandes_peru.csv")

medianas_chile <- read.csv2("medianas_chile.csv")
medianas_colombia <- read.csv2("medianas_colombia.csv")
medianas_peru <- read.csv2("medianas_peru.csv")


micro_chile <- read.csv2("micro_chile.csv")
micro_colombia <- read.csv2("micro_colombia.csv")
micro_peru <- read.csv2("micro_peru.csv")


pequena_chile <- read.csv2("pequena_chile.csv")
pequena_colombia <- read.csv2("pequena_colombia.csv")
pequena_peru <- read.csv2("pequena_peru.csv")



### ejercicio 1
 
#Incorporar variable tamanio
str(micro_chile)
tamanio <- c ("grande")

grandes_chile <- cbind(grandes_chile, tamanio)
grandes_colombia <- cbind(grandes_colombia, tamanio)
grandes_peru <- cbind(grandes_peru, tamanio)

##Eliminar variable repetida
grandes_chile<- grandes_chile[ , -c(14)]

tamanio <- c("mediana")
medianas_chile <- cbind(medianas_chile, tamanio)
medianas_colombia <- cbind(medianas_colombia, tamanio)
medianas_peru <- cbind(medianas_peru, tamanio)

medianas_chile<- medianas_chile[ , -c(13)]
medianas_colombia<- medianas_colombia[ , -c(13)]
medianas_peru<- medianas_peru[ , -c(13)]


tamnaio<- c("micro")
micro_chile <- cbind(micro_chile, tamanio)
micro_colombia <- cbind(micro_colombia, tamanio)
micro_peru <- cbind(micro_peru, tamanio)

micro_chile <- micro_chile[ , -c(13,14)]
micro_colombia <- micro_colombia[ , -c(13,14)]
micro_peru <- micro_peru[ , -c(13,14)]

#####################################################tamanio micro=mediana######### corregir

tamanio<- c("pequena")
pequena_chile <- cbind(pequena_chile, tamanio)
pequena_colombia <- cbind(pequena_colombia, tamanio)
pequena_peru <- cbind(pequena_peru, tamanio)



### ejercicio 2 ###



##corregir nombre de variables

grandes_chi <- grandes_chile %>%
  rename(Porcentaje_Mujeres = procentaje_mujeres)

grandes_col <- grandes_colombia %>%
  rename(Porcentaje_Mujeres = procentaje_mujeres)

grandes_per <- grandes_peru %>%
  rename(Porcentaje_Mujeres = procentaje_muejeres)

medianas_chi <- medianas_chile %>%
  rename(Porcentaje_Mujeres = procentaje_mujeres)

medianas_col <- medianas_colombia %>%
  rename(Porcentaje_Mujeres = porcentaje_mujeres)

medianas_per <- medianas_peru %>%
  rename(Porcentaje_Mujeres = procentaje_muejeres)

micro_chi <- micro_chile %>%
  rename(Porcentaje_Mujeres = procentaje_muejeres)

micro_col <- micro_colombia %>%
  rename(Porcentaje_Mujeres = porcentaje_mujeres)

micro_per <- micro_peru %>%
  rename(Porcentaje_Mujeres = porcentaje_mujeres)

pequena_chi <- pequena_chile %>%
  rename(Porcentaje_Mujeres = porcentaje_mujeres)

pequena_col <- pequena_colombia %>%
  rename(Porcentaje_Mujeres = porcentaje_mujeres)

pequena_per <- pequena_peru %>%
  rename(Porcentaje_Mujeres = procentaje_mujeres)

## unir bases de datos 

empresas_latam <- rbind(grandes_chi, grandes_col, grandes_per, 
                        medianas_chi, medianas_col, medianas_per, 
                        micro_chi, micro_col, micro_per, pequena_chi, 
                        pequena_col, pequena_per)


##tipologia

names(empresas_latam)

str(empresas_latam$fecha) #caracter
str(empresas_latam$pais) #caracter
str(empresas_latam$ingresos) #numerico
str(empresas_latam$costos) #numerico
str(empresas_latam$Porcentaje_Mujeres) #numerico
str(empresas_latam$exportaciones) #numerico
str(empresas_latam$importaciones) #numerico
str(empresas_latam$endeudamiento) #numerico
str(empresas_latam$morosidad) #numerico
str(empresas_latam$reservas) #numerico
str(empresas_latam$spread) #numerico
str(empresas_latam$tasa_interes) #numerico
str(empresas_latam$tamanio) #caracter


### ejercicio 3 ###

# observaciones Peru v/s Chie


{
  obs_chile <- 0
  obs_peru <- 0
  
  for (posicion in 1:length(empresas_latam$pais)) {
    if(empresas_latam$pais[posicion] == "Chile"){
      obs_chile <- obs_chile + 1
    } else if(empresas_latam$pais[posicion] == "Peru"){
      obs_peru <- obs_peru+1
    }
  }
  print(paste("Las observaciones de Chile son", obs_chile, "en cambio en Peru son", obs_peru ))
}
### Por lo tanto no existe diferencia de observaciones entre ambos paises ###



## ejercicio 4 ##

##pais con mayores ingresos















