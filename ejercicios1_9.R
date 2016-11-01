#################
# Luz Frias
# 2016-10-12
# reto
# basado en: https://cran.r-project.org/doc/manuals/R-intro.pdf
#################

# Ejercicio 1: dado x construido de la siguiente manera
w <- c(2, 7, 8)
v <- c("A", "B", "C")
x <- list(w, v)
#solución:creo nuevo vector "y" que contiene los nuevos valores añadiéndolo 
#a la lista
x <-list(w,y<-replace(v,1,"K"))
# escribe una nueva sentencia que reemplace "A" por "K" en la lista x

# Ejercicio 2: dado a
a <- list ("x"=5, "y"=10, "z"=15)
# calcula en una sentencia la suma de sus elementos
# pista: ?unlist
#solución: sum(unlist(a, recursive=FALSE))


# Ejercicio 3: dado
b <- list(a=1:10, b=seq(3), c=rep(2, 5))
# escribe una sentencia que devuelva un vector con la longitud de cada uno de los elementos de lista
#solución: c<-c(length(b[[1]]),length(b[[2]]),length(b[[3]]))

# Ejercicio 4
c <- list(a=1:10, c="Hello", d="AA")
# escribe una sentencia que devuelva todos los elementos de la lista menos el primero
# # índices negativos --> solución: c[-1]

# Ejercicio 5
d <- list(a=5:10, c="Hello", d="AA")
# escribe una sentencia que añada al final de d un elemento "ZZ"
# añado en el componente "d" un nuevo elemento 
#solución d <- list(a=5:10, c="Hello", d=c("AA","ZZ"))

# Ejercicio 6
e <- list("a", "b", "c")
# escribe una sentencia que asigne como nombres de elementos "one", "two" and "three" a e
#creo otra lista con los nombres y se los asigno
#solución: names(e) <- f <- list("one","two","three");

# Ejercicio 7
f <- list(1, 5, 7)
g <- list(2, 5, 8)
# escribe una sentencia que devuelva los valores de f que no están en g
# pista: ?`%in%`
# viendo la ayuda de %in% he visto la función intersect que me ha llevado a setdiff
# solución:  setdiff(f,g) devuelve una lista con los elementos de diferencia

# Ejercicio 8
# A partir del dataset state.center ya cargado en R
# Comprueba el tipo de dato, examínalo y conviértelo a data.frame
#solución: con el comando ?state.center me dice que se trata de una lista, lo paso a df
summary(state.center)
dim(state.center)
nrow(state.center)
ncol(state.center)
?state.center
statecenter <- data.frame(state.center)

# Ejercicio 9
# Crea un data.frame con 3 columnas a partir de 3 vectores numéricos a tu gusto
# Ordena las filas de manera descendente con los valores de la primera columna
# pista: ?order
#solución: mirando en la ayuda de order
a <- c(2,1)
b <- c(3,4) 
c <- c(6,5) 
df <-data.frame(a,b,c)
df [order(a,b,c), ]


# Ejercicio 10
# A partir del data.frame
h <- as.data.frame(diag(4))
# Renombra los nombres de las filas para que se llamen i_row (es decir, 1_row, 2_row, ...)
# y las columnas a j_col (es decir, 1_col, 2_col, ...)
# pista: puedes utilizar rownames, colnames, nrow, ncol, paste0 y sapply
#solución
#nombre de las filas: rownames (h)<- paste(rownames(h),"_row")
#colnames(h)<-paste(c(1:ncol(h)),"_col")


# Ejercicio 11
# A partir del dataset VADeaths ya cargado en R
# a) Comprueba si es un data.frame y si no, conviértelo
# solución
# is.data.frame(VADeaths) --> false
#como tiene filas y columnas quiero saber si es una matriz
#is.matrix(VADeaths) --> true


# b) Crea una una columna Total con la suma de cada fila
#solución: creo matriz2 con lo siguiente
#matriz2<- cbind(VADeaths, total= rowSums(VADeaths))


# c) Cambia de orden las columnas, de forma que Total sea la primera
#solución: 
#matriz2<-matriz2[,c(5,1:4)]


# Ejercicio 12
# A partir del dataset state.x77 ya cargado en R
# a) Comprueba si es un data.frame y si no, conviértelo
#is.data.frame(state.x77)-> no es data.frame
is.matrix(state.x77) # true

#solucion estados <- as.data.frame(state.x77)

# b) Extrae el número de estados con un ingreso menor a 4300

#solucion estados[estados$Income < 4300, ]

# c) Extrae el estado con el ingreso más alto. Pista: ?which
#solución:which (estados == max(estados$Income), arr.ind=TRUE)


# Ejercicio 13
# A partir del dataset swiss, crea un data.frame únicamente con las filas
# 1, 2, 3, 10, 11, 12 and 13, y solo con las columnas Examination, Education and Infant.Mortality

df1<-swiss[c(1:3,10:13),c("Examination","Education","Infant.Mortality")]

# a) La mortalidad infantil de Sarine está mal, debería ser NA, cámbialo.

df1["Sarine","Infant.Mortality"]<-c(NA)

# b) Crea una columna Total con la suma de cada fila. Si te encuentras NAs, ignóralos (suman 0)

df2 <- cbind(df1, total= rowSums(df1,na.rm=TRUE))


# c) Crea una columna of con la proporción de Examination (Examination / Total)
df3 <- cbind(df2,of=df2$Examination/df2$total)
