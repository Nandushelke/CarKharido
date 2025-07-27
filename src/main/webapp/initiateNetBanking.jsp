<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Net Banking Payment Status</title>
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
        <h2>Net Banking Payment Initiated</h2>
        <p>Amount: <%= request.getParameter("amount") %></p>
        <p>Bank: <%= request.getParameter("bank") %></p>
        <p>Please complete the payment via your bank's net banking interface.</p>
    </div>
</body>
</html>
