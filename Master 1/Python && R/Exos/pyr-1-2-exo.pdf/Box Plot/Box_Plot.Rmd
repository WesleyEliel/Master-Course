data(iris)

# Question 1 : Boîte à moustaches simple par espèce

cat("\n Question 1 : Boîte à moustaches simple par espèce  \n\n\n")

boxplot(Sepal.Width ~ Species, 
        data = iris, 
        main = "Distribution de la largeur des sépales par espèce")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 2 : Modifier les limites de l'axe des y

cat("\n Question 2 : Modifier les limites de l'axe des y  \n\n\n")

boxplot(Sepal.Width ~ Species, 
        data = iris, 
        ylim = c(2.5, 4.2),  # Nouvelle étendue pour l'axe y
        main = "Distribution avec des limites de l'axe y ajustées")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 3 : Supprimer les axes et les étiquettes

cat("\n Question 3 : Supprimer les axes et les étiquettes  \n\n\n")

boxplot(Sepal.Width ~ Species, 
        data = iris, 
        xaxt = "n",  # Suppression de l'axe des x
        yaxt = "n",  # Suppression de l'axe des y
        xlab = "",   # Pas d'étiquette pour l'axe x
        ylab = "",   # Pas d'étiquette pour l'axe y
        main = "Graphique sans axes ni étiquettes")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 4 : Ajouter des encoches pour la comparaison des médianes

cat("\n Question 4 : Ajouter des encoches pour la comparaison des médianes  \n\n\n")

boxplot(Sepal.Width ~ Species, 
        data = iris, 
        notch = TRUE,  # Activer les encoches
        main = "Boîte avec encoches pour la comparaison des médianes")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 5 : Augmenter l'espacement entre les boîtes

cat("\n Question 5 : Augmenter l'espacement entre les boîtes  \n\n\n")

boxplot(Sepal.Width ~ Species, 
        data = iris, 
        space = 1.5,  # Augmentation de l'espacement
        main = "Espacement ajusté entre les boîtes")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 6 : Personnalisation de la couleur des bordures

cat("\n Question 6 : Personnalisation de la couleur des bordures  \n\n\n")

boxplot(Sepal.Width ~ Species, 
        data = iris, 
        border = "darkgreen",  # Bordures en vert foncé
        main = "Graphique avec bordures colorées")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 7 : Modifier l'apparence des lignes médianes

cat("\n Question 7 : Modifier l'apparence des lignes médianes  \n\n\n")

boxplot(Sepal.Width ~ Species, 
        data = iris, 
        medcol = "purple",  # Couleur des lignes médianes
        lwd = 2,            # Largeur des lignes médianes
        main = "Médianes personnalisées en violet")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 8 : Personnalisation des points aberrants

cat("\n Question 8 : Personnalisation des points aberrants  \n\n\n")

boxplot(Sepal.Width ~ Species, 
        data = iris, 
        col = "lightyellow",  # Couleur de remplissage
        pch = 19,             # Type de point pour les valeurs aberrantes
        cex = 1.2,            # Taille des points aberrants
        main = "Personnalisation des valeurs aberrantes")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 9 : Ajouter une légende descriptive

cat("\n Question 9 : Ajouter une légende descriptive  \n\n\n")
boxplot(Sepal.Width ~ Species, 
        data = iris, 
        main = "Comparaison des largeurs de sépales par espèce", 
        ylab = "Largeur des sépales (mm)")

cat("\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Question 10 : Ajouter des axes personnalisés avec un style MATLAB

cat("\n Question 10 : Ajouter des axes personnalisés avec un style MATLAB  \n\n\n")

boxplot(Sepal.Width ~ Species, 
        data = iris, 
        yaxt = "n",  # Supprimer temporairement les graduations de l'axe y
        xaxt = "n",  # Supprimer temporairement les graduations de l'axe x
        xlab = "Espèces", 
        ylab = "Largeur des sépales (mm)", 
        main = "Axes et graduations personnalisés")

cat("\n\n\n")

#############################################################################