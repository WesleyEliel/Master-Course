# Importation des bibliothèques nécessaires et données
data(Orange)


#############################################################################
# Question 1: Quel sera le résultat de l'instruction R length(X) ?

cat("\n Question 1: Quel sera le résultat de l'instruction R length(X) ? \n")

# Résultat: 6
print("Résultat: 6")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 2:  Ecrire un code R qui supprimera toutes les occurrences de NA dans X

cat("\n Question 2:  Ecrire un code R qui supprimera toutes les occurrences de NA dans X \n")

# Résultat: a
print("Résultat: a")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 3:  Quelle instruction R remplacera toutes les occurrences de NA par 11 ?

cat("\n Question 3:  Quelle instruction R remplacera toutes les occurrences de NA par 11 ? \n")

# Résultat: b
print("Résultat: b")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 4: Alors quel sera le nombre d'occurrences de NA dans X ?

cat("\n Question 4: Alors quel sera le nombre d'occurrences de NA dans X ? \n")

# Résultat: C
print("Résultat: C")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################


# Question 5 : Vérifier les valeurs manquantes dans un vecteur

cat("\n Question 2 : Génération de plusieurs colonnes avec des séquences spécifiques \n")

W <- c(11, 3, 5, NA, 6)

# Identification des valeurs manquantes
missing_values <- is.na(W)
print(missing_values)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 6 : Remplacer des valeurs spécifiques par NA

cat("\n Question 6 : Remplacer des valeurs spécifiques par NA \n")

# Remplacement des âges égaux à 118 par NA dans les données 'Orange'
Orange$age[Orange$age == 118] <- NA
print(head(Orange))

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 7 : Calculer une moyenne en ignorant les valeurs manquantes

cat("\n Question 7 : Calculer une moyenne en ignorant les valeurs manquantes \n")

A <- c(33, 21, 12, NA, 7, 8)

# Calcul de la moyenne
mean_A <- mean(A, na.rm = TRUE)
print(mean_A)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 8 : Identifier les lignes incomplètes dans une matrice

cat("\n Question 8 : Identifier les lignes incomplètes dans une matrice \n")

c1 <- c(1, 2, 3, NA)
c2 <- c(2, 4, 6, 89)
c3 <- c(45, NA, 66, 101)

# Création d'une matrice
X <- rbind(c1, c2, c3, deparse.level = 1)

# Sélection des lignes contenant des données manquantes
not_completed_rows <- X[!complete.cases(X), ]
print(not_completed_rows)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 9 : Filtrer les lignes sans valeurs manquantes pour une colonne spécifique

cat("\n Question 9 : Filtrer les lignes sans valeurs manquantes pour une colonne spécifique \n")

df <- data.frame(
  Name = c(NA, "Joseph", "Martin", NA, "Andrea"),
  Sales = c(15, 18, 21, 56, 60),
  Price = c(34, 52, 21, 44, 20),
  stringsAsFactors = FALSE
)

# Filtrage pour garder uniquement les lignes où 'Name' n'est pas NA
filtered_df <- df[!is.na(df$Name), ]
print(filtered_df)


cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 10 : Filtrer les lignes complètes d'un DataFrame

cat("\n Question 10 : Filtrer les lignes complètes d'un DataFrame \n")

dataframe <- data.frame(
  Name = c(NA, "Joseph", "Martin", NA, "Andrea"),
  Sales = c(15, 18, 21, NA, 60),
  Price = c(34, 52, 33, 44, NA),
  stringsAsFactors = FALSE
)

# Sélection des lignes sans valeurs manquantes sur toutes les colonnes
completed_rows_df <- dataframe[!(is.na(dataframe$Name) | is.na(dataframe$Sales) | is.na(dataframe$Price)), ]

print(completed_rows_df)

cat("\n\n\n")

#############################################################################