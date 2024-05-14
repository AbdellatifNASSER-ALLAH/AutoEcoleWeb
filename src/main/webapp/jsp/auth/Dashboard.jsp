<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auto Ecole</title>
    <style>
        /* Styles for header */
        header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }
        .logo {
            max-width: 200px;
            display: block;
            margin: 0 auto;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin-right: 20px;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
        }
        /* Styles for main content */
        .content {
            margin: 20px;
            text-align: center;
        }
        .image {
            margin-bottom: 20px;
        }
        /* Styles for footer */
        footer {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <img src="logo.png" alt="Auto Ecole Logo" class="logo">
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Courses</a></li>
                <li><a href="#">Instructors</a></li>
                <li><a href="#">Contact</a></li>
                  <li><a href="/AutoEcoleWeb/login">Login</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <div class="content">
        <h1>Welcome to Auto Ecole</h1>
        <p>We provide professional driving lessons to help you become a confident and safe driver.</p>
        <div class="image">
            <img src="driving_school.jpg" alt="Driving School Image" width="400">
        </div>
        <p>Join us today and start your journey towards getting your driver's license!</p>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2024 Auto Ecole. All rights reserved.
    </footer>
    <script>
        // Redirect to another page after 5 seconds (replace '/target-page' with the actual URL)
        setTimeout(function() {
            window.location.href = '/login';
        }, 10); // 5000 milliseconds = 5 seconds
    </script>
</body>
</html>
