# Importation des bibliothèques nécessaires
library(ggplot2)

#############################################################################
# Question 1 : Création d'un graphique scatter simple

cat("\n Question 1 : Création d'un graphique scatter simple  \n\n\n")

scatter_plot <- ggplot(data = mtcars, aes(x = mpg, y = drat)) +
  geom_point() +
  labs(x = "Consommation (mpg)", y = "Rapport essieu arrière") +
  theme_minimal()

print(scatter_plot)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 2 : Personnalisation de la taille, de la couleur et des limites des axes

cat("\n Question 2 : Personnalisation de la taille, de la couleur et des limites des axes  \n\n\n")

scatter_plot_custom <- ggplot(data = mtcars, aes(x = mpg, y = drat)) +
  geom_point(color = "blue", size = 4) +
  labs(x = "Consommation (mpg)", y = "Rapport essieu arrière") +
  xlim(0, 35) + ylim(0, 6) +
  theme_minimal()

print(scatter_plot_custom)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 3 : Ajout de titre et étiquettes

cat("\n Question 3 : Ajout de titre et étiquettes  \n\n\n")

print("Résultat: a")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 4 : Annotations et suppression des axes

cat("\n Question 4 : Annotations et suppression des axes  \n\n\n")

# a
scatter_no_axes <- ggplot(data = mtcars, aes(x = mpg, y = drat)) +
  geom_point(size = 3, color = "darkgreen") +
  theme(
    axis.line = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )

print("Pratie a ")
print(scatter_no_axes)

#  b
scatter_with_annotation <- ggplot(data = mtcars, aes(x = mpg, y = drat)) +
  geom_point(size = 3, color = "purple") +
  labs(
    title = "Consommation vs Rapport Essieu",
    x = "Consommation (mpg)",
    y = "Rapport essieu"
  ) +
  annotate("text", x = 25, y = 4.5, label = "Point annoté", size = 5, color = "red") +
  theme_minimal()

print("Partie b ")
print(scatter_with_annotation)

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 5 : Ajout de légende

cat("\n Question 5 : Ignoré (non spécifié)  \n\n\n")

print("Résultat: b")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 6 : Légendes personnalisées

cat("\n Question 6 : Légendes personnalisées  \n\n\n")

# a
legend_cyl <- ggplot(mtcars, aes(x = mpg, y = drat, color = as.factor(cyl), shape = as.factor(cyl))) +
  geom_point(size = 3) +
  labs(
    title = "Nombre de cylindres",
    x = "Consommation (mpg)",
    y = "Rapport essieu arrière",
    color = "Cylindres",
    shape = "Cylindres"
  ) +
  theme_minimal() +
  theme(
    legend.background = element_rect(fill = "lightgray", color = "black"),
    legend.position = "top"
  )

print("Partie a")
print(legend_cyl)

# b : Rapports d'engrenage
legend_gear <- ggplot(mtcars, aes(x = mpg, y = drat, color = as.factor(gear), shape = as.factor(gear))) +
  geom_point(size = 3) +
  labs(
    title = "Nombre de rapports",
    x = "Consommation (mpg)",
    y = "Rapport essieu arrière",
    color = "Rapports",
    shape = "Rapports"
  ) +
  theme_minimal() +
  theme(
    legend.background = element_rect(fill = "lightblue", color = "black"),
    legend.position = "bottom"
  )

print("Partie b")
print(legend_gear)


cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################
# Question 7 : Personnalisation avancée des légendes et axes

cat("\n Question 7 : Personnalisation avancée des légendes et axes  \n\n\n")

#  a 
scatter_no_legend <- ggplot(mtcars, aes(x = mpg, y = drat, color = as.factor(cyl), shape = as.factor(cyl))) +
  geom_point(size = 3) +
  theme_void() +
  theme(legend.position = "none")

print("Partie a : ")
print(scatter_no_legend)

# a
scatter_custom_legend <- ggplot(mtcars, aes(x = mpg, y = drat, color = as.factor(cyl), shape = as.factor(cyl))) +
  geom_point(size = 3) +
  labs(
    title = "Cylindres et Consommation",
    x = "Consommation (mpg)",
    y = "Rapport essieu arrière",
    color = "Cylindres",
    shape = "Cylindres"
  ) +
  theme_minimal() +
  theme(
    legend.position = c(0.85, 0.85),
    legend.background = element_rect(fill = "gray90", color = "black")
  )

print("Partie b : ")
print(scatter_custom_legend)

cat("\n\n\n")

#############################################################################