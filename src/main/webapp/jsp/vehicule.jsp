<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Véhicules</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom CSS for vehicle management panel */

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
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <!-- Add Vehicle Form -->
                <div class="card">
                    <div class="card-header">
                        Ajouter un véhicule
                    </div>
                    <div class="card-body">
                        <!-- Add form elements here -->
                        <form>
                            <div class="mb-3">
                                <label for="marque" class="form-label">Marque:</label>
                                <input type="text" id="marque" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="modele" class="form-label">Modèle:</label>
                                <input type="text" id="modele" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="anneeFabrication" class="form-label">Année de fabrication:</label>
                                <input type="text" id="anneeFabrication" class="form-control">
                            </div>
                            <button type="button" class="btn btn-primary">Ajouter</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <!-- Vehicle Table -->
                <div class="card">
                    <div class="card-header">
                        Liste des véhicules
                    </div>
                    <div class="card-body">
                        <!-- Display table here -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Marque</th>
                                    <th>Modèle</th>
                                    <th>Année de fabrication</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Add rows dynamically from database -->
                                <tr>
                                    <td>1</td>
                                    <td>Toyota</td>
                                    <td>Corolla</td>
                                    <td>2019</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Honda</td>
                                    <td>Civic</td>
                                    <td>2018</td>
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
    <script>
        // Additional JavaScript can be added here
    </script>
</body>
</html>
</body>
</html>
