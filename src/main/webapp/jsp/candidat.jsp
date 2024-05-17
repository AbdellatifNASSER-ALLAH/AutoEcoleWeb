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
       <%@ include file="navBar.jsp" %>
    <div class="container">
        
           <h1 class="mt-5 text-center">Gestion des Candidats</h1>
        <div class="row mt-5">
            <div class="col-md-6">
                <!-- Form to add new payment -->
                <div class="card">
                    <div class="card-header">
                        Ajouter un Candidats
                    </div>
                    <div class="card-body">
                        <!-- Add form elements here -->
               <c:choose>
        <c:when test="${not empty edtCandidat}">
            <form action="${pageContext.request.contextPath}/candidat" method="post">
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
            
            
           
           
  
            <form action="${pageContext.request.contextPath}/candidat" method="post">
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
            <div class="col-md-6">
                <!-- Table to display payments -->
                <div class="card">
                    <div class="card-header">
                        
                        
                        Liste des Candidats
                    </div>
                    <div class="card-body">
                        <!-- Display table here -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom</th>
                                    <th>Prenom</th>
                                    <th>Address</th>
                                    <th>Telephone</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty listeCandidats}">
                            <tr>
                                <td colspan="7" class="text-center">Aucun Candidat trouvé.</td>
                            </tr>
                        </c:if>

      <c:forEach var="candidat" items="${listeCandidats}">
        <tr>
            <td>${candidat.getId()}</td>
              <td>${candidat.getNom()}</td>
            <td>${candidat.getPrenom()}</td>
            <td>${candidat.getAdresse()}</td>
            <td>${candidat.getTelephone()}</td>
                    <td><a href="http://localhost:8086/AutoEcole/candidat?id_edt=${candidat.getId()}"><i class="fa fa-edit"></i></a></td>
                                <td><a href="http://localhost:8086/AutoEcole/candidat?id_del=${candidat.getId()}"><i class="fa fa-trash text-danger"></i></a></td>
                        
        </tr>
    </c:forEach>
                              
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>