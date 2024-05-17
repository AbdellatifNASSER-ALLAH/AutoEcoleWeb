<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion des Cours</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Include FontAwesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            /* Custom CSS for the course management page */
            body {
                background-color: #f8f9fa; /* Light gray background */
            }
            .container {
                margin-top: 50px;
            }
            .card {
                border-radius: 15px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .card-header {
                background-color: #007bff; /* Blue header */
                color: #fff; /* White text */
                border-bottom: none;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
            }
            .card-body {
                padding: 20px;
            }
            .form-label {
                font-weight: bold;
            }
            .btn-primary {
                background-color: #007bff; /* Blue button */
                border-color: #007bff;
            }
            .btn-primary:hover {
                background-color: #0056b3; /* Darker blue on hover */
                border-color: #0056b3;
            }
            .table {
                background-color: #fff; /* White background */
                border-radius: 15px;
            }
            .table th,
            .table td {
                border-top: none; /* Remove top border */
            }
            .table th {
                background-color: #007bff; /* Blue header */
                color: #fff; /* White text */
                border-bottom: none; /* Remove bottom border */
            }
            .table tbody tr:nth-of-type(even) {
                background-color: #f2f2f2; /* Alternate row color */
            }
        </style>
    </head>
    <body>
         <%@ include file="navBar.jsp" %>
        <div class="container">
            <h1 class="mt-5 text-center">Gestion des Cours</h1>
            <div class="row mt-5">
                <div class="col-md-6">
                    <!-- Form to add or edit a course -->
                    <div class="card">
                        <div class="card-header">
                            <c:choose>
                                <c:when test="${not empty edtCours}">
                                    Modifier un Cours
                                </c:when>
                                <c:otherwise>
                                    Ajouter un Cours
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/cours" method="post">
                                <c:if test="${edtCours != null}">
                                    <input type="hidden" name="id" value="${edtCours.getId()}" />
                                </c:if>
                                <div class="mb-3">
                                    <label for="titre" class="form-label">Titre</label>
                                    <input type="text" name="titre" id="titre" class="form-control" value="${edtCours != null ? edtCours.getTitre() : ''}" />
                                </div>
                                <div class="mb-3">
                                    <label for="date_debut" class="form-label">Date Début</label>
                                    <input type="date" name="date_debut" id="date_debut" class="form-control" value="${edtCours != null ? edtCours.getDateDebut() : ''}" />
                                </div>
                                <div class="mb-3">
                                    <label for="date_fin" class="form-label">Date Fin</label>
                                    <input type="date" name="date_fin" id="date_fin" class="form-control" value="${edtCours != null ? edtCours.getDateFin() : ''}" />
                                </div>
                                <div class="mb-3">
                                    <label for="heure_debut" class="form-label">Heure Début</label>
                                    <input type="time" name="heure_debut" id="heure_debut" class="form-control" value="${edtCours != null ? edtCours.getHeureDebut() : ''}" />
                                </div>
                                <div class="mb-3">
                                    <label for="heure_fin" class="form-label">Heure Fin</label>
                                    <input type="time" name="heure_fin" id="heure_fin" class="form-control" value="${edtCours != null ? edtCours.getHeureFin() : ''}" />
                                </div>
                                <div class="mb-3">
                                    <label for="vehicule_id" class="form-label">Véhicule ID</label>
                                    <input type="number" name="vehicule_id" id="vehicule_id" class="form-control" value="${edtCours != null ? edtCours.getVehiculeId() : ''}" />
                                </div>
                                <button type="submit" class="btn btn-primary">Enregistrer</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Table to display courses -->
                    <div class="card">
                        <div class="card-header">
                            Liste des Cours
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Titre</th>
                                        <th>Date Début</th>
                                        <th>Date Fin</th>
                                        <th>Heure Début</th>
                                        <th>Heure Fin</th>
                                        <th>Véhicule ID</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty listeCours}">
                                        <tr>
                                            <td colspan="8" class="text-center">Aucun cours trouvé.</td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="cours" items="${listeCours}">
                                        <tr>
                                            <td>${cours.getId()}</td>
                                            <td>${cours.getTitre()}</td>
                                            <td>${cours.getDateDebut()}</td>
                                            <td>${cours.getDateFin()}</td>
                                            <td>${cours.getHeureDebut()}</td>
                                            <td>${cours.getHeureFin()}</td>
                                            <td>${cours.getVehiculeId()}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/cours?id_edt=${cours.getId()}" class="btn btn-sm btn-outline-primary"><i class="fa fa-edit"></i></a>
                                                <a href="${pageContext.request.contextPath}/cours?id_del=${cours.getId()}" class="btn btn-sm btn-outline-danger"><i class="fa fa-trash"></i></a>
                                            </td>
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
