package com.bibliotheque.gestionbibliotheque.controllers;

import com.bibliotheque.gestionbibliotheque.models.Emprunt;
import com.bibliotheque.gestionbibliotheque.models.Utilisateur;
import com.bibliotheque.gestionbibliotheque.services.EmpruntService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/emprunts")

public class EmpruntController {

    @Autowired
    private EmpruntService empruntService;

    @GetMapping
    public List<Emprunt> getAllEmprunts() {
        return empruntService.getAllEmprunts();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Emprunt> getEmpruntById(@PathVariable Long id) {
        Optional<Emprunt> emprunt = empruntService.getEmpruntById(id);
        return emprunt.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public Emprunt ajouterEmprunt(@RequestBody Emprunt emprunt) {
        return empruntService.ajouterEmprunt(emprunt);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> supprimerEmprunt(@PathVariable Long id) {
        empruntService.supprimerEmprunt(id);
        return ResponseEntity.noContent().build();
    }
}

