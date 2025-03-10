import random

def generate_number():
    return random.randint(1, 100)

def guess_my_number():
    print("\n\n######################################################################### \n\n")
    print("Bienvenue au jeu du plus ou moins !")
    print("Je choisi un nombre entre 1 et 100.")
    print("Essayez de le deviner en choisissnat des numeros ou aller à la fin avec la command 'fin'.")

    print("\n\n######################################################################### \n\n")
    
    secret_number = generate_number()
    attempts = 0

    while True:
        print("\n\n###############\n\n")
        user_input = input("Entrez votre choix: ")

        if user_input.lower() == 'fin':
            print("\n\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n")
            print(f"Vous ne savez plus quoi choisir ! D' accord, le nombre était {secret_number}")
            print("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n\n")
            break

        # Validate input
        if not user_input.isdigit():
            print("Veuillez entrer un nombre entier.")
            continue

        estimate = int(user_input)

        attempts += 1

        if estimate > secret_number:
            print("entrez un nombre plus petit! ")
            print("\n\n###############\n")
        elif estimate < secret_number:
            print("Entrez un nombre plus grand !")
            print("\n\n###############\n")
        else:
            print("\n\n***********************************************************\n")
            print(f"Félicitations ! Vous avez trouvé le nombre en {attempts} tentatives.")
            print("\n\n***********************************************************\n")
            break

if __name__ == "__main__":
    guess_my_number()