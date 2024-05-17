<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Factures</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Custom CSS for the invoice management page */
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
    <h1 class="mt-5 text-center">Gestion des Factures</h1>
    <div class="row mt-5">
        <div class="col-md-6">
            <!-- Form to add or edit an invoice -->
            <div class="card">
                <div class="card-header">
                    <c:choose>
                        <c:when test="${not empty edtFacture}">
                            Modifier une Facture
                        </c:when>
                        <c:otherwise>
                            Ajouter une Facture
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/facture" method="post">
                        <c:if test="${edtFacture != null}">
                            <input type="hidden" name="id" value="${edtFacture.getId()}" />
                        </c:if>
                        <div class="mb-3">
                            <label for="eleveId" class="form-label">Élève ID</label>
                            <input type="number" name="eleveId" id="eleveId" class="form-control" value="${edtFacture != null ? edtFacture.getEleveId() : ''}" />
                        </div>
                        <div class="mb-3">
                            <label for="montant" class="form-label">Montant</label>
                            <input type="number" name="montant" id="montant" class="form-control" value="${edtFacture != null ? edtFacture.getMontant() : ''}" />
                        </div>
                        <div class="mb-3">
                            <label for="datePaiement" class="form-label">Date de Paiement</label>
                            <input type="date" name="datePaiement" id="datePaiement" class="form-control" value="${edtFacture != null ? edtFacture.getDatePaiement() : ''}" />
                        </div>
                        <div class="mb-3">
                            <label for="modePaiement" class="form-label">Mode de Paiement</label>
                            <input type="text" name="modePaiement" id="modePaiement" class="form-control" value="${edtFacture != null ? edtFacture.getModePaiement() : ''}" />
                        </div>
                        <button type="submit" class="btn btn-primary">Enregistrer</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!-- Table to display invoices -->
            <div class="card">
                <div class="card-header">
                    Liste des Factures
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Élève ID</th>
                            <th>Montant</th>
                            <th>Date de Paiement</th>
                            <th>Mode de Paiement</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty listeFactures}">
                            <tr>
                                <td colspan="6" class="text-center">Aucune facture trouvée.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="facture" items="${listeFactures}">
                            <tr>
                                <td>${facture.getId()}</td>
                                <td>${facture.getEleveId()}</td>
                                <td>${facture.getMontant()}</td>
                                <td>${facture.getDatePaiement()}</td>
                                <td>${facture.getModePaiement()}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/facture?id_edt=${facture.getId()}" class="btn btn-sm btn-outline-primary"><i class="fa fa-edit"></i></a>
                                    <a href="${pageContext.request.contextPath}/facture?id_del=${facture.getId()}" class="btn btn-sm btn-outline-danger"><i class="fa fa-trash"></i></a>
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
