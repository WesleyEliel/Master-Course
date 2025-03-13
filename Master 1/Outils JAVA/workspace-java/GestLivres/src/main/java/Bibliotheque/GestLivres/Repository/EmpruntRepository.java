package Bibliotheque.GestLivres.Repository;

import Bibliotheque.GestLivres.Entities.Emprunt;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EmpruntRepository extends JpaRepository<Emprunt,Long> {
    List<Emprunt> findByUtilisateurId(Long utilisateurId);
}
