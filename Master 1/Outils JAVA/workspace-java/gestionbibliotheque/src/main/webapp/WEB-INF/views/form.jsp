<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formulaire Livre</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>${livre.id == null ? 'Ajouter un Livre' : 'Modifier le Livre'}</h2>
        <form action="${pageContext.request.contextPath}/livres/save" method="post" modelAttribute="livre">
            <input type="hidden" name="id" value="${livre.id}" />
            <div class="mb-3">
                <label for="titre" class="form-label">Titre</label>
                <input type="text" class="form-control" id="titre" name="titre" value="${livre.titre}" required>
            </div>
            <div class="mb-3">
                <label for="auteur" class="form-label">Auteur</label>
                <input type="text" class="form-control" id="auteur" name="auteur" value="${livre.auteur}" required>
            </div>
            <div class="mb-3">
                <label for="genre" class="form-label">Genre</label>
                <input type="text" class="form-control" id="genre" name="genre" value="${livre.genre}" required>
            </div>
            <div class="mb-3">
                <label for="anneePublication" class="form-label">Année de Publication</label>
                <input type="number" class="form-control" id="anneePublication" name="anneePublication" value="${livre.anneePublication}" required>
            </div>
            <div class="mb-3">
                <label for="disponible" class="form-label">Disponible</label>
                <select class="form-control" id="disponible" name="disponible">
                    <option value="true" ${livre.disponible ? 'selected' : ''}>Oui</option>
                    <option value="false" ${!livre.disponible ? 'selected' : ''}>Non</option>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Enregistrer</button>
            <a href="${pageContext.request.contextPath}/livres" class="btn btn-secondary">Annuler</a>
        </form>
    </div>
</body>
</html>
