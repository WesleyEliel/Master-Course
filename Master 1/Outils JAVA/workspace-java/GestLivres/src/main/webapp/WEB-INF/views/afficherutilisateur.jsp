<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<html>
<head>
    <title>Gestion des Utilisateurs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Parkinsans:wght@300..800&display=swap" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-4">
    <div class="d-flex justify-content-between">
        <h2> Les utilisateurs</h2>-
    </div>

    <!-- ✅ Affichage des Utilisateurs -->
    <table class="table table-striped mt-3">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Email</th>
                <th>Téléphone</th>
                <th>Rôle</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="utilisateur" items="${utilisateur}">
                <tr>
                    <td>${utilisateur.id}</td>
                    <td>${utilisateur.nom}</td>
                    <td>${utilisateur.email}</td>
                    <td>${utilisateur.numTelephone}</td>
                    <td>${utilisateur.role}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="modifierUtilisateur(${utilisateur.id})">Modifier</button>
                        <a href="${pageContext.request.contextPath}/utilisateurs/supprimer/${utilisateur.id}" class="btn btn-danger btn-sm">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- ✅ Popup -->
<div id="modalContainer"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById("btnAjoutUtilisateur").addEventListener("click", function() {
        fetch("${pageContext.request.contextPath}/utilisateurs/ajoutPopup")
            .then(response => response.text())
            .then(html => {
                document.getElementById("modalContainer").innerHTML = html;
                let modal = new bootstrap.Modal(document.getElementById("ajoutUtilisateurModal"));
                modal.show();
            });
    });

    function modifierUtilisateur(id) {
        fetch("${pageContext.request.contextPath}/utilisateurs/modifierPopup/" + id)
            .then(response => response.text())
            .then(html => {
                document.getElementById("modalContainer").innerHTML = html;
                let modal = new bootstrap.Modal(document.getElementById("modifierUtilisateurModal"));
                modal.show();
            });
    }
</script>

</body>
</html>
