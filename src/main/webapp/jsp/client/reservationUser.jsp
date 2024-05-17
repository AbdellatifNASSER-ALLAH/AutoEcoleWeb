<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion des Réservations</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Include FontAwesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            /* Custom CSS for the reservation management page */
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
           <!-- Navbar -->
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
                    <a class="nav-link" href="http://localhost:8086/AutoEcole/client/settings.jsp">Modifier votre compte</a>
                </li>
                </ul>
                <div class="d-flex">

                <a href="Logout.jsp" class="btn btn-outline-danger me-2">Logout</a> <!-- Change button to link for logout -->
            </div>
            </div>
        </div>
    </nav>
        <div class="container">
            <h1 class="mt-5 text-center">Gestion des Réservations</h1>
            <div class="row mt-5">
                <div class="col-md-12">
                    <!-- Form to add or edit a reservation -->
                    <div class="card">
                        <div class="card-header">
                            <c:choose>
                                <c:when test="${not empty edtReservation}">
                                    Modifier une Réservation
                                </c:when>
                                <c:otherwise>
                                    Ajouter une Réservation
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/reservationUser" method="post">
                                <c:if test="${edtReservation != null}">
                                    <input type="hidden" name="id" value="${edtReservation.getId()}" />
                                </c:if>
                                <div class="mb-3">
                                    <input type="number"  name="eleveId" id="eleveId" class="form-control" value="1" disabled />
                                </div>
                                <div class="mb-3">
                                    <label for="coursId" class="form-label">Cours ID</label>
                                    <input type="number" name="coursId" id="coursId" class="form-control" value="${edtReservation != null ? edtReservation.getCoursId() : ''}" />
                                </div>
                                <div class="mb-3">
                                    <label for="dateReservation" class="form-label">Date de Réservation</label>
                                    <input type="date" name="dateReservation" id="dateReservation" class="form-control" value="${edtReservation != null ? edtReservation.getDateReservation() : ''}" />
                                </div>
                                <div class="mb-3">
                                    <label for="heureReservation" class="form-label">Heure de Réservation</label>
                                    <input type="time" name="heureReservation" id="heureReservation" class="form-control" value="${edtReservation != null ? edtReservation.getHeureReservation() : ''}" />
                                </div>
                                <button type="submit" class="btn btn-primary">Enregistrer</button>
                            </form>
                        </div>
                    </div>
                </div>
               
            </div>
        </div>
        <!-- Include Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
