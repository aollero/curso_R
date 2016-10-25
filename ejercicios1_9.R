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
#soluci�n:creo nuevo vector "y" que contiene los nuevos valores a�adi�ndolo 
#a la lista
x <-list(w,y<-replace(v,1,"K"))
# escribe una nueva sentencia que reemplace "A" por "K" en la lista x

# Ejercicio 2: dado a
a <- list ("x"=5, "y"=10, "z"=15)
# calcula en una sentencia la suma de sus elementos
# pista: ?unlist
#soluci�n: sum(unlist(a, recursive=FALSE))


# Ejercicio 3: dado
b <- list(a=1:10, b=seq(3), c=rep(2, 5))
# escribe una sentencia que devuelva un vector con la longitud de cada uno de los elementos de lista
#soluci�n: c<-c(length(b[[1]]),length(b[[2]]),length(b[[3]]))

# Ejercicio 4
c <- list(a=1:10, c="Hello", d="AA")
# escribe una sentencia que devuelva todos los elementos de la lista menos el primero
# # �ndices negativos --> soluci�n: c[-1]

# Ejercicio 5
d <- list(a=5:10, c="Hello", d="AA")
# escribe una sentencia que a�ada al final de d un elemento "ZZ"
# a�ado en el componente "d" un nuevo elemento 
#soluci�n d <- list(a=5:10, c="Hello", d=c("AA","ZZ"))

# Ejercicio 6
e <- list("a", "b", "c")
# escribe una sentencia que asigne como nombres de elementos "one", "two" and "three" a e
#creo otra lista con los nombres y se los asigno
#soluci�n: names(e) <- f <- list("one","two","three");

# Ejercicio 7
f <- list(1, 5, 7)
g <- list(2, 5, 8)
# escribe una sentencia que devuelva los valores de f que no est�n en g
# pista: ?`%in%`
# viendo la ayuda de %in% he visto la funci�n intersect que me ha llevado a setdiff
# soluci�n:  setdiff(f,g) devuelve una lista con los elementos de diferencia

# Ejercicio 8
# A partir del dataset state.center ya cargado en R
# Comprueba el tipo de dato, exam�nalo y convi�rtelo a data.frame
#soluci�n: con el comando ?state.center me dice que se trata de una lista, lo paso a df
summary(state.center)
dim(state.center)
nrow(state.center)
ncol(state.center)
?state.center
statecenter <- data.frame(state.center)

# Ejercicio 9
# Crea un data.frame con 3 columnas a partir de 3 vectores num�ricos a tu gusto
# Ordena las filas de manera descendente con los valores de la primera columna
# pista: ?order
#soluci�n: mirando en la ayuda de order
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

# Ejercicio 11
# A partir del dataset VADeaths ya cargado en R
# a) Comprueba si es un data.frame y si no, convi�rtelo

# b) Crea una una columna Total con la suma de cada fila

# c) Cambia de orden las columnas, de forma que Total sea la primera

# Ejercicio 12
# A partir del dataset state.x77 ya cargado en R
# a) Comprueba si es un data.frame y si no, convi�rtelo

# b) Extrae el n�mero de estados con un ingreso menor a 4300

# c) Extrae el estado con el ingreso m�s alto. Pista: ?which

# Ejercicio 13
# A partir del dataset swiss, crea un data.frame �nicamente con las filas
# 1, 2, 3, 10, 11, 12 and 13, y solo con las columnas Examination, Education and Infant.Mortality

# a) La mortalidad infantil de Sarine est� mal, deber�a ser NA, c�mbialo.

# b) Crea una columna Total con la suma de cada fila. Si te encuentras NAs, ign�ralos (suman 0)

# c) Crea una columna of con la proporci�n de Examination (Examination / Total)