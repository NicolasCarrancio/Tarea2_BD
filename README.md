# Tarea2_BD

1) Se agrega la variable "tamanio" a todas las bases de datos a través del comando cbind.


2) La tipologia de las varibales se presenta a continuación

fecha: character
pais: character
ingresos: numeric
costos: numeric
Porcentaje_Mujeres: numeric
exportaciones: numeric
importaciones: numeric
endeudamiento: numeric
morosidad: numeric
reservas: numeric
spread: numeric
tasa_interes: numeric
tamanio: character

3) Las observaciones de Peru y Chile son 260 cada una respectivamente, este dato fue obtenido a traves de FOOR/IF


4) El país con mayor ingresos de explotación entre los años 2012-2017 es Colombia con 3941, seguido por Peru con 3661 y por ultimo Chile con 3272


5) Se genera la variable con los factores a considerar donde a Chile  se le multiplica su tasa de interes por 0,1
a Peru se le suma 0,3 y a Colombia se le divide por 10 usando For/if

6) Mediante los condicionales for/if se reemplaza la columna exportaciones 
a 1 cuando es mayor  2,1
a 2 cuando es menor a 2,1
a 3 cuando es igual a 2,1

7) ¿Cuanta diferencia de morosidad poseen las empresas segun su tamanio?
   ¿El tamanio de las empresas influye en sus ingresos?
   ¿El nivel de endeudamiento es mayor en empresas grandes?
   ¿Los costos de las pequenas empresas son iguales que el de las micro? 

Se realizan graficos Boxplot considerando el tamanio de las empresas con distintas variables como
la morosidad, endeudamiento, ingresos y costos.
En todos los casos se concluye que las empresas poseen distribuciones muy similares
las que podrian ser explicadas debido a la similitud de la muestra analizada.


