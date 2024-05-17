<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion des Examens</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Include FontAwesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            /* Custom CSS for the exam management page */
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
            <h1 class="mt-5 text-center">Gestion des Examens</h1>
            <div class="row mt-5">
                <div class="col-md-6">
                    <!-- Form to add or edit an exam -->
                    <div class="card">
                        <div class="card-header">
                            <c:choose>
                                <c:when test="${not empty edtExamen}">
                                    Modifier un Examen
                                </c:when>
                                <c:otherwise>
                                    Ajouter un Examen
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/examen" method="post">
                                <c:if test="${edtExamen != null}">
                                    <input type="hidden" name="id" value="${edtExamen.getId()}" />
                                </c:if>
                                <div class="mb-3">
                                    <label for="dateExamen" class="form-label">Date de l'Examen</label>
                                    <input type="date" name="dateExamen" id="dateExamen" class="form-control" value="${edtExamen != null ? edtExamen.getDateExamen() : ''}" />
                                </div>
                                <div class="mb-3">
                                    <label for="heureExamen" class="form-label">Heure de l'Examen</label>
                                    <input type="time" name="heureExamen" id="heureExamen" class="form-control" value="${edtExamen != null ? edtExamen.getHeureExamen() : ''}" />
                                </div>
                                <div class="mb-3">
                                    <label for="vehiculeId" class="form-label">Véhicule ID</label>
                                    <input type="number" name="vehiculeId" id="vehiculeId" class="form-control" value="${edtExamen != null ? edtExamen.getVehiculeId() : ''}" />
                                </div>
                                <div class="mb-3">
                                    <label for="instructeurId" class="form-label">Instructeur ID</label>
                                    <input type="number" name="instructeurId" id="instructeurId" class="form-control" value="${edtExamen != null ? edtExamen.getInstructeurId() : ''}" />
                                </div>
                                <button type="submit" class="btn btn-primary">Enregistrer</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Table to display exams -->
                    <div class="card">
                        <div class="card-header">
                            Liste des Examens
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Date</th>
                                        <th>Heure</th>
                                        <th>Véhicule ID</th>
                                        <th>Instructeur ID</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty listeExamens}">
                                        <tr>
                                            <td colspan="6" class="text-center">Aucun examen trouvé.</td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="examen" items="${listeExamens}">
                                        <tr>
                                            <td>${examen.getId()}</td>
                                            <td>${examen.getDateExamen()}</td>
                                            <td>${examen.getHeureExamen()}</td>
                                            <td>${examen.getVehiculeId()}</td>
                                            <td>${examen.getInstructeurId()}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/examen?id_edt=${examen.getId()}" class="btn btn-sm btn-outline-primary"><i class="fa fa-edit"></i></a>
                                                <a href="${pageContext.request.contextPath}/examen?id_del=${examen.getId()}" class="btn btn-sm btn-outline-danger"><i class="fa fa-trash"></i></a>
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
