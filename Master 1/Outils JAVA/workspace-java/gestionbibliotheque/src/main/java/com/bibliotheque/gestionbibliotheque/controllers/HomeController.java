package com.bibliotheque.gestionbibliotheque.controllers;
import com.bibliotheque.gestionbibliotheque.models.Livre;
import com.bibliotheque.gestionbibliotheque.services.LivreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller

public class HomeController {

    @Autowired
    private LivreService livreService;

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/livres")
    public String livres(Model model) {
        List<Livre> livres = livreService.getAllLivres();
        model.addAttribute("livres", livres);
        return "livres";
    }
}

