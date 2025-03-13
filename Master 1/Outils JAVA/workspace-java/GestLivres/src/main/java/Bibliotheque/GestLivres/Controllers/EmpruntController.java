package Bibliotheque.GestLivres.Controllers;

import Bibliotheque.GestLivres.Entities.Emprunt;
import Bibliotheque.GestLivres.Entities.Livre;
import Bibliotheque.GestLivres.Entities.Utilisateur;
import Bibliotheque.GestLivres.Repository.EmpruntRepository;
import Bibliotheque.GestLivres.Repository.LivreRepository;
import Bibliotheque.GestLivres.Repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/emprunts")
public class EmpruntController {

    @Autowired
    private EmpruntRepository empruntRepository;

    @Autowired
    private LivreRepository livreRepository;

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    // ✅ 1. Affichage de la liste des emprunts
    @GetMapping("listes")
    public String afficherEmprunts(Model model) {
        List<Emprunt> emprunts = empruntRepository.findAll();
        model.addAttribute("emprunts", emprunts);
        return "afficheremprunt";
    }

    // ✅ 2. Charger le popup d’ajout d’emprunt
    @GetMapping("/ajoutPopup")
    public String afficherPopupAjout(Model model) {
        model.addAttribute("emprunt", new Emprunt());
        model.addAttribute("livres", livreRepository.findAll());
        model.addAttribute("utilisateurs", utilisateurRepository.findAll());
        return "ajouteremprunt";
    }

    // ✅ 3. Ajouter un emprunt
    @PostMapping("/ajouter")
    public String ajouterEmprunt(@RequestParam("dateRetour") @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateRetour,
                                 @RequestParam("status") String status,
                                 @RequestParam("livre_id") Long livreId,
                                 @RequestParam("utilisateur_id") Long utilisateurId) {
        // Vérification si les ID existent bien
        if (livreId == null || utilisateurId == null) {
            return "redirect:/emprunts/ajoutPopup?error=missing_params"; // Redirection en cas d'erreur
        }

        Optional<Livre> livreOpt = livreRepository.findById(livreId);
        Optional<Utilisateur> utilisateurOpt = utilisateurRepository.findById(utilisateurId);

        if (livreOpt.isPresent() && utilisateurOpt.isPresent()) {
            Emprunt emprunt = new Emprunt();
            emprunt.setDateRetour(dateRetour);
            emprunt.setStatus(status);
            emprunt.setLivre(livreOpt.get());
            emprunt.setUtilisateur(utilisateurOpt.get());

            empruntRepository.save(emprunt);
        }

        return "redirect:/emprunts/listes";
    }


    // ✅ 4. Supprimer un emprunt
    @GetMapping("/supprimer/{id}")
    public String supprimerEmprunt(@PathVariable Long id) {
        empruntRepository.deleteById(id);
        return "redirect:/emprunts/listes";
    }

    // ✅ 5. Charger le popup de modification
    @GetMapping("/modifierPopup/{id}")
    public String afficherPopupModification(@PathVariable Long id, Model model) {
        Optional<Emprunt> emprunt = empruntRepository.findById(id);
        if (emprunt.isPresent()) {
            model.addAttribute("emprunt", emprunt.get());
            model.addAttribute("livres", livreRepository.findAll());
            model.addAttribute("utilisateurs", utilisateurRepository.findAll());
            return "modifieremprunt";
        }
        return "redirect:/emprunts/listes";
    }

    // ✅ 6. Enregistrer la modification d’un emprunt
    @PostMapping("/modifier/{id}")
    public String modifierEmprunt(@PathVariable Long id, @ModelAttribute Emprunt empruntModifie) {
        Optional<Emprunt> empruntExistant = empruntRepository.findById(id);
        if (empruntExistant.isPresent()) {
            Emprunt emprunt = empruntExistant.get();
            emprunt.setDateRetour(empruntModifie.getDateRetour());
            emprunt.setStatus(empruntModifie.getStatus());
            emprunt.setLivre(empruntModifie.getLivre());
            emprunt.setUtilisateur(empruntModifie.getUtilisateur());
            empruntRepository.save(emprunt);
        }
        return "redirect:/emprunts/listes";
    }
}
