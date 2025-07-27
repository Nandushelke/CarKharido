<%@ page import="com.carkharido_user.Dbcon" %>
<%@ page import="com.carkharido.dao.CarsDao" %>
<%@ page import="com.carkharido.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - CarKhariDo</title>
    <%@ include file="includes/head.jsp" %>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            margin: 0;
            padding-top: 80px; /* Space for fixed navbar */
        }
        .about-header {
            background-color: olive;
            color: white;
            padding: 30px 0 20px 20px;
            text-align: center;
            
        }
        .about-content {
            padding: 30px;
            background-color: silver;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 800px;
        }
        .about-section {
            margin-bottom: 20px;
        }
        .about-image {
            width: 200px;
            float: left;
            margin-right: 20px;
        }
        .about-image img {
            max-width: 100%;
            border-radius: 8px;
        }
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            background-color: silver;
            height: 80px;
        }
        .navbar-brand img {
            width: auto;
            height: 200px;
        }
        .navbar-toggler {
            border: ridge;
        }
        .navbar-nav .nav-link {
            color: #333;
            font-weight: bold;
        }
        .navbar-nav .nav-link:hover {
            color: #007bff;
        }
    </style>
</head>
<body>

<%
    HttpSession s = request.getSession(false);
    User auth = null;
    if (s != null) {
        auth = (User) session.getAttribute("auth");
    }
%>

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="CARS/logo.png" alt="CarKhariDo Logo">
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
                    <a class="nav-link" href="cart.jsp">List<span class="badge badge-danger px-1"><%= (session != null && session.getAttribute("cart_list") != null) ? ((List) session.getAttribute("cart_list")).size() : 0 %></span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="aboutus.jsp">About Us</a>
                </li>
                <% if (auth != null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="sell.jsp">Sell Car</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="booking.jsp">Bookings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="log-out">Logout</a>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="about-header">
        <h1>About Us</h1>
    </div>
    <div class="about-content">
        <div class="about-section">
            <div class="about-image">
                <img src="CARS/car.png" alt="About Us Image">
            </div>
            <div>
                <h2>CarKhariDo!</h2>
                <p>CarKhariDo is a leading online platform for buying and selling cars. We provide a wide range of vehicles in various categories to suit every need and budget.</p>
                <p>Our mission is to make the car buying and selling process as seamless and convenient as possible for our customers. We aim to provide top-notch service and ensure customer satisfaction at every step.</p>
                <p>If you have any questions or inquiries, feel free to contact us:</p>
                <ul>
                    <li>Address: 203 Lalbhag, Burhanpur</li>
                    <li>Phone: +91 9325494140</li>
                    <li>Email: info@carkharido.com</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and jQuery (for toggler) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%@ include file="includes/footer.jsp" %>

</body>
</html>
