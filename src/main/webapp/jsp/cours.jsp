<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des cours</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-6">
                <!-- Add Course Form -->
                <div class="card">
                    <div class="card-header">
                        Ajouter un cours
                    </div>
                    <div class="card-body">
                        <form action="AddCourseServlet" method="post">
                            <div class="mb-3">
                                <label for="titre" class="form-label">Titre:</label>
                                <input type="text" name="titre" id="titre" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="dateDebut" class="form-label">Date Début:</label>
                                <input type="date" name="dateDebut" id="dateDebut" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="dateFin" class="form-label">Date Fin:</label>
                                <input type="date" name="dateFin" id="dateFin" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="heureDebut" class="form-label">Heure Début:</label>
                                <input type="text" name="heureDebut" id="heureDebut" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="heureFin" class="form-label">Heure Fin:</label>
                                <input type="text" name="heureFin" id="heureFin" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="vehiculeId" class="form-label">Véhicule ID:</label>
                                <select name="vehiculeId" id="vehiculeId" class="form-select">
                                    <!-- Add options dynamically from the database -->
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Ajouter</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <!-- Course List Table -->
                <div class="card">
                    <div class="card-header">
                        Liste des cours
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