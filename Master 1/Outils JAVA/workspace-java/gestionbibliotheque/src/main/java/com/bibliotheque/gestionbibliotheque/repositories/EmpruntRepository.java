package com.bibliotheque.gestionbibliotheque.repositories;

import com.bibliotheque.gestionbibliotheque.models.Emprunt;
import com.bibliotheque.gestionbibliotheque.models.Utilisateur;
import com.bibliotheque.gestionbibliotheque.models.Livre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface EmpruntRepository extends JpaRepository<Emprunt, Long> {
    List<Emprunt> findByUtilisateur(Utilisateur utilisateur);
    List<Emprunt> findByLivre(Livre livre);
    List<Emprunt> findByStatut(String statut);
}
