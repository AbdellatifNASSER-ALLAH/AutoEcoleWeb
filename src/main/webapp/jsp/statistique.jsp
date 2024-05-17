<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Statistiques</title>
        <!-- Include Bootstrap CSS -->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Include FontAwesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <style>
            /* Custom CSS for the statistics page */
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
            .statistic-item {
                border-radius: 10px;
                padding: 20px;
                background-color: #fff; /* White background */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .statistic-item h2 {
                font-size: 24px;
                margin-bottom: 10px;
            }
            .statistic-item p {
                font-size: 16px;
                color: #6c757d; /* Gray text */
            }
            .chart-canvas {
                width: 100%; /* Set a fixed width */
                height: 200px; /* Set a fixed height */
            }
            
        </style>
    </head>
    <body>
        <%@ include file="navBar.jsp" %>
        <div class="container">
            <h1 class=" text-center">Statistiques</h1>
            
              <div class="row  mt-3">
                <div class="col-md-6">
                    <div class="statistic-item">
                        <h2>Nombre de réservations par mois</h2>
                        <canvas class="chart-canvas" id="barChart"></canvas>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="statistic-item">
                        <h2>Évolution du nombre de réservations</h2>
                        <canvas class="chart-canvas" id="lineChart"></canvas>
                    </div>
                </div>
              
            </div>
            <div class="row mt-1">
                <div class="col-md-2">
                    <div class="statistic-item">
                        <h2>Nombre d'utilisateurs</h2>
                        <p>${nbrUsers}</p>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="statistic-item">
                        <h2>Nombre de moniteurs</h2>
                        <p>${nbrMoniteurs}</p>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="statistic-item">
                        <h2>Nombre de véhicules</h2>
                        <p>${nbrVehicules}</p>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="statistic-item">
                        <h2>Nombre de cours</h2>
                        <p>${nbrCours}</p>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="statistic-item">
                        <h2>Nombre d'examens</h2>
                        <p>${nbrExamen}</p>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="statistic-item">
                        <h2>Total des revenus</h2>
                        <p>${totalRevenues}</p>
                    </div>
                </div>
                    <div class="row">
                          <div class="col-md-12">
                    <div class="statistic-item">
                        <h2>Répartition des paiements par mode</h2>
                        <canvas class="chart-canvas" id="pieChart"></canvas>
                    </div>
                </div>
                    </div>
                <!-- Additional statistics here -->
            </div>

          


        </div>
        <!-- Include Bootstrap JS -->
        <script>
            // Récupérer les données du serveur (par exemple, depuis la servlet)
            var barChartData = ${barChartData};
            var pieChartData =${pieChartData};
            var lineChartData = ${lineChartData};
            console.log(barChartData);
            // Récupérer le contexte du canvas
            var ctx = document.getElementById('barChart').getContext('2d');

            // Créer le graphique à barres
            var barChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: Object.keys(barChartData),
                    datasets: [{
                            label: 'Nombre de réservations',
                            data: Object.values(barChartData),
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });




            // Récupérer les données du serveur (par exemple, depuis la servlet)


            // Récupérer le contexte du canvas
            var ctxPie = document.getElementById('pieChart').getContext('2d');

            // Créer le graphique circulaire
            var pieChart = new Chart(ctxPie, {
                type: 'pie',
                data: {
                    labels: Object.keys(pieChartData),
                    datasets: [{
                            label: 'Répartition des paiements',
                            data: Object.values(pieChartData),
                            backgroundColor: [
                                'rgb(255, 99, 132)',
                                'rgb(54, 162, 235)',
                                'rgb(255, 205, 86)'
                                        // Ajoutez plus de couleurs si nécessaire
                            ],
                            hoverOffset: 4
                        }]
                }
            });




            // Récupérer les données du serveur (par exemple, depuis la servlet)


            // Récupérer le contexte du canvas
            var ctxLine = document.getElementById('lineChart').getContext('2d');

            // Créer le graphique en ligne
            var lineChart = new Chart(ctxLine, {
                type: 'line',
                data: {
                    labels: Object.keys(lineChartData),
                    datasets: [{
                            label: 'Nombre de réservations',
                            data: Object.values(lineChartData),
                            fill: false,
                            borderColor: 'rgb(75, 192, 192)',
                            tension: 0.1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
