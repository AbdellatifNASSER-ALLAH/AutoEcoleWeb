<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <style>
        body {
            background-color: rgba(11, 10, 20, 0.1);
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            height: 100vh;
            width: 100vw;
        }
        .image {
            margin-top: -10px;
            border-radius: 8px;
            border-radius: 60px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 100%;
            height: 150px;
        }
        .container {
            border-radius: 30px;
            box-shadow: 1px 1px 1px 1px black;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            background-color: #fff;
            max-width: 700px;
            height: 100%;
            width: 100%;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            text-align: center;
        }
        input[type="text"],
        input[type="password"] {
            padding: 24px;
            margin: 5px 0;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
        .link {
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
        }
    </style>
</head>
<body>
   <div class="container">
           <img src="images/register.jpeg" alt="Your Image" class="image">
   
        <h1>Registration</h1>
        
        <form action="register" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="password" name="rpassword" placeholder="Repait Password" required><br>
            <button type="submit">Register</button>
           
        </form>
       <a href="login" class="link">Already have an account? Login here</a>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
    </div>
</body>
</html>
