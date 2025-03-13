package Bibliotheque.GestLivres.Repository;

import Bibliotheque.GestLivres.Entities.Livre;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LivreRepository extends JpaRepository<Livre,Long> {
    List<Livre> findAll(Sort sort);
}
