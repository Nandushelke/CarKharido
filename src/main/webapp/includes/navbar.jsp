
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CarKhariDo</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar {
            position: fixed; /* Set navbar position to fixed */
            top: 0; /* Position at the top of the viewport */
            width: 100%; /* Set navbar width to 100% */
            z-index: 1000; /* Ensure navbar appears above other content */
            background-color: silver; /* Set background color with transparency */
            height: 80px; /* Set navbar height */
        }
        .navbar-brand img {
            width: auto; /* Ensure logo scales properly */
            height: 200px; /* Adjust logo height */
        }
        .navbar-toggler {
            border: ridge; /* Remove border from toggler */
        }
        .navbar-nav .nav-link {
            color: #333; /* Change link color */
            font-weight: bold; /* Make links bold */
        }
        .navbar-nav .nav-link:hover {
            color: #007bff; /* Change link color on hover */
        }
        body {
            padding-top: 60px; /* Add padding to body to prevent content from being hidden behind fixed navbar */
            margin: 0; /* Remove default margin */
            font-family: Arial, sans-serif; /* Set default font family */
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="CARS/logo.png" alt="CarKhariDo Logo"> <!-- Adjusted logo height -->
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">List<span class="badge badge-danger px-1">${cart_list.size()}</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="aboutus.jsp">About Us</a> <!-- Added link to About Us page -->
                </li>
                
                <%if(auth!=null){%>
                    <li class="nav-item">
                        <a class="nav-link" href="sell.jsp">Sell Car</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="booking.jsp">Bookings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="log-out">Logout</a>
                    </li>
                <%  }else{%>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                <%  }
                
                %>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS and jQuery (for toggler) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

