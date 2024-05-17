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
        <%@ include file="navBar.jsp" %>
        <div class="container">
            <h1 class="mt-5 text-center">Gestion des Réservations</h1>
            <div class="row mt-5">
                <div class="col-md-6">
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
                            <form action="${pageContext.request.contextPath}/reservation" method="post">
                                <c:if test="${edtReservation != null}">
                                    <input type="hidden" name="id" value="${edtReservation.getId()}" />
                                </c:if>
                                <div class="mb-3">
                                    <label for="eleveId" class="form-label">Élève ID</label>
                                    <input type="number" name="eleveId" id="eleveId" class="form-control" value="${edtReservation != null ? edtReservation.getEleveId() : ''}" />
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
                <div class="col-md-6">
                    <!-- Table to display reservations -->
                    <div class="card">
                        <div class="card-header">
                            Liste des Réservations
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Élève ID</th>
                                        <th>Cours ID</th>
                                        <th>Date</th>
                                        <th>Heure</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty listeReservations}">
                                        <tr>
                                            <td colspan="6" class="text-center">Aucune réservation trouvée.</td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="reservation" items="${listeReservations}">
                                        <tr>
                                            <td>${reservation.getId()}</td>
                                            <td>${reservation.getEleveId()}</td>
                                            <td>${reservation.getCoursId()}</td>
                                            <td>${reservation.getDateReservation()}</td>
                                            <td>${reservation.getHeureReservation()}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/reservation?id_edt=${reservation.getId()}" class="btn btn-sm btn-outline-primary"><i class="fa fa-edit"></i></a>
                                                <a href="${pageContext.request.contextPath}/reservation?id_del=${reservation.getId()}" class="btn btn-sm btn-outline-danger"><i class="fa fa-trash"></i></a>
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
