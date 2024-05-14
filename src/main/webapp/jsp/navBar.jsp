<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="../css/style.css"/>
        <!-- Bootstrap CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous" />
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <!-- Logo on the left -->
                <div class="navbar-brand">
                    <img src="./images/horizon.png" width="90px" alt="Logo">
                </div>
                <!-- Title centered -->
                <h1 class="navbar-brand mx-auto">HORIZON</h1>
            </div>
        </nav>

        <div class="d-flex align-items-start">
            <div
                class="nav flex-column nav-pills me-3"
                id="v-pills-tab"
                role="tablist"
                aria-orientation="vertical">
                <a
                    class="nav-link active"
                    id="v-pills-accueil-tab"
                    data-bs-toggle="pill"
                    href="accueil.jsp"
                    role="tab"
                    aria-controls="v-pills-accueil"
                    aria-selected="true"
                    >Accueil</a
                >
                <a
                    class="nav-link"
                    id="v-pills-candidat-tab"
                    data-bs-toggle="pill"
                    href="candidat.jsp"
                    role="tab"
                    aria-controls="v-pills-candidat"
                    aria-selected="false"
                    >Gestion Candidat</a
                >
                <a
                    href="/login"
                    class="nav-link"
                    id="v-pills-candidat-tab"
                    data-bs-toggle="pill"
                    role="tab"
                    aria-controls="v-pills-candidat"
                    aria-selected="false"
                    >Gestion Véhicule</a
                >
                <a
                    class="nav-link"
                    id="v-pills-moniteur-tab"
                    data-bs-toggle="pill"
                    href="moniteur.jsp"
                    role="tab"
                    aria-controls="v-pills-moniteur"
                    aria-selected="false"
                    >Gestion Moniteur</a
                >
                <a
                    class="nav-link"
                    id="v-pills-seance-tab"
                    data-bs-toggle="pill"
                    href="seance.jsp"
                    role="tab"
                    aria-controls="v-pills-seance"
                    aria-selected="false"
                    >Gestion Seance</a
                >
                <a
                    class="nav-link"
                    id="v-pills-cours-tab"
                    data-bs-toggle="pill"
                    href="cours.jsp"
                    role="tab"
                    aria-controls="v-pills-cours"
                    aria-selected="false"
                    >Gestion Cours</a
                >
                <a
                    class="nav-link"
                    id="v-pills-examen-tab"
                    data-bs-toggle="pill"
                    href="examen.jsp"
                    role="tab"
                    aria-controls="v-pills-examen"
                    aria-selected="false"
                    >Gestion Examen</a
                >
                <a
                    class="nav-link"
                    id="v-pills-seance-tab"
                    data-bs-toggle="pill"
                    href="facture.jsp"
                    role="tab"
                    aria-controls="v-pills-seance"
                    aria-selected="false"
                    >Gestion Facture</a
                >
                <a
                    class="nav-link"
                    id="v-pills-statistique-tab"
                    data-bs-toggle="pill"
                    href="reservation.jsp"
                    role="tab"
                    aria-controls="v-pills-statistique"
                    aria-selected="false"
                    >Gestion Reservation</a
                >
                <a
                    class="nav-link"
                    id="v-pills-statistique-tab"
                    data-bs-toggle="pill"
                    href="statistique.jsp"
                    role="tab"
                    aria-controls="v-pills-statistique"
                    aria-selected="false"
                    >Statistique</a
                >
            </div>
            <!-- Bootstrap JS (Optional) -->
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    </body>
</html>
