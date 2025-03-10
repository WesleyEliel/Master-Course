# Fonction pour générer un nombre aléatoire entre 1 et 100
generate_number <- function() {
  return(sample(1:100, 1))
}

# Fonction principale du jeu
guess_my_number <- function() {
  # Afficher les instructions initiales
  cat("\n\n######################################################################### \n\n")
  cat("Bienvenue au jeu du plus ou moins !\n")
  cat("Je choisis un nombre entre 1 et 100.\n")
  cat("Essayez de le deviner en choisissant des nombres ou allez à la fin avec la commande 'fin'.\n")
  cat("\n\n######################################################################### \n\n")
  
  # Générer le nombre secret
  secret_number <- generate_number()
  attempts <- 0

  # Boucle principale du jeu
  while (TRUE) {
    cat("\n\n###############\n")
    
    # Obtenir l'entrée de l'utilisateur
    user_input <- readline("Entrez votre choix: ")
    
    # Vérifier si l'utilisateur souhaite quitter
    if (tolower(user_input) == 'fin') {
      cat("\n\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n")
      cat(paste("Vous ne savez plus quoi choisir ! D'accord, le nombre était", secret_number))
      cat("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n\n")
      break
    }
    
    # Valider l'entrée
    if (!grepl("^[0-9]+$", user_input)) {
      cat("Veuillez entrer un nombre entier.\n")
      next
    }
    
    # Convertir l'entrée en entier
    estimate <- as.integer(user_input)
    
    # Incrémenter le compteur de tentatives
    attempts <- attempts + 1
    
    # Comparer avec le nombre secret
    if (estimate > secret_number) {
      cat("Entrez un nombre plus petit!\n")
      cat("\n\n###############\n")
    } else if (estimate < secret_number) {
      cat("Entrez un nombre plus grand!\n")
      cat("\n\n###############\n")
    } else {
      cat("\n\n***********************************************************\n")
      cat(paste("Félicitations ! Vous avez trouvé le nombre en", attempts, "tentatives."))
      cat("\n\n***********************************************************\n")
      break
    }
  }
}

# Lancer le jeu
guess_my_number()
