<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<html>
<head>
    <title>Liste des Livres</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Parkinsans:wght@300..800&display=swap" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-4">
    <div class="d-flex justify-content-between">
        <h2>Les livres</h2>
    </div>

    <!-- ✅ Affichage des livres sous forme de cartes -->
    <div class="row mt-4">
        <c:forEach var="livre" items="${livres}">
            <div class="col-md-4 mb-3">
                <div class="card shadow">
                    <div class="card-body">
                        <h5 class="card-title">${livre.titre}</h5>
                        <p class="card-text"><strong>Auteur :</strong> ${livre.auteur}</p>
                        <p class="card-text"><strong>Genre :</strong> ${livre.genre}</p>
                        <p class="card-text"><strong>Année :</strong> ${livre.anneePublication}</p>
                        <p class="card-text"><strong>Disponibilité :</strong>
                            <c:choose>
                                <c:when test="${livre.disponibilite}">
                                    <span class="badge bg-success">Disponible</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-danger">Indisponible</span>
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <button class="btn btn-warning btn-sm" onclick="modifierLivre(${livre.id})">Modifier</button>
                        <a href="${pageContext.request.contextPath}/livres/supprimer/${livre.id}" class="btn btn-danger btn-sm">Supprimer</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- ✅ Popup -->
<div id="modalContainer"></div>

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
