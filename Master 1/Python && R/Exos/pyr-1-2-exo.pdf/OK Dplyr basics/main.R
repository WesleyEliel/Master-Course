# Importation des bibliothèques nécessaires
library(dplyr)

#############################################################################
# Question 1 : Charger le dataset iris et examiner sa structure

cat("\n Question 1 : Charger le dataset iris et examiner sa structure \n")

data(iris)
glimpse(iris)  # Aperçu rapide de la structure du jeu de données

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 2 : Extraire des lignes spécifiques et sélectionner des colonnes

cat("\n Question 2 : Extraire des lignes spécifiques et sélectionner des colonnes \n")

subset_iris <- iris %>%
  slice(30:45) %>%  # Extraction des lignes 30 à 45
  select(Sepal.Length, Species)  # Sélection des colonnes spécifiques
print(subset_iris)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 3 : Afficher la dernière ligne du jeu de données

cat("\n Question 3 : Afficher la dernière ligne du jeu de données \n")

last_row <- iris %>%
  slice_tail(n = 1)  # Extraction de la dernière ligne
print(last_row)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 4 : Compter le nombre de fleurs avec une longueur de sépale > 6

cat("\n Question 4 : Compter le nombre de fleurs avec une longueur de sépale > 6 \n")

count_large_sepal <- iris %>%
  summarise(total = sum(Sepal.Length > 6, na.rm = TRUE))  # Calcul du total
print(count_large_sepal)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 5 : Déterminer l'espèce la plus fréquente
cat("\n Question 5 : Déterminer l'espèce la plus fréquente \n")

most_common_species <- iris %>%
  count(Species, sort = TRUE) %>%  # Compter et trier les occurrences par espèce
  slice_head(n = 1)  # Garder la première ligne (espèce la plus fréquente)
print(most_common_species)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 6 : Proportion de sépales avec largeur <= 3 par espèce
cat("\n Question 6 : Proportion de sépales avec largeur <= 3 par espèce \n")

sepal_width_proportion <- iris %>%
  mutate(is_small_width = Sepal.Width <= 3) %>%  # Ajouter une colonne logique
  group_by(Species) %>%
  summarise(proportion = mean(is_small_width, na.rm = TRUE))  # Calculer la proportion
print(sepal_width_proportion)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 7 : Fleurs avec longueur de sépale entre 4.5 et 5.5, et proportion avec largeur de pétale > 1

cat("\n Question 7 : Fleurs avec longueur de sépale entre 4.5 et 5.5, et proportion avec largeur de pétale > 1 \n")

subset_sepal_length <- iris %>%
  filter(Sepal.Length >= 4.5 & Sepal.Length <= 5.5) %>%  # Filtrer les longueurs spécifiques
  summarise(proportion_large_petal = mean(Petal.Width > 1, na.rm = TRUE))  # Proportion calculée
print(subset_sepal_length)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 8 : Ajouter une colonne avec le carré de la longueur des sépales

cat("\n Question 8 : Ajouter une colonne avec le carré de la longueur des sépales \n")

iris_with_squared <- iris %>%
  mutate(Sepal.Length.Squared = Sepal.Length^2)  # Nouvelle colonne
print(head(iris_with_squared))  # Afficher les premières lignes pour vérifier

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 9 : Espèce avec la plus faible proportion de sépales larges (> 3) et total d'observations

cat("\n Question 9 : Espèce avec la plus faible proportion de sépales larges (> 3) et total d'observations \n")

species_sepal_width <- iris %>%
  group_by(Species) %>%
  summarise(
    proportion_large_width = mean(Sepal.Width > 3, na.rm = TRUE),  # Proportion par espèce
    total_observations = n()  # Nombre d'observations
  ) %>%
  arrange(proportion_large_width)  # Trier par proportion croissante
print(species_sepal_width)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 10 : Proportion de fleurs avec largeur de pétale > 1 par espèce

cat("\n Question 10 : Proportion de fleurs avec largeur de pétale > 1 par espèce \n")

petal_width_proportion <- iris %>%
  group_by(Species) %>%
  summarise(
    proportion_large_petal = mean(Petal.Width > 1, na.rm = TRUE),  # Calcul de la proportion
    total_observations = n()  # Nombre d'observations par espèce
  )
print(petal_width_proportion)

cat("\n\n\n")

#############################################################################