public class DatabaseSingleton {
    private static DatabaseSingleton instance; // Instance unique
    private static final String name = "DATABASE";
    private static int record = 0;

    // Constructeur privé
    private DatabaseSingleton() {
    }

    public static DatabaseSingleton getInstance() {
        if (instance == null) {
            instance = new DatabaseSingleton();
        }
        return instance;
    }

    // Méthode pour éditer un enregistrement
    public void editRecord(int record) {
        System.out.println("Enregistrement " + record + " en cours de modification dans la base " + name);
    }

    // Méthode pour obtenir le nom de la BDD
    public String getName() {
        return name;
    }
}
