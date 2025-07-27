<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Order Confirmed</h2>
        <p>Amount: <%= request.getParameter("amount") %></p>
        <p>Delivery Address: <%= request.getParameter("address") %></p>
        <p>Thank you for your order. You will pay in cash upon delivery.</p>
    </div>
</body>
</html>
