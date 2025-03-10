package designparttern;

import java.util.ArrayList;
import java.util.List;

public class BaseDeDonnees {
    private static BaseDeDonnees instance;
    private static List<String> tables;

    private BaseDeDonnees() {
        tables = new ArrayList<String>();
    }

    public List<String> createTable(String tableName) {
        tables.add(tableName);
        return tables;
    }

    public static BaseDeDonnees getInstance() {
        if (instance == null) {
            return new BaseDeDonnees();
        }
        return instance;
    }
}
