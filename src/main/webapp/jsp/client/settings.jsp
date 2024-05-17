<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <title>Registration</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Times New Roman", Times, serif;
            background-color: #f2f2f2;
            height: 100vh;
        }

        .container {
            display: flex;
            width: 100%;
            border-radius: 10px;
            margin-top: 50px;
            padding: 60px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);   
        }

        .image-section {
            flex: 1;
            text-align: center;
        }

        .image-section img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }

        .form-section {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-family: "Times New Roman", Times, serif;
        }

        form {
            text-align: center;
            margin-top: 20px;
            width: 100%; /* Make the form fill the width */
            max-width: 400px; /* Set a max-width for better readability */
        }

        input[type="text"],
        input[type="password"],
        button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            font-family: "Times New Roman", Times, serif;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
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
<div class="container bg-light" >
    <div class="image-section col-12" >
        <img class="img-fluid" width="100%" src="http://localhost:8086/AutoEcole/images/candidat.png" alt="Your Image">
    </div>
    <div class="form-section">
        <h1>Modify My Account</h1>
        <form action="register" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="text" name="phone" placeholder="Phone" required><br>
            <input type="text" name="address" placeholder="Address" required><br>
            <input type="text" name="email" placeholder="Email" required><br>
            <button type="submit">Register</button>
        </form>
        <br>
                <% if (request.getAttribute("errorMessage") != null) {%>
        <p class="error-message"><%= request.getAttribute("errorMessage")%></p>
        <% }%>
    </div>
</div>
</body>
</html>
