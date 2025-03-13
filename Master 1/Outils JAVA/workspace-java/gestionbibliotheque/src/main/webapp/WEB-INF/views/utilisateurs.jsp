<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formulaire Utilisateur</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2><c:if test="${utilisateur.id == null}">Ajouter</c:if><c:if test="${utilisateur.id != null}">Modifier</c:if> un Utilisateur</h2>
        <form action="${pageContext.request.contextPath}/utilisateurs/save" method="post">
            <input type="hidden" name="id" value="${utilisateur.id}">

            <div class="mb-3">
                <label class="form-label">Nom :</label>
                <input type="text" class="form-control" name="nom" value="${utilisateur.nom}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email :</label>
                <input type="email" class="form-control" name="email" value="${utilisateur.email}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Téléphone :</label>
                <input type="text" class="form-control" name="telephone" value="${utilisateur.telephone}" required>
            </div>

            <button type="submit" class="btn btn-success">Enregistrer</button>
            <a href="${pageContext.request.contextPath}/utilisateurs" class="btn btn-secondary">Annuler</a>
        </form>
    </div>
</body>
</html>
