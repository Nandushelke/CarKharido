<%@page import="java.text.DecimalFormat"%>
<%@page import="com.carkharido_user.Dbcon"%>
<%@page import="com.carkharido.model.*"%>
<%@page import="com.carkharido.dao.*"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartproduct = null;
    if (cart_list != null) {
        CarsDao cDao = new CarsDao(Dbcon.getConnection());
        cartproduct = cDao.getCartCars(cart_list);
        double total = cDao.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list", cartproduct);
        request.setAttribute("total", total);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carkharido Cart</title>
    <%@include file="includes/head.jsp"%>
    <style>
        body {
            background-image: url("CARS/bc.png");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 50px 0;
        }
        .container {
            padding: 20px;
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
            background-color: white;
        }
        .card img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            font-size: 20px;
            margin-bottom: 10px;
        }
        .price, .category {
            font-size: 16px;
            margin-bottom: 10px;
        }
        .btn {
            display: block;
            width: 100%;
            margin-top: 10px;
        }
        .total-price {
            font-size: 24px;
            color: #007bff;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            color: #fff;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
        .btn-sm {
            padding: 6px 12px;
            font-size: 14px;
        }
        .btn-incre,
        .btn-decre {
            box-shadow: none;
            font-size: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .btn-incre:hover,
        .btn-decre:hover {
            color: #0056b3;
        }
        .form-group {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .form-control {
            width: 50px;
            text-align: center;
            margin: 0 5px;
        }
    </style>
</head>
<body>
    <%@include file="includes/navbar.jsp"%>
    <br>
    <div class="container">
        <h3 class="total-price">Total Price: $ ${(total>0)?dcf.format(total):0}</h3>
        <a class="btn btn-primary" href="check-out">Check Out</a>
        <div class="grid" id="cart-grid">
            <% if (cartproduct != null && !cartproduct.isEmpty()) {
                for (Cart c : cartproduct) { %>
                    <div class="card">
                        <img src="Image?Car_id=<%= c.getCar_id() %>" alt="Car Image">
                        <div class="card-body">
                            <h5 class="card-title"><%= c.getName() %></h5>
                            <p class="category">Model: <%= c.getModel() %></p>
                            <p class="price">Price: $<%= dcf.format(c.getPrice()) %></p>
                            <div class="form-group">
                                <a class="btn btn-decre" href="quantity-inc-dec?action=dec&Car_id=<%= c.getCar_id() %>"><i class="fas fa-minus-circle"></i></a>
                                <input type="text" name="quantity" class="form-control" value="<%= c.getQuantity() %>" readonly>
                                <a class="btn btn-incre" href="quantity-inc-dec?action=inc&Car_id=<%= c.getCar_id() %>"><i class="fas fa-plus-circle"></i></a>
                            </div>
                            <a class="btn btn-primary btn-sm" href="book-now?Car_id=<%= c.getCar_id()%>">Book Now</a>
                            <a class="btn btn-danger btn-sm" href="remove-from-cart?Car_id=<%= c.getCar_id() %>">Remove</a>
                        </div>
                    </div>
                <% }
            } else { %>
                <p>No items in the cart.</p>
            <% } %>
        </div>
    </div>
    <%@include file="includes/footer.jsp"%>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const grid = document.getElementById("cart-grid");
            grid.classList.add("visible");
        });
    </script>
</body>
</html>
