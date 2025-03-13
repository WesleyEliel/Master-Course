package Bibliotheque.GestLivres.Controllers;

import Bibliotheque.GestLivres.Entities.Utilisateur;
import Bibliotheque.GestLivres.Repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/utilisateurs")
public class UtilisateurController {

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    // ✅ 1. Affichage de la liste des utilisateurs
    @GetMapping("listes")
    public String afficherGestionUtilisateurs(Model model) {
        List<Utilisateur> utilisateurs = utilisateurRepository.findAll();
        model.addAttribute("utilisateur", utilisateurs);
        return "afficherutilisateur"; // Charge la page JSP principale
    }

    // ✅ 2. Charger le popup d’ajout d’utilisateur
    @GetMapping("/ajoutPopup")
    public String afficherPopupAjout(Model model) {
        model.addAttribute("utilisateur", new Utilisateur());
        return "ajouterutilisateur"; // Retourne uniquement le popup
    }

    // ✅ 3. Ajouter un utilisateur
    @PostMapping("/ajouter")
    public String ajouter(@ModelAttribute("utilisateur") Utilisateur utilisateur) {
        utilisateurRepository.save(utilisateur); 
        return "redirect:/utilisateurs/listes";
    }

    // ✅ 4. Supprimer un utilisateur
    @GetMapping("/supprimer/{id}")
    public String supprimerUtilisateur(@PathVariable Long id) {
        utilisateurRepository.deleteById(id);
        return "redirect:/utilisateurs/listes";
    }

    // ✅ 5. Charger le formulaire de modification (popup)
    @GetMapping("/modifierPopup/{id}")
    public String afficherPopupModification(@PathVariable Long id, Model model) {
        Optional<Utilisateur> utilisateur = utilisateurRepository.findById(id);
        if (utilisateur.isPresent()) {
            model.addAttribute("utilisateur", utilisateur.get());
            return "modifierutilisateur"; // Retourne uniquement le popup
        }
        return "redirect:/utilisateurs/listes"; // Redirection si l'utilisateur n’existe pas
    }

    // ✅ 6. Enregistrer la modification d’un utilisateur
    @PostMapping("/modifier/{id}")
    public String modifierUtilisateur(@PathVariable Long id, @ModelAttribute Utilisateur utilisateurModifie) {
        Optional<Utilisateur> utilisateurExistant = utilisateurRepository.findById(id);
        if (utilisateurExistant.isPresent()) {
            Utilisateur utilisateur = utilisateurExistant.get();
            utilisateur.setNom(utilisateurModifie.getNom());
            utilisateur.setEmail(utilisateurModifie.getEmail());
            utilisateur.setNumTelephone(utilisateurModifie.getNumTelephone());
            utilisateur.setRole(utilisateurModifie.getRole());
            utilisateurRepository.save(utilisateur);
        }
        return "redirect:/utilisateurs/listes";
    }
}
