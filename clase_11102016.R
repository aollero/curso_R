library()
install.packages("devtools")
library("devtools")
install_github("cjgb/caRtociudad")
library(caRtociudad)
#################
# Luz Frias
# 2016-10-10
# Paquetes
#################

# Paquetes instalados
library()

# Paquetes cargados
(.packages())

# Instalar un paquete
install.packages("reshape2")

# Actualizarlo
update.packages("reshape2")

# Cargarlo
library(reshape2)

# devtools: para instalar paquetes de fuera de CRAN

# Ejercicio: 
# 1. Instala desde CRAN el paquete devtools
# 2. Utilizando devtools instala el siguiente paquete:
# https://github.com/cjgb/caRtociudad
# 3. Cárgalo y ejecuta algún ejemplo disponible en el readme del paquete. E.g.:
 cartociudad_reverse_geocode(40.45332, -3.69442)
# 4. Elimínalo
# Pistas:
# ?install_github
# ?remove.packages

#remove.packages("caRtociudad")

 ################# ###################################################
 
 #################
 # Luz Frias
 # 2016-10-10
 # Vectores
 #################
 
 # Los índices empiezan en 1 (no en 0)
 # Todos los elementos son del mismo tipo
 
 # Asignación
 # Vectores numéricos, de caracteres, lógicos, ...
 # Pueden tener nombre
 v1 <- c(primero = "a", segundo = "b")
 v2 <- c(TRUE, TRUE, FALSE)
 mode(v1)
 length(v2)
 v3 <- rep(2, 3)
 v4 <- 3:8
 
 # Indexación
 v1[1]
 v1["segundo"]
 v4[2:4]
 v4[c(TRUE, FALSE, FALSE, FALSE, FALSE, TRUE)]
 v4[-1] # índices negativos DESCARTAN valores (todos menos este)
 v1["segundo"] <- "c"
 
 # Operaciones
 c(1, 2, 3) + 10
 c(1, 2, 3, 4) + c(10, 20) # repite el menor
 as.numeric(v2)
 as.character(v2)
 
 # Ejercicio
 # 1. Mira la documentación de la función rnorm
 # 2. Genera un vector de 1000 elementos con valores generados aleatoriamente
 #  que sigan una distribución normal con media = 5 y desviación estándar = 2
 # 3. Pinta el histograma con la función hist
 # 4. Calcula la media y la desviación estándar (mean, sd) y comprueba que
 #  son correctos
 # 5. Sustituye el primer valor de tu vector por NA.
 # 6. Calcula la media ahora. ¿Qué pasa?
 # 7. Mira la documentación de ?mean para ver cómo ignorar los NAs
 
 
 rnorm(1000, mean = 5, sd = 2)
 v5 <- rnorm(1000, 5, 2)
 head(v5)
 
 v5[1] <- NA
 mean(v5)
 mean(v5, na.rm = TRUE)
 
 ################# ################# ################# #################
 #################
 # Luz Frias
 # 2016-10-10
 # Matrices
 #################
 
 # Generación
 M <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, byrow = TRUE)
 I <- diag(3) # matriz diagonal de 3x3
 
 # Exploración
 dim(M)
 summary(M)
 
 # Indexación
 M[2, 3]
 M[1, ]
 
 # Concatenación
 cbind(M, I)
 rbind(M, I)
 
 # Nombres de columna
 colnames(M) <- c("a", "b", "c")
 colnames(M)
 
 # Conversiones
 as.data.frame(M)
 
 # Operaciones por fila o columna
 rowMeans(M) # vector de medias de filas
 colSums(M)  # vector de sumas de columnas
 
 ################# ################# ################# #################
 # Luz Frias
 # 2016-10-10
 # Factors
 #################
 
 # Generación
 a <- c("GOOD", "BAD", "BAD", "BAD", "GOOD")
 a_f <- factor(a)
 as.character(a_f)
 
 # Generación con orden
 b <- c("pais", "pais", "ciudad", "continente", "ciudad")
 b_levels <- c("ciudad", "pais", "continente")
 b_f <- factor(b, levels = b_levels, ordered = TRUE)
 
 # Inspección
 levels(b_f)
 
 # Añadir un nivel
 levels(b_f) <- c(levels(b_f), "mundo")
 
 # Eliminar niveles no utilizados
 b_f <- b_f[drop = TRUE]
 
 
 ################# ################# ################# #################
 # Luz Frias
 # 2016-10-10
 # Listas
 #################
 
 # Generación
 a <- list("a", TRUE, 4)
 direccion <- list(calle = "General Perón", numero = 27, ciudad = "Madrid")
 c(a, direccion)     # concatena
 list(a, direccion)  # anida
 as.list(1:5)
 
 # Exploración
 length(a)
 names(direccion)
 
 # Indexación y [ frente a [[
 direccion[1]
 direccion[["calle"]]
 direccion$calle
 mode(direccion[1])
 mode(direccion[[1]])
 
 # Operaciones a los elementos
 lapply(direccion, toupper) # lista
 sapply(direccion, toupper) # "simplificado": vector
 Reduce(paste, direccion)
 
 
 ################# ################# ################# #################
 # Luz Frias
 # 2016-10-10
 # dataframes
 #################
 
 # Generación
 df <- data.frame(numero = 1:12, nombre = month.name)
 
 # Lectura y escritura en fichero
 write.table(iris, file = "iris.tsv", sep = "\t", col.names = TRUE,
             row.names = FALSE)
 iris_df <- read.table("iris.tsv", header = TRUE, sep = "\t",
                       stringsAsFactors = FALSE)
 
 # Exploración
 dim(iris_df)
 nrow(iris_df)
 ncol(iris_df)
 summary(iris_df)
 head(iris_df)
 sapply(iris_df, class)
 # Ejercicio: entender qué hace sapply(iris_df, class)
 names(iris_df)
 
 # Indexación
 iris_df[1:5, ]
 iris_df[1:5, c(1, 5)]
 iris_df[1:5, "Sepal.Length"]
 iris_df[1:5, -1]
 iris_df[iris_df$Sepal.Width > 4, ]
 
 # Crear y eliminar columnas
 iris_df$random <- rnorm(nrow(iris_df), 0, 1)
 iris_df$random <- NULL
 
 # Cruce de dataframes (join)
 especies <- unique(iris_df$Species)[-1]
 iris_2 <- data.frame(Species = especies, numero = 1:length(especies))
 cruce <- merge(iris_df, iris_2)   # inner join
 dim(cruce)
 cruce <- merge(iris_df, iris_2, all.x = TRUE) # outer join
 head(cruce)
 
 # Ejercicio
 # Consulta para qué sirven read.csv y write.csv
 # Úsalas para guardar y leer de nuevo iris
 # Comprueba que se haya leido correctamente
 