<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Paiements</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-6">
                <!-- Form to add new payment -->
                <div class="card">
                    <div class="card-header">
                        Ajouter un paiement
                    </div>
                    <div class="card-body">
                        <!-- Add form elements here -->
                        <form action="AddPaymentServlet" method="post">
                            <div class="mb-3">
                                <label for="eleve" class="form-label">Élève:</label>
                                <select name="eleve" id="eleve" class="form-select">
                                    <!-- Add options dynamically from database -->
                                    <option value="1">John Doe</option>
                                    <option value="2">Jane Smith</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="montant" class="form-label">Montant:</label>
                                <input type="text" name="montant" id="montant" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="datePaiement" class="form-label">Date de paiement:</label>
                                <input type="date" name="datePaiement" id="datePaiement" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="modePaiement" class="form-label">Mode de paiement:</label>
                                <select name="modePaiement" id="modePaiement" class="form-select">
                                    <option value="Cash">Cash</option>
                                    <option value="Carte Bancaire">Carte Bancaire</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Ajouter</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <!-- Table to display payments -->
                <div class="card">
                    <div class="card-header">
                        Liste des paiements
                    </div>
                    <div class="card-body">
                        <!-- Display table here -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>ID de l'élève</th>
                                    <th>Montant</th>
                                    <th>Date de paiement</th>
                                    <th>Mode de paiement</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Add rows dynamically from database -->
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>100</td>
                                    <td>2024-05-15</td>
                                    <td>Cash</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>2</td>
                                    <td>150</td>
                                    <td>2024-05-16</td>
                                    <td>Carte Bancaire</td>
                                </tr>
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
