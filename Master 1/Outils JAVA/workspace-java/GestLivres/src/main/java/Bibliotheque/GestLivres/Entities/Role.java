package Bibliotheque.GestLivres.Entities;

public enum Role {
    ADMIN("Admin"),
    BIBLIOTHECAIRE("Bibliothécaire"),
    LECTEUR("Lecteur");

    private final String displayName;

    Role(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static Role fromString(String text) {
        for (Role role : Role.values()) {
            if (role.displayName.equalsIgnoreCase(text)) {
                return role;
            }
        }
        throw new IllegalArgumentException("Aucun rôle trouvé pour la valeur : " + text);
    }
}
