package main;

import designparttern.BaseDeDonnees;

import java.util.List;

public class ExecutionMySQL {

    public static void main(String[] args) {
        BaseDeDonnees bdd = BaseDeDonnees.getInstance();
        List<String> tables = bdd.createTable("students");

        System.out.println("Nombre de tables dans la base de données = " + tables.size());


        tables = bdd.createTable("universities");
        System.out.println("Nombre de tables dans la base de données = " + tables.size());
    }
}
