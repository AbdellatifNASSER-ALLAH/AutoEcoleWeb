<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des réservations</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-6">
                <!-- Add Reservation Form -->
                <div class="card">
                    <div class="card-header">
                        Ajouter une réservation
                    </div>
                    <div class="card-body">
                        <form action="AddReservationServlet" method="post">
                            <div class="mb-3">
                                <label for="candidat" class="form-label">Candidat:</label>
                                <select name="candidat" id="candidat" class="form-select">
                                    <!-- Add options dynamically from the database -->
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="cours" class="form-label">Cours:</label>
                                <select name="cours" id="cours" class="form-select">
                                    <!-- Add options dynamically from the database -->
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="date" class="form-label">Date:</label>
                                <input type="date" name="date" id="date" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="heure" class="form-label">Heure:</label>
                                <input type="text" name="heure" id="heure" class="form-control">
                            </div>
                            <button type="submit" class="btn btn-primary">Ajouter</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <!-- Reservation List Table -->
                <div class="card">
                    <div class="card-header">
                        Liste des réservations
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Candidat</th>
                                    <th>Cours</th>
                                    <th>Date</th>
                                    <th>Heure</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Add rows dynamically from the database -->
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