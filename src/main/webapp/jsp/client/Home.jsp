<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page d'accueil des Candidats</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome CSS (for icons) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        /* Adjustments for better spacing and alignment */
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100vw;
            height: 100vh;
            padding: 10px;
        }
        .card {
            margin-bottom: 20px;
        }
        .feature-icon {
            font-size: 3rem;
            margin-bottom: 20px;
        }
        .feature-description {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img  width="100px" height="60px" src="http://localhost:8086/AutoEcole/images/horizon.png" alt="alt"/></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <a class="nav-link" href="http://localhost:8086/AutoEcole/jsp/client/Home.jsp">Accueil</a>
                </li>
                  <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8086/AutoEcole/inscription">Inscription</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8086/AutoEcole/reservationUser">Réservation du cours</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8086/AutoEcole/jsp/client/resultat.jsp">Consulter resultat</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8086/AutoEcole/jsp/client/settings.jsp">Modifier votre compte</a>
                </li>
                </ul>
                <div class="d-flex">

                <a href="Logout.jsp" class="btn btn-outline-danger me-2">Logout</a> <!-- Change button to link for logout -->
            </div>
            </div>
        </div>
    </nav>
    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row row-cols-1 row-cols-md-2 g-4">
                    <!-- Inscription -->
                    <div class="col">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="fas fa-user-plus feature-icon"></i>
                                <h5 class="card-title">Inscription</h5>
                                <p class="feature-description">Inscrivez-vous pour commencer votre formation.</p>
                                <a href="http://localhost:8086/AutoEcole/inscription" id="inscriptionBtn" class="btn btn-primary">S'inscrire</a>
                               
                            </div>
                        </div>
                    </div>
                    <!-- Réservation de cours -->
                    <div class="col">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="far fa-calendar-alt feature-icon"></i>
                                <h5 class="card-title">Réservation de cours</h5>
                                <p class="feature-description">Réservez vos cours de conduite en ligne.</p>
                                <a href="http://localhost:8086/AutoEcole/reservationUser" id="reservationBtn" class="btn btn-primary">Réserver</a>
                               
                            </div>
                        </div>
                    </div>
                    <!-- Consulter vos résultats -->
                    <div class="col">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="fas fa-poll feature-icon"></i>
                                <h5 class="card-title">Consulter vos résultats</h5>
                                <p class="feature-description">Consultez vos résultats d'examens enregistrés.</p>
                                <a href="http://localhost:8086/AutoEcole/jsp/client/resultat.jsp" id="resultatsBtn" class="btn btn-primary">Voir les résultats</a>
                              
                        </div>
                    </div>
                        </div>
                    <!-- Modifier votre compte -->
                    <div class="col">
                        <div class="card text-center">
                            <div class="card-body">
                                <i class="fas fa-user-edit feature-icon"></i>
                                <h5 class="card-title">Modifier votre compte</h5>
                                <p class="feature-description">Modifiez vos informations personnelles.</p>
                                   <a href="http://localhost:8086/AutoEcole/jsp/client/settings.jsp" id="resultatsBtn" class="btn btn-primary">Modifier</a>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- Custom JS -->
    <script>
        // Function to toggle visibility of form
        function toggleForm(buttonId, formId) {
            const button = document.getElementById(buttonId);
            const form = document.getElementById(formId);
            button.addEventListener('click', function() {
                form.classList.toggle('hidden');
            });
        }

        // Toggle forms for each button
        toggleForm('inscriptionBtn', 'inscriptionForm');
        toggleForm('reservationBtn', 'reservationForm');
        toggleForm('resultatsBtn', 'resultatsForm');
        toggleForm('modifierBtn', 'modifierForm');
    </script>
</body>
</html>
