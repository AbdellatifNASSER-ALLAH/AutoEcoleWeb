<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion des Séances</title>
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
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <!-- Form to add new session -->
                    <div class="card">
                        <div class="card-header">
                            Ajouter une séance
                        </div>
                        <div class="card-body">
                            <!-- Add form elements here -->
                            <form action="AddSessionServlet" method="post">
                                <div class="mb-3">
                                    <label for="date" class="form-label">Date :</label>
                                    <input type="date" name="date" id="date" class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label for="heureDebut" class="form-label">Heure Début :</label>
                                    <input type="time" name="heureDebut" id="heureDebut" class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label for="heureFin" class="form-label">Heure Fin :</label>
                                    <input type="time" name="heureFin" id="heureFin" class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label for="coursId" class="form-label">Cours ID :</label>
                                    <select name="coursId" id="coursId" class="form-select">
                                        <!-- Add options dynamically from database -->
                                        <option value="1">Mathématiques</option>
                                        <option value="2">Physique</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Ajouter</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Table to display sessions -->
                    <div class="card">
                        <div class="card-header">
                            Liste des séances
                        </div>
                        <div class="card-body">
                            <!-- Display table here -->
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Date</th>
                                        <th>Heure de début</th>
                                        <th>Heure de fin</th>
                                        <th>Cours ID</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Add rows dynamically from database -->
                                    <tr>
                                        <td>1</td>
                                        <td>2024-05-15</td>
                                        <td>08:00</td>
                                        <td>10:00</td>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>2024-05-16</td>
                                        <td>14:00</td>
                                        <td>16:00</td>
                                        <td>2</td>
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