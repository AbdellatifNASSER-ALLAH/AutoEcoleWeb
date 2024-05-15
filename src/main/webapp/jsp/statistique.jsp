<<<<<<< Updated upstream
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statistiques</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom CSS for statistics panel */

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

        .panel {
            border-radius: 15px;
            background-color: #fff; /* White background */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        .panel-title {
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .statistic-label {
            font-size: 18px;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <!-- Statistics Panels -->
                <div class="card">
                    <div class="card-header">
                        Statistiques
                    </div>
                    <div class="card-body">
                        <!-- Statistics panels go here -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-title">Gestion Candidats</div>
                                    <div class="statistic-label">Total revenues: <span style="color: red;">${totalRevenues}</span> DH</div>
                                    <div class="statistic-label">Nombre d'élèves inscrits: <span style="font-weight: bold;">${nbrUsers}</span></div>
                                    <div class="statistic-label">Nombre de moniteurs disponibles: <span style="font-weight: bold;">${nbrMoniteurs}</span></div>
                                    <div class="statistic-label">Nombre de Exames disponibles: <span style="font-weight: bold;">${nbrExamen}</span></div>
                                    <div class="statistic-label">Nombre de véhicules disponibles: <span style="font-weight: bold;">${nbrVehicules}</span></div>
                                    <div class="statistic-label">Nombre de Cours disponibles: <span style="font-weight: bold;">${nbrCours}</span></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Add other statistics panels if needed -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
=======
!<html>
    <head>
        <title>Statistique</title>
    </head>
    <body>
        <%@ include file="navBar.jsp" %>
        
        <h1>Hello Statistique</h1>
    </body>
>>>>>>> Stashed changes
</html>
