<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion des Candidatss</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Include FontAwesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <!-- Include Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
         
  
         <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img  width="100px" height="60px" src="http://localhost:8086/AutoEcole/images/horizon.png" alt="alt"/></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <a class="nav-link" href="http://localhost:8086/AutoEcole/jsp/client/Home.jsp">Accueil</a>
                </li>
                  <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8086/AutoEcole/inscription">Inscription</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8086/AutoEcole/reservationUser">Réservation du cours</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8086/AutoEcole/jsp/client/resultat.jsp">Consulter resultat</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8086/AutoEcole/jsp/client/settings.jsp">Modifier votre compte</a>
                </li>
                </ul>
                <div class="d-flex">

                <a href="Logout.jsp" class="btn btn-outline-danger me-2">Logout</a> <!-- Change button to link for logout -->
            </div>
            </div>
        </div>
    </nav>
        
        
        
        <div class="container">

            <h1 class="mt-5 text-center">Inscription</h1>
            <div class="row mt-5">
                <div class="col-md-12">
                    <!-- Form to add new payment -->
                    <div class="card">
                        <div class="card-header">
                            Ajouter Candidature
                        </div>
                        <div class="card-body">
                            <!-- Add form elements here -->
                            <c:choose>
                                <c:when test="${not empty edtCandidata}">
                                    <form action="${pageContext.request.contextPath}/inscription" method="post">
                                        <div class="mb-3">
                                            <label for="nom" class="form-label">Nom </label>
                                            <input type="text" name="nom" id="nom" class="form-control" value="${edtCandidat.getNom()}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="prenom" class="form-label">Prénom </label>
                                            <input type="text" name="prenom" id="prenom" class="form-control" value="${edtCandidat.getPrenom()}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="adresse" class="form-label">Adresse </label>
                                            <input type="text" name="adresse" id="adresse" class="form-control" value="${edtCandidat.getAdresse()}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="telephone" class="form-label">Téléphone </label>
                                            <input type="text" name="telephone" id="telephone" class="form-control" value="${edtCandidat.getTelephone()}">
                                            <input type="hidden" name="id_edt1" value="${edtCandidat.id}">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Modifier</button>
                                    </form>
                                </c:when>
                                <c:otherwise>





                                    <form action="${pageContext.request.contextPath}/inscription" method="post">
                                        <div class="mb-3">
                                            <label for="nom" class="form-label">Nom </label>
                                            <input type="text" name="nom" id="nom" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label for="prenom" class="form-label">Prénom </label>
                                            <input type="text" name="prenom" id="prenom" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label for="adresse" class="form-label">Adresse </label>
                                            <input type="text" name="adresse" id="adresse" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label for="telephone" class="form-label">Téléphone </label>
                                            <input type="text" name="telephone" id="telephone" class="form-control">
                                        </div>
                                        <button type="submit" class="btn btn-success">Ajouter</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Include Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>