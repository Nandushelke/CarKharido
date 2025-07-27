<%@ page import="com.carkharido_user.Dbcon"%>
<%@ page import="com.carkharido.dao.CarsDao"%>
<%@ page import="com.carkharido.model.*"%>
<%@ page import="java.util.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
String userName = ""; // Initialize userName variable

if (auth != null) {
    userName = auth.getName(); // Get the user's name if authenticated
    request.setAttribute("auth", auth);
}

CarsDao cd = new CarsDao(Dbcon.getConnection());
List<Cars> cars = cd.getAllcars();
ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cartList != null) {
    request.setAttribute("cartList", cartList);
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to CarKhariDo</title>
    <%@include file="includes/head.jsp"%>
    <style>
        body {
            background-image: url("");
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            padding: 30px;
        }
        .card-header {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 10px;
            margin-bottom: 20px;
            text-align: left;
            font-size: 24px;
        }
        .card-header1 {
            background-color: #ffc107; /* Yellow color */
            color: #333; /* Dark text color */
            border-radius: 5px; /* Rounded corners */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Box shadow */
            padding: 10px; /* Padding */
            margin-bottom: 20px; /* Bottom margin */
            text-align: center; /* Center text */
            font-size: 24px; /* Font size */
            font-weight: bold; /* Bold font weight */
            font-style: italic; /* Italic font style */
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 10px;
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }
        .grid.visible {
            opacity: 1;
        }
        .card {
            border: dashed;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .card-img-top {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            width: 100%;
            height: auto;
            object-fit: cover;
        }
        .card-body {
            padding: 30px;
        }
        .card-title {
            font-size: 20px;
            margin-bottom: 10px;
        }
        .price {
            font-size: 16px;
            color: #007bff;
            margin-bottom: 5px;
        }
        .category {
            font-size: 16px;
            color: #6c757d;
            margin-bottom: 10px;
        }
        .btn {
            width: 100%;
            margin-top: 10px;
        }
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .warranty-container {
            background-image: url("CARS/b1.jpg");
            
            background-size: 83%;
            background-position: center;
            height: 400px;
            max-width: 1200px;
            margin: 60px auto;
            padding: 20px;
            color: black;
            text-align: left;
            background-color: silver;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        .warranty-header {
            font-size: 24px;
            font-weight: bold;
            margin-top: 10px;
            color: purple;
        }
        .warranty-text {
            font-size: 20px;
            margin-left: 20px;
            text-align: left;
            text-indent: 50px;
            color: orange;
        }
        .warranty-button {
            background-color: orange;
            color: purple;
            padding: 10px 20px;
            border: solid;
            border-radius: 5px;
            cursor: pointer;
        }
        .warranty-button:hover {
            background-color: silver;
        }
    </style>
</head>
<body>
    <%@include file="includes/navbar.jsp"%>

    <div class="container">
        <!-- Display the user's name if authenticated -->
        <div class="card-header1 my-3">Welcome <%= userName %></div>
        <div class="warranty-container">
        
            <h2 class="warranty-header">Happiness guaranteed!!!!!!!</h2>
            <p class="warranty-text">"<br><br><br><br><br><br><b>Book a Car with Us.</b><br> We provide a wide range of car categories and offer the easiest way to book a car. <br> For Further Information, click on know more button."</p>
            <button class="warranty-button" onclick="location.href='aboutus.jsp'">KNOW MORE</button>
        </div>
        <div class="card-header my-3">All CARS</div>
        <div class="grid" id="cars-grid">
            <% if (!cars.isEmpty()) { %>
                <% for (Cars c : cars) { %>
                    <div class="card">
                        <img class="card-img-top" src="Image?Car_id=<%= c.getCar_id() %>" alt="Car Image">
                        <div class="card-body">
                            <h5 class="card-title"><%= c.getName() %></h5>
                            <h6 class="price">Price: $<%= c.getPrice() %></h6>
                            <h6 class="category">Model: <%= c.getModel() %></h6>
                            <a href="add-to-cart?Car_id=<%= c.getCar_id() %>" class="btn btn-dark">Add to List</a>
                            <a href="book-now?quantity=1&Car_id=<%= c.getCar_id() %>" class="btn btn-primary">Book Now</a>
                        </div>
                    </div>
                <% } %>
            <% } else { %>
                <p>No cars available at the moment.</p>
            <% } %>
        </div>
    </div>

    <%@include file="includes/footer.jsp"%>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const grid = document.getElementById("cars-grid");
            grid.classList.add("visible");
        });
    </script>
</body>
</html>
