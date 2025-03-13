package com.bibliotheque.gestionbibliotheque.models;
import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
public class Emprunt {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "utilisateur_id", nullable = false)
    private Utilisateur utilisateur;

    @ManyToOne
    @JoinColumn(name = "livre_id", nullable = false)
    private Livre livre;

    private LocalDate dateEmprunt;
    private LocalDate dateRetourPrevue;
    private String statut; // "en cours" ou "terminé"

    // Constructeurs
    public Emprunt() {}

    public Emprunt(Utilisateur utilisateur, Livre livre, LocalDate dateEmprunt, LocalDate dateRetourPrevue) {
        this.utilisateur = utilisateur;
        this.livre = livre;
        this.dateEmprunt = dateEmprunt;
        this.dateRetourPrevue = dateRetourPrevue;
        this.statut = "en cours"; // Par défaut, l'emprunt est en cours
    }

    // Getters et Setters
    public Long getId() { return id; }

    public Utilisateur getUtilisateur() { return utilisateur; }
    public void setUtilisateur(Utilisateur utilisateur) { this.utilisateur = utilisateur; }

    public Livre getLivre() { return livre; }
    public void setLivre(Livre livre) { this.livre = livre; }

    public LocalDate getDateEmprunt() { return dateEmprunt; }
    public void setDateEmprunt(LocalDate dateEmprunt) { this.dateEmprunt = dateEmprunt; }

    public LocalDate getDateRetourPrevue() { return dateRetourPrevue; }
    public void setDateRetourPrevue(LocalDate dateRetourPrevue) { this.dateRetourPrevue = dateRetourPrevue; }

    public String getStatut() { return statut; }
    public void setStatut(String statut) { this.statut = statut; }

}
