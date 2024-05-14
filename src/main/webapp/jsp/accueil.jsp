    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
     <%@ include file="navBar.jsp" %>


    
     <div class="container">
        <div class="row">
            
            <div class="col-md-12">
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="v-pills-accueil" role="tabpanel" aria-labelledby="v-pills-accueil-tab">
                        <!-- Content for Accueil section -->
                        <h2>Accueil Content</h2>
                            <div class="container-fluid">
        <div class="row">
            <!-- Image on the left -->
            <div class="">
                <img src="../images/accuiel.jpg" alt="alt" class="img-fluid">
            </div>
        </div>
    </div>
                    </div>
                    <div class="tab-pane fade" id="v-pills-candidat" role="tabpanel" aria-labelledby="v-pills-candidat-tab">
                        <!-- Content for Gestion Candidat section -->
                         <h2>Page Candidat</h2>
                          <%@ include file="candidat.jsp" %>
                        
                    </div>
                    <div class="tab-pane fade" id="v-pills-moniteur" role="tabpanel" aria-labelledby="v-pills-moniteur-tab">
    <!-- Content for Gestion Moniteur section -->
    <h2>Gestion Moniteur Content</h2>
     <%@ include file="candidat.jsp" %>
</div>
<div class="tab-pane fade" id="v-pills-seance" role="tabpanel" aria-labelledby="v-pills-seance-tab">
    <!-- Content for Gestion Seance section -->
    <h2>Gestion Seance Content</h2>
      <%@ include file="seance.jsp" %>
      
</div>

                    <div class="tab-pane fade" id="v-pills-cours" role="tabpanel" aria-labelledby="v-pills-cours-tab">
    <!-- Content for Gestion Cours section -->
    <h2>Gestion Cours Content</h2>
     <%@ include file="cours.jsp" %>
</div>
<div class="tab-pane fade" id="v-pills-examen" role="tabpanel" aria-labelledby="v-pills-examen-tab">
    <!-- Content for Gestion Examen section -->
    <h2>Gestion Examen Content</h2>
     <%@ include file="candidat.jsp" %>
</div>

<div class="tab-pane fade" id="v-pills-reservation" role="tabpanel" aria-labelledby="v-pills-reservation-tab">
    <!-- Content for Gestion Reservation section -->
    <h2>Gestion Reservation Content</h2>
     <%@ include file="reservation.jsp" %>
</div>
                    <div class="tab-pane fade" id="v-pills-facteure" role="tabpanel" aria-labelledby="v-pills-facteure-tab">
    <!-- Content for Gestion Reservation section -->
    <h2>Gestion Facteure Content</h2>
     <%@ include file="facture.jsp" %>
</div>
                     <div class="tab-pane fade" id="v-pills-vehicule" role="tabpanel" aria-labelledby="v-pills-vehicule-tab">
    <!-- Content for Gestion Reservation section -->
    <h2>Gestion vehicule  Content</h2>
     <%@ include file="vehicule.jsp" %>
</div>
<div class="tab-pane fade" id="v-pills-statistique" role="tabpanel" aria-labelledby="v-pills-statistique-tab">
    <!-- Content for Statistique section -->
    <h2>Statistique Content</h2>
     <%@ include file="statistique.jsp" %>
</div>

                    <!-- Add other tab content here -->
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- Your custom JavaScript -->
    <script>
        // Add event listener to all navigation links with class "nav-link"
        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', function() {
                // Remove the "active" class from all navigation links
                document.querySelectorAll('.nav-link').forEach(link => {
                    link.classList.remove('active');
                });
                // Add the "active" class to the clicked link
                this.classList.add('active');
            });
        });
    </script>
    
    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>