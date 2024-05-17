<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
     <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
            width: 500px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .container img {
            width: 200px;
            height: auto;
            border-radius: 10px;
        }

        .login-form {
            flex: 1;
            padding: 20px;
            text-align: left;
        }

        .login-form h1 {
            margin-bottom: 20px;
            font-family: "Times New Roman", Times, serif;
        }

        form {
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
            <img src="images/login3.jpeg" alt="Your Image">
        </div>
        <div class="login-form">
            <h1><center>Login</center></h1>
            <form action="login" method="post">
                <input type="text" name="username" placeholder="Username" required><br>
                <input type="password" name="password" placeholder="Password" required><br>
                <button type="submit">Login</button>
            </form>
            <br>
            <a href="register"><center>Créer un compte</center></a>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
            <% } %>
        </div>
    </div>
</body>
</html>