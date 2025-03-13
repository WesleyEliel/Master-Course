package com.bibliotheque.gestionbibliotheque.controllers;

import com.bibliotheque.gestionbibliotheque.models.Livre;
import com.bibliotheque.gestionbibliotheque.repositories.LivreRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/livres")
public class LivreController {

    private final LivreRepository livreRepository;

    public LivreController(LivreRepository livreRepository) {
        this.livreRepository = livreRepository;
    }

    @GetMapping
    public String afficherTousLesLivres(Model model) {
        List<Livre> livres = livreRepository.findAll();
        model.addAttribute("livres", livres);
        return "livres";
    }

    @PostMapping("/ajouter")
    public String ajouterLivre(@ModelAttribute Livre livre) {
        livreRepository.save(livre);
        return "redirect:/livres";
    }

    @GetMapping("/modifier/{id}")
    public String formulaireModification(@PathVariable Long id, Model model) {
        Optional<Livre> livre = livreRepository.findById(id);
        if (livre.isPresent()) {
            model.addAttribute("livre", livre.get());
            return "modifierLivre";
        }
        return "redirect:/livres";
    }

    @PostMapping("/modifier/{id}")
    public String modifierLivre(@PathVariable Long id, @ModelAttribute Livre livre) {
        if (livreRepository.existsById(id)) {
            livre.setId(id);  // Assigner l'ID existant
            livreRepository.save(livre);
        }
        return "redirect:/livres";
    }

    @GetMapping("/supprimer/{id}")
    public String supprimerLivre(@PathVariable Long id) {
        livreRepository.deleteById(id);
        return "redirect:/livres";
    }
}
