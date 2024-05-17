<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Registration</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Times New Roman", Times, serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            display: flex;
            width: 800px; /* Ajustement de la largeur */
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .image-section {
            flex: 1;
            text-align: center;
        }

        .image-section img {
            max-width: 100%; /* Ajustement pour que l'image s'adapte à la taille de son conteneur */
            height: auto;
            border-radius: 10px;
            
        }

        .form-section {
            flex: 1;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-family: "Times New Roman", Times, serif;
        }

        form {
            text-align: center;
            margin-top: 20px;
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
    <div class="container">
        <div class="image-section">
            <img src="images/registre.jpeg" alt="Your Image">
        </div>
        <div class="form-section">
            <h1>Create an Account</h1>
            <form action="register" method="post">
                <input type="text" name="username" placeholder="Username" required><br>
                
                
                <input type="text" name="phone" placeholder="Phone" required><br>
                <input type="text" name="address" placeholder="Address" required><br>
                <input type="text" name="email" placeholder="Email" required><br>
                <input type="password" name="password" placeholder="Password" required><br>
                
                <input type="password" name="rpassword" placeholder="Repeat Password" required><br>
                <button type="submit">Register</button>
            </form>
            <br>
            <a href="login"><center>Already have an account? Login here</center></a>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
            <% } %>
        </div>
    </div>
</body>
</html>