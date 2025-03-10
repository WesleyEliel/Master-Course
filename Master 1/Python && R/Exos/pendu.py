import random

def display_hidden_word(word, lettres_trouvees):
    return "".join([letter if letter in lettres_trouvees else "_" for letter in word])

def play():

    # List of possible words
    words = [
        "python", "wesley", "ordinateur", "chocolat", "grenouille",
        "cuisine", "aventure", "papillon", "voyage",
        "soleil", "guitare", "musique", "montagne", "nuage"
        ]
    
    # Sélectioner un mot au hasard 
    secret_word = random.choice(words)  # Randomly select a word

    guessed_letters = set()
    attempted_letters = set()
    # Nombre de choix possibles
    remaining_attempts = len(secret_word) 
    print(secret_word)

    print("\n\n######################################################################### \n\n")
    print("Bienvenu dans le pendu, faites tout possible pour ne pas être pendu \n")
    print("Veuillez déviner le bon mot avant d' être pendu.")
    print("\n\n######################################################################### \n")

    while remaining_attempts > 0:
        print("\n\n##########")
        print("\nMot à déviner: ", display_hidden_word(secret_word, guessed_letters))
        print(f"Mots choisi déjà: {', '.join(sorted(attempted_letters))}")
        print(f"Nombre de choix restant: {remaining_attempts}")

        letter = input("Enter une lettre: ").lower()

        # Vérifications
        if len(letter) != 1 or not letter.isalpha():
            print("Veuillez entrer une seule lettre .")
            continue
        if letter in attempted_letters:
            print("Vous avez déjà choisi cette lettre.")
            continue

        attempted_letters.add(letter)

        if letter in secret_word:
            guessed_letters.add(letter)
            print(f"Succès '{letter}' est das le mot.")
        else:
            remaining_attempts -= 1
            print(f"Erreur, '{letter}' n' est pas dans le mot.")
        print("\n##########")

        # Check for victory
        if all(l in guessed_letters for l in secret_word):
            print("\n\n***********************************************************\n")
            print("Félicitation, Vous avez trouvé tout les lettres du mot !", secret_word)
            print("\n***********************************************************\n")
            break
    else:
        print("\n\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n")
        print("Vous avez perdu ! Le mot était:", secret_word)
        print("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n")

# Run the game
if __name__ == "__main__":
    play()
