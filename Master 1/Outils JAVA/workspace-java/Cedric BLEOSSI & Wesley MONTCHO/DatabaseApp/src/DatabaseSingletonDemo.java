
public class DatabaseSingletonDemo {
    public static void main(String[] args) {
        DatabaseSingleton firstBDDInstance = DatabaseSingleton.getInstance();
        DatabaseSingleton secondBDDInstance = DatabaseSingleton.getInstance();


        // Tester l'unicité
        System.out.println("\n\n");
        System.out.println("Nom de la base (firstBDDInstance): " + firstBDDInstance.getName());
        System.out.println("Nom de la base (secondBDDInstance): " + secondBDDInstance.getName());


        // Modifier un enregistrement
        System.out.println("\n\n");
        firstBDDInstance.editRecord(101);
        secondBDDInstance.editRecord(202);

        // Vérifier si les deux instances sont identiques
        System.out.println("\n\n");
        System.out.println(firstBDDInstance == secondBDDInstance ? "Les deux instances sont identiques." : "Les deux instances ne sont pas identiques.");

    }
}
