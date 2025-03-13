<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e6afa4;">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/livres">📚 Librairie</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <!-- Livres -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="livresDropdown" role="button" data-bs-toggle="dropdown">
                        📖 Livres
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/livres/listes">Consulter</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/livres/listes#ajoutLivreModal" id="btnAjoutLivre" >Ajouter</a></li>
                    </ul>
                </li>

                <!-- Emprunts -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="empruntsDropdown" role="button" data-bs-toggle="dropdown">
                        🔄 Emprunts
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/emprunts/listes#ajoutEmpruntModal">Consulter</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/emprunts/listes#ajoutEmpruntModal" id="btnAjoutEmprunt">Ajouter</a></li>
                    </ul>
                </li>

                <!-- Utilisateurs -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="utilisateursDropdown" role="button" data-bs-toggle="dropdown">
                        👥 Utilisateurs
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/utilisateurs/listes">Consulter</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/utilisateurs/listes#ajoutUtilisateurModal" id="btnAjoutUtilisateur">Ajouter</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
