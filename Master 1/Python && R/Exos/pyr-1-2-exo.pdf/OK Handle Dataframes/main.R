# Importation des bibliothèques nécessaires
library(tidyr)
library(titanic)


#############################################################################
# Question 1 : Création d'un DataFrame simple

cat("\n Question 1 : Création d'un DataFrame simple \n")

# Génération de séquences pour les colonnes
Id <- 1:43
x <- seq(1, 43, length.out = length(Id))
y <- seq(-20, 0, length.out = length(Id))

# Création et affichage du DataFrame
df <- data.frame(Id, x, y)
print("Question 1 - DataFrame créé :")
print(df)
cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 2 : Génération de plusieurs colonnes avec des séquences spécifiques

cat("\n Question 2 : Génération de plusieurs colonnes avec des séquences spécifiques \n")
# Indices pour sélectionner les éléments
Id <- c(1, 4, 7, 10)

# Séquences extraites aux indices spécifiés
x.a <- seq(1, 43, length.out = 12)[Id]
y.a <- seq(-20, 0, length.out = 12)[Id]

# Calcul des colonnes supplémentaires
x.b <- x.a + 3.818182
y.b <- y.a + 1.818182
x.c <- x.b + 3.818182
y.c <- y.b + 1.818182

# Création d'un nouveau DataFrame
df_new <- data.frame(
  Id = Id,
  x.a = x.a,
  y.a = y.a,
  x.b = x.b,
  y.b = y.b,
  x.c = x.c,
  y.c = y.c
)

print(df_new)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 3 : Fusionner deux DataFrames par une colonne commune

cat("\n Question 3 : Fusionner deux DataFrames par une colonne commune \n")
df1 <- data.frame(
  Id = c(1, 2, 3, 4),
  Age = c(14, 12, 15, 10)
)

df2 <- data.frame(
  Id = c(1, 2, 3, 4),
  Sexe = c("F", "M", "M", "F"),
  Code = c("a", "b", "c", "d")
)

# Fusion des deux DataFrames
M <- merge(df1, df2, by = "Id")

print(M)
cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 4 : Trier un DataFrame et ajouter une colonne

cat("\n Question 4 : Trier un DataFrame et ajouter une colonne \n")
df3 <- data.frame(
  id2 = c(4, 3, 2, 1),
  score = c(100, 98, 94, 99)
)

# Tri des lignes selon l'ordre croissant de `id2`
df3 <- df3[order(df3$id2), ]

# Ajout de la colonne 'score' au DataFrame fusionné
M$score <- df3$score

N <- M

print(N)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 5 : Suppression de colonnes et transformation en format long

cat("\n Question 5 : Suppression de colonnes et transformation en format long \n")
# Suppression des colonnes 'Sexe' et 'Code'
N <- N[, !(names(N) %in% c("Sexe", "Code"))]

# Transformation en format long
df_long <- pivot_longer(N, cols = -Id, names_to = "ind", values_to = "values")

print(df_long)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 6 : Conversion d'un objet en DataFrame et création de résumés

cat("\n Question 6 : Conversion d'un objet en DataFrame et création de résumés \n")
# Conversion conditionnelle en DataFrame
if (!is.data.frame(objet)) {
  objet <- as.data.frame(objet)
}

# Création d'un DataFrame avec des statistiques descriptives
A <- data.frame(
  Girth = c(13.24839, 8.30000, 20.60000, 410.70000),
  Height = c(76, 63, 87, 2356),
  Volume = c(30.17097, 10.20000, 77.00000, 935.30000)
)

# Attribution des noms de ligne
rownames(A) <- c("mean_tree", "min_tree", "max_tree", "sum_tree")

print(A)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 7 : Réorganisation et renommage

cat("\n Question 7 : Réorganisation et renommage \n")
# Tri des lignes par Girth
A_rac <- A[order(A$Girth), ]

# Modification des noms des lignes
rownames(A_rac) <- c("mean", "min", "max", "tree")

print(A_rac)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 8 : Création d'un DataFrame vide

cat("\n Question 8 : Création d'un DataFrame vide \n")
df <- data.frame(
  Ints = integer(0),        
  Logicals = logical(0),    
  Doubles = double(0),      
  Characters = character(0) 
)

print(df)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 9 : Identification des doublons

cat("\n Question 9 : Identification des doublons \n")
X <- c(1, 2, 3, 1, 4, 5, 2)
Y <- c(0, 3, 2, 0, 5, 9, 3)

# Création d'un DataFrame et détection des doublons
XY <- data.frame(X, Y)
duplicates <- duplicated(XY)

print(duplicates)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 10 : Création d'un nouveau DataFrame pour les survivants du Titanic

cat("\n Question 10 : Création d'un nouveau DataFrame pour les survivants du Titanic \n")
# Conversion conditionnelle de `titanic_train`
if (!is.data.frame(titanic_train)) {
  titanic_train <- as.data.frame(titanic_train)
}

# Création d'un nouveau DataFrame pour les données synthétiques
new_data <- data.frame(
  Sexe = c("Male", "Female", "Male", "Female"),
  Age = c("Child", "Child", "Adult", "Adult"),
  Freq = c(0, 0, 118, 4),
  Survécu = "NO"
)

print(new_data)
cat("\n\n\n")

#############################################################################
