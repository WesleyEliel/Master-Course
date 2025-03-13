<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Modal Ajout Emprunt -->
<div class="modal fade" id="ajoutEmpruntModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title">Ajouter un Emprunt</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/emprunts/ajouter" modelAttribute="emprunt" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <label class="form-label">Date de Retour :</label>
                            <input type="date" name="dateRetour" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Statut :</label>
                            <select name="status" class="form-select">
                                <option value="En cours">En cours</option>
                                <option value="Terminé">Terminé</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                            <div class="col-md-6">
                                <label class="form-label">Livre :</label>
                                <select name="livre_id" class="form-select" required>
                                    <option value="">-- Sélectionner un Livre --</option>
                                    <c:forEach var="livre" items="${livres}">
                                        <option value="${livre.id}">${livre.titre}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        <div class="col-md-6">
                            <label class="form-label">Utilisateur :</label>
                            <select name="utilisateur_id" class="form-select">
                                <c:forEach var="utilisateur" items="${utilisateurs}">
                                    <option value="${utilisateur.id}">${utilisateur.nom}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary">Ajouter</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
