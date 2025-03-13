<%@ page contentType="text/html;charset=UTF-8" language="java" %>



    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- ✅ Popup Ajout Livre -->
<div class="modal fade" id="ajoutLivreModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title">Ajouter un Livre</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/livres/ajouter" method="post">
                    <div class="mb-3">
                        <label for="titre" class="form-label">Titre :</label>
                        <input type="text" id="titre" name="titre" class="form-control" placeholder="Titre du livre" required>
                    </div>
                    <div class="mb-3">
                        <label for="auteur" class="form-label">Auteur :</label>
                        <input type="text" id="auteur" name="auteur" class="form-control" placeholder="Auteur du livre" required>
                    </div>
                    <div class="mb-3">
                        <label for="genre" class="form-label">Genre :</label>
                        <select id="genre" name="genre" class="form-select">
                            <option value="Roman">Roman</option>
                            <option value="Science-Fiction">Science-Fiction</option>
                            <option value="Fantaisie">Fantaisie</option>
                            <option value="Historique">Historique</option>
                            <option value="Policier">Policier</option>
                            <option value="Biographie">Biographie</option>
                            <option value="Autre">Autre</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="anneePublication" class="form-label">Année de Publication :</label>
                        <input type="date" id="anneePublication" name="anneePublication" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="disponibilite" class="form-label">Disponibilité :</label>
                        <select id="disponibilite" name="disponibilite" class="form-select">
                            <option value="true">Disponible</option>
                            <option value="false">Indisponible</option>
                        </select>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Ajouter</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById("btnAjoutLivre").addEventListener("click", function() {
        fetch("${pageContext.request.contextPath}/livres/ajoutPopup")
            .then(response => response.text())
            .then(html => {
                document.getElementById("modalContainer").innerHTML = html;
                let modal = new bootstrap.Modal(document.getElementById("ajoutLivreModal"));
                modal.show();
            });
    });
</script>
