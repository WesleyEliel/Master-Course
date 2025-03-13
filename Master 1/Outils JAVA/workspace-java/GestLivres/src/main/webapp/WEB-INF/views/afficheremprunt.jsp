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
        <h2>Les emprunts</h2>
    </div>

   <div class="container mt-5">

       <div class="row">
           <c:forEach var="emprunt" items="${emprunts}">
               <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                   <div class="card shadow">
                       <div class="card-body">
                           <h5 class="card-title text-dark">📖 ${emprunt.livre.titre}</h5>
                           <p class="card-text"><strong>👤 Utilisateur:</strong> ${emprunt.utilisateur.nom}</p>
                           <p class="card-text"><strong>📅 Date Retour:</strong> ${emprunt.dateRetour}</p>
                           <p class="card-text">
                               <strong>🔖 Statut:</strong>
                               <span class="badge ${emprunt.status == 'En cours' ? 'bg-warning' : 'bg-success'}">
                                   ${emprunt.status}
                               </span>
                           </p>
                           <div class="d-flex justify-content-between mt-3">
                               <button class="btn btn-warning btn-sm"
                                       onclick="modifierEmprunt('${emprunt.id}', '${emprunt.dateRetour}', '${emprunt.status}', '${emprunt.livre.id}', '${emprunt.utilisateur.id}')">
                                   Modifier
                               </button>
                               <a href="${pageContext.request.contextPath}/emprunts/supprimer/${emprunt.id}"
                                  class="btn btn-danger btn-sm"
                                  onclick="return confirm('Voulez-vous vraiment supprimer cet emprunt ?')">
                                   Supprimer
                               </a>
                           </div>
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
    document.getElementById("btnAjoutEmprunt").addEventListener("click", function() {
        fetch("${pageContext.request.contextPath}/emprunts/ajoutPopup")
            .then(response => response.text())
            .then(html => {
                document.getElementById("modalContainer").innerHTML = html;
                let modal = new bootstrap.Modal(document.getElementById("ajoutEmpruntModal"));
                modal.show();
            });
    });

    function modifierEmprunt(id) {
        fetch("${pageContext.request.contextPath}/emprunts/modifierPopup/" + id)
            .then(response => response.text())
            .then(html => {
                document.getElementById("modalContainer").innerHTML = html;
                let modal = new bootstrap.Modal(document.getElementById("modifierEmpruntModal"));
                modal.show();
            });
    }
</script>

</body>
</html>

