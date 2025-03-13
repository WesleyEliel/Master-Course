package Bibliotheque.GestLivres.Controllers;

import Bibliotheque.GestLivres.Entities.Livre;
import Bibliotheque.GestLivres.Repository.LivreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/livres")
public class LivreController {

    @Autowired
    private LivreRepository livreRepository;

    // ✅ 1. Affichage de la liste des livres
    @GetMapping("/listes")
    public String afficherGestionLivres(Model model) {
        List<Livre> livres = livreRepository.findAll();
        model.addAttribute("livres", livres);
        return "afficherlivres"; // Charge la page JSP principale
    }

    // ✅ 2. Charger le popup d’ajout de livre
    @GetMapping("/ajoutPopup")
    public String afficherPopupAjout(Model model) {
        model.addAttribute("livre", new Livre());
        return "ajouterlivres"; // Retourne uniquement le popup
    }

    // ✅ 3. Ajouter un livre
    @PostMapping("/ajouter")
    public String ajouterLivre(@ModelAttribute("livre") Livre livre) {
        livreRepository.save(livre);
        return "redirect:/livres/listes";
    }

    // ✅ 4. Supprimer un livre
    @GetMapping("/supprimer/{id}")
    public String supprimerLivre(@PathVariable Long id) {
        livreRepository.deleteById(id);
        return "redirect:/livres/listes";
    }

    // ✅ 5. Charger le formulaire de modification (popup)
    @GetMapping("/modifierPopup/{id}")
    public String afficherPopupModification(@PathVariable Long id, Model model) {
        Optional<Livre> livre = livreRepository.findById(id);
        if (livre.isPresent()) {
            model.addAttribute("livre", livre.get());
            return "modifierlivres"; // Retourne uniquement le popup
        }
        return "redirect:/livres/listes"; // Redirection si le livre n’existe pas
    }

    // ✅ 6. Enregistrer la modification d’un livre
    @PostMapping("/modifier/{id}")
    public String modifierLivre(@PathVariable Long id, @ModelAttribute Livre livreModifie) {
        Optional<Livre> livreExistant = livreRepository.findById(id);
        if (livreExistant.isPresent()) {
            Livre livre = livreExistant.get();
            livre.setTitre(livreModifie.getTitre());
            livre.setAuteur(livreModifie.getAuteur());
            livre.setGenre(livreModifie.getGenre());
            livre.setAnneePublication(livreModifie.getAnneePublication());
            livre.setDisponibilite(livreModifie.getDisponibilite());
            livreRepository.save(livre);
        }
        return "redirect:/livres/listes";
    }
}
