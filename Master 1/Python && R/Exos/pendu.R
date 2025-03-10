library(stringr)

display_hidden_word <- function(word, guessed_letters) {
  str_replace_all(word, setdiff(strsplit(word, "")[[1]], guessed_letters), "_")
}

play <- function() {
  # Liste des mots
  words <- c("python", "wesley", "ordinateur", "chocolat", "grenouille",
             "cuisine", "aventure", "papillon", "voyage",
             "soleil", "guitare", "musique", "montagne", "nuage")
  
  # Selectiooner un mot
  secret_word <- sample(words, 1)
  
  guessed_letters <- character()
  attempted_letters <- character()
  remaining_attempts <- length(secret_word)
  
  print(secret_word)

  cat("\n\n######################################################################### \n\n")
  cat("Bienvenu dans le pendu, faites tout possible pour ne pas être pendu \n")
  cat("Veuillez déviner le bon mot avant d' être pendu.")
  cat("\n\n######################################################################### \n")

  while (remaining_attempts > 0) {
    cat("\n\n##########\n")
    cat("Mot à déviner: ", display_hidden_word(secret_word, guessed_letters))
    cat(paste("Mots choisi déjà: ", paste(attempted_letters, collapse = ", ")))
    cat(paste("Nombre de choix restant: ", remaining_attempts))

    letter <- readline(prompt = "Enter une lettre: ")
    
    # Check if input is valid
    if (length(letter) != 1 | !grepl("[a-zA-Z]", letter)) {
      cat("Veuillez entrer une seule lettre .\n")
      next
    }
    
    if (!(letter %in% attempted_letters)) {
      attempted_letters <- c(attempted_letters, letter)
      
      if (letter %in% secret_word) {
        guessed_letters <- c(guessed_letters, letter)
        cat(paste("Succès '", letter, "' est dans le mot.\n"))
      } else {
        remaining_attempts <- remaining_attempts - 1
        cat(paste("Erreur, '", letter, "' n'est pas dans le mot.\n"))
      }
    }
    cat("\n##########\n")

    # Check for victory
    if (all(secret_word %in% guessed_letters)) {
      cat("\n\n***********************************************************\n")
      cat(paste("Félicitation, Vous avez trouvé toutes les lettres du mot !", secret_word))
      cat("\n***********************************************************\n")
      break
    }
  }
  
  # If game ends without winning
  if (remaining_attempts == 0) {
    cat("\n\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n")
    cat(paste("Vous avez perdu ! Le mot était:", secret_word))
    cat("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n")
  }
}

# Run the game
play()
