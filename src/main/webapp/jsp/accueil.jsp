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


    
   <div class="container-fluid w-100 p-2">
    <div class="row">
        <div class="container-fluid">
            <img src="../images/accuiel.jpg" alt="alt" class="img-fluid w-100">
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