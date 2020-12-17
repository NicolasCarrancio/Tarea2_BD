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


tamanio <- c("mediana")
medianas_chile <- cbind(medianas_chile, tamanio)
medianas_colombia <- cbind(medianas_colombia, tamanio)
medianas_peru <- cbind(medianas_peru, tamanio)


tamnaio<- c("micro")
micro_chile <- cbind(micro_chile, tamanio)
micro_colombia <- cbind(micro_colombia, tamanio)
micro_peru <- cbind(micro_peru, tamanio)


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

str(empresas_latam$fecha) #character
str(empresas_latam$pais) #character
str(empresas_latam$ingresos) #numeric
str(empresas_latam$costos) #numeric
str(empresas_latam$Porcentaje_Mujeres) #numeric
str(empresas_latam$exportaciones) #numeric
str(empresas_latam$importaciones) #numeric
str(empresas_latam$endeudamiento) #numeric
str(empresas_latam$morosidad) #numeric
str(empresas_latam$reservas) #numeric
str(empresas_latam$spread) #numeric
str(empresas_latam$tasa_interes) #numeric
str(empresas_latam$tamanio) #character


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

ingresos_chi <- empresas_latam %>% select(ingresos, pais) %>%
  filter(pais == "chile") 
ingresos_col <- empresas_latam %>% select(ingresos, pais) %>%
  filter(pais == "colombia") 
ingresos_per <- empresas_latam %>% select(ingresos, pais) %>%
  filter(pais == "peru")


VectorIngresos <- c(sum(ingresos_chi[1]), sum(ingresos_col[1]),sum(ingresos_per[1]))


###orden de menos a mayor 

numeroingresos <- function(VectorIngresos){
  if(VectorIngresos[1] > VectorIngresos[2]){
    temporal <- VectorIngresos[1]
    VectorIngresos[1] <- VectorIngresos[2]
    VectorIngresos[2] <- temporal
  } 
  if(VectorIngresos[2] > VectorIngresos[3]){
    temporal <- VectorIngresos[2]
    VectorIngresos[2] <- VectorIngresos[3]
    VectorIngresos[3] <- temporal
  } 
  if(VectorIngresos[1] > VectorIngresos[2]){
    temporal <- VectorIngresos[1]
    VectorIngresos[1] <- VectorIngresos[2]
    VectorIngresos[2] <- temporal
  } 
  if(VectorIngresos[2] > VectorIngresos[3]){
    temporal <- VectorMuestra[2]
    VectorIngresos[2] <- VectorIngresos[3]
    VectorIngresos[3] <- temporal
  }
  return(VectorIngresos)
}

## resultado vector
vec <- numeroingresos(VectorIngresos)
print(paste("Segun los ingresos de explotación, Chile tiene menos ingresos, que ascienden a ",
            vec[1], ", Perú le sigue con",vec[2],", y el pais con mayor ingresos por explotacion fue Colombia con",
            vec[3]))


## ejercicio 5

## Caso Chile, multilplicar tasa por factor 0,1
## Caso Peru, sumar a la tasa 0,3
## Caso Colombia, dividir tasa por 10


{
  variable <- c(0)
  empresas_latam <- cbind(empresas_latam, variable)

  
  for (posicion in 1:length(empresas_latam$pais)){
    if(empresas_latam$pais[posicion]=="chile"){
      empresas_latam$variable[posicion] <- empresas_latam$tasa_interes[posicion]*0.1
    }else if(empresas_latam$pais[posicion]=="peru"){
      empresas_latam$variable[posicion] <- empresas_latam$tasa_interes[posicion]+0.3
    }else if(empresas_latam$pais[posicion]=="colombia"){
      empresas_latam$variable[posicion] <- empresas_latam$tasa_interes[posicion]/10
    }
  }
}


## ejercicio 6

# Reemplazar exportaciones con 1 cuando es mayor a 2,1, 
# Reemplazar con un 2 cuando es menor 2,1 
# Reemplazar con un 3 cuando es igual a 2,1
# Redondear al primer decimal la variable


for (posicion in 1:length(empresas_latam$exportaciones)) {
  if(empresas_latam$exportaciones[posicion] > 2.1){
    empresas_latam$exportaciones[posicion] <- 1
  }else if(empresas_latam$exportaciones[posicion] < 2.1){
    empresas_latam$exportaciones[posicion] <- 2
  }else if(empresas_latam$exportaciones[posicion] == 2.1){
    empresas_latam$exportaciones[posicion] <- 3
  }
}



### ejercicio 7 

#boxplot 

empresas_latam %>%
  ggplot(aes(x=tamanio, y=morosidad, fill=tamanio)) + 
  geom_boxplot() + ggtitle("Nivel de morosidada")

empresas_latam %>%
  ggplot(aes(x=tamanio, y=endeudamiento, fill=tamanio)) + 
  geom_boxplot() + ggtitle("Nivel de morosidada")

empresas_latam %>%
  ggplot(aes(x=tamanio, y=ingresos, fill=tamanio)) + 
  geom_boxplot() + ggtitle("Nivel de morosidada")

empresas_latam %>%
  ggplot(aes(x=tamanio, y=costos)) + 
  geom_boxplot() + ggtitle("Nivel de morosidada")

#### Independiente del tamanio de la empresa sea esta grande, mediana, micro o pequena poseen igual distribucion de costos, ingresos endeudamiento e importaciones


