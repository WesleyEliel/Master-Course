<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="modifierEmpruntModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning text-dark">
                <h5 class="modal-title">Modifier l'Emprunt</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="editEmpruntForm" action="${pageContext.request.contextPath}/emprunts/modifier/${emprunt.id}" method="post">
                    <input type="hidden" id="editId" name="id"/>
                    <div class="row">
                        <div class="col-md-6">
                            <label class="form-label">Date de Retour :</label>
                            <input type="date" id="editDateRetour" name="dateRetour" class="form-control" required
                             value="<fmt:formatDate value='${emprunt.dateRetour}' pattern='yyyy-MM-dd' />"
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Statut :</label>
                            <select id="editStatus" name="status" class="form-select">
                                <option value="En cours">En cours</option>
                                <option value="Terminé">Terminé</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label class="form-label">Livre :</label>
                            <select id="editLivre" name="livre.id" class="form-select">
                                <c:forEach var="livre" items="${livres}">
                                    <option value="${livre.id}">${livre.titre}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Utilisateur :</label>
                            <select id="editUtilisateur" name="utilisateur.id" class="form-select">
                                <c:forEach var="utilisateur" items="${utilisateurs}">
                                    <option value="${utilisateur.id}">${utilisateur.nom}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary">Modifier</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
   function openEditModal(id, dateRetour, status, livreId, utilisateurId) {
       document.getElementById('editId').value = id;

       // Formatter la date au format YYYY-MM-DD pour HTML
       let formattedDate = new Date(dateRetour).toISOString().split('T')[0];
       document.getElementById('editDateRetour').value = formattedDate;

       document.getElementById('editStatus').value = status;
       document.getElementById('editLivre').value = livreId;
       document.getElementById('editUtilisateur').value = utilisateurId;

       // Ouvrir la fenêtre modale
       var editModal = new bootstrap.Modal(document.getElementById('modifierEmpruntModal'));
       editModal.show();
   }

</script>
