<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password - CarKhariDo</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding-top: 80px; /* Space for fixed navbar */
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Forgot Password</h2>
        <p>Please enter your email address to receive an OTP.</p>
        
        <form action="RequestOTPServlet" method="post">
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <button type="submit" class="btn btn-primary">Request OTP</button>
        </form>

        <hr>

        <p>Enter the OTP you received and your new password.</p>

        <form action="VerifyOTPServlet" method="post">
            <div class="form-group">
                <label for="otp">OTP</label>
                <input type="text" class="form-control" id="otp" name="otp" required>
            </div>
            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <a class="btn btn-danger btn-sm" href="login.jsp">Login</a>
        </form>

        <%
            if (request.getAttribute("message") != null) {
                out.print("<div class='alert alert-success'>" + request.getAttribute("message") + "</div>");
            } else if (request.getAttribute("error") != null) {
                out.print("<div class='alert alert-danger'>" + request.getAttribute("error") + "</div>");
            }
        %>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
