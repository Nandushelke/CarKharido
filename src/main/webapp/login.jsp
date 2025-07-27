<%@ page import="com.carkharido.model.*" %>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");

    if (cartList != null) {
        request.setAttribute("cartList", cartList);
    }

    // Check if login failed and display error message
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CarKhariDo Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url("CARS/bc.png"); /* Replace 'path/to/background-image.jpg' with your background image path */
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            width: 400px;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.8); /* Adjust the opacity as needed */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border-radius: 10px 10px 0 0;
            padding: 15px;
            text-align: center;
        }
        .card-body {
            padding: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            width: 100%;
            margin-bottom: 10px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            width: 100%;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }
        .logo {
            display: block;
            margin: 0 auto;
            margin-bottom: 650px; /* Adjust the margin bottom as needed */
            width: 350px; /* Adjust the width of the logo */
        }
    </style>
</head>
<body>
    <img src="CARS/logo.png" alt="Logo" class="logo">
    <div class="container">
        <div class="card">
            <div class="card-header">User Login</div>
            <div class="card-body">
                <%-- Display error message if login failed --%>
                <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= errorMessage %>
                    </div>
                <% } %>
                <form action="user-login" method="post">
                    <div class="form-group">
                        <label>Email Address</label> 
                        <input type="email" class="form-control" name="login-email" placeholder="Enter your Email" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label> 
                        <input type="password" class="form-control" name="login-password" placeholder="Enter your Password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
                </form>
                <div class="text-center">
                    <a href="forgotpassword.jsp" class="btn btn-secondary">Forgot Password</a>
                    <div class="login-link">
                        <a class="" href="register.jsp">New to CarkhariDo:Please Register:</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
