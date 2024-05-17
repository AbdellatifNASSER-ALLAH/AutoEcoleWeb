<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion des Séances</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Include FontAwesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <!-- Include Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Custom CSS for session management page */
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
            <h1 class="mt-5 text-center">Gestion des Séances</h1>
            <div class="row mt-5">
                <div class="col-md-6">
                    <!-- Form to add or edit a session -->
                    <div class="card">
                        <div class="card-header">
                            <c:choose>
                                <c:when test="${not empty edtSeance}">
                                    Modifier une Séance
                                </c:when>
                                <c:otherwise>
                                    Ajouter une Séance
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${not empty edtSeance}">
                                    <form action="${pageContext.request.contextPath}/seance" method="post">
                                        <div class="mb-3">
                                            <label for="coursId" class="form-label">Cours ID</label>
                                            <input type="number" name="coursId" id="coursId" class="form-control" value="${edtSeance.getCoursId()}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="dateSeance" class="form-label">Date de la Séance</label>
                                            <input type="date" name="dateSeance" id="dateSeance" class="form-control" value="${edtSeance.getDateSeance()}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="heureDebut" class="form-label">Heure de Début</label>
                                            <input type="time" name="heureDebut" id="heureDebut" class="form-control" value="${edtSeance.getHeureDebut()}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="heureFin" class="form-label">Heure de Fin</label>
                                            <input type="time" name="heureFin" id="heureFin" class="form-control" value="${edtSeance.getHeureFin()}">
                                            <input type="hidden" name="id" value="${edtSeance.getId()}">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Modifier</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <form action="${pageContext.request.contextPath}/seance" method="post">
                                        <div class="mb-3">
                                            <label for="coursId" class="form-label">Cours ID</label>
                                            <input type="number" name="coursId" id="coursId" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label for="dateSeance" class="form-label">Date de la Séance</label>
                                            <input type="date" name="dateSeance" id="dateSeance" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label for="heureDebut" class="form-label">Heure de Début</label>
                                            <input type="time" name="heureDebut" id="heureDebut" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label for="heureFin" class="form-label">Heure de Fin</label>
                                            <input type="time" name="heureFin" id="heureFin" class="form-control">
                                        </div>
                                        <button type="submit" class="btn btn-success">Ajouter</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Table to display sessions -->
                    <div class="card">
                        <div class="card-header">
                            Liste des Séances
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Cours ID</th>
                                        <th>Date</th>
                                        <th>Heure de Début</th>
                                        <th>Heure de Fin</th>
                                        <th>Modify</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty listeSeances}">
                                        <tr>
                                            <td colspan="6" class="text-center">Aucune séance trouvée.</td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="seance" items="${listeSeances}">
                                        <tr>
                                            <td>${seance.getId()}</td>
                                            <td>${seance.getCoursId()}</td>
                                            <td>${seance.getDateSeance()}</td>
                                            <td>${seance.getHeureDebut()}</td>
                                            <td>${seance.getHeureFin()}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/seance?id_edt=${seance.getId()}"><i class="fa fa-edit"></i></a>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/seance?id_del=${seance.getId()}" class="text-danger"><i class="fa fa-trash"></i></a>
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

        <!-- Include Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Additional JavaScript can be added here
        </script>
    </body>
</html>