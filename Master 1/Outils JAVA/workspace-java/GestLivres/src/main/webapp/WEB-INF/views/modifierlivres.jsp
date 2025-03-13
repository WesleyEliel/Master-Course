<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ✅ Popup Modification Livre -->
<div class="modal fade" id="modifierLivreModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning text-white">
                <h5 class="modal-title">Modifier le Livre</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/livres/modifier/${livre.id}" method="post">
                    <input type="hidden" name="id" value="${livre.id}">

                    <div class="mb-3">
                        <label for="titre" class="form-label">Titre :</label>
                        <input type="text" id="titre" name="titre" class="form-control" value="${livre.titre}" required>
                    </div>

                    <div class="mb-3">
                        <label for="auteur" class="form-label">Auteur :</label>
                        <input type="text" id="auteur" name="auteur" class="form-control" value="${livre.auteur}" required>
                    </div>

                    <div class="mb-3">
                        <label for="genre" class="form-label">Genre :</label>
                        <select id="genre" name="genre" class="form-select">
                            <option value="Roman" <c:if test="${livre.genre == 'Roman'}">selected</c:if>>Roman</option>
                            <option value="Science-Fiction" <c:if test="${livre.genre == 'Science-Fiction'}">selected</c:if>>Science-Fiction</option>
                            <option value="Fantaisie" <c:if test="${livre.genre == 'Fantaisie'}">selected</c:if>>Fantaisie</option>
                            <option value="Historique" <c:if test="${livre.genre == 'Historique'}">selected</c:if>>Historique</option>
                            <option value="Policier" <c:if test="${livre.genre == 'Policier'}">selected</c:if>>Policier</option>
                            <option value="Biographie" <c:if test="${livre.genre == 'Biographie'}">selected</c:if>>Biographie</option>
                            <option value="Autre" <c:if test="${livre.genre == 'Autre'}">selected</c:if>>Autre</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="anneePublication" class="form-label">Année de Publication :</label>
                        <input type="date" id="anneePublication" name="anneePublication" class="form-control" value="${livre.anneePublication}">
                    </div>

                    <div class="mb-3">
                        <label for="disponibilite" class="form-label">Disponibilité :</label>
                        <select id="disponibilite" name="disponibilite" class="form-select">
                            <option value="true" <c:if test="${livre.disponibilite}">selected</c:if>>Disponible</option>
                            <option value="false" <c:if test="${!livre.disponibilite}">selected</c:if>>Indisponible</option>
                        </select>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Modifier</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function modifierLivre(id) {
        fetch("${pageContext.request.contextPath}/livres/modifierPopup/" + id)
            .then(response => response.text())
            .then(html => {
                document.getElementById("modalContainer").innerHTML = html;
                let modal = new bootstrap.Modal(document.getElementById("modifierLivreModal"));
                modal.show();
            });
    }
</script>

</body>
</html>

