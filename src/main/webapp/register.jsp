<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            background-image: url("CARS/bc.png"); /* Change 'background.jpg' to your background image file */
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
        .login-link {
            text-align: center;
            margin-top: 10px;
        }
        .login-button {
            width: calc(100% - 20px); /* Adjusted width */
            padding: 8px; /* Adjusted padding */
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }
        .login-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="CARS/logo.png" alt="Logo" style="display: block; margin: 0 auto; width: 150px; margin-bottom: 20px;"> <!-- Change 'logo.png' to your logo file -->
        <h2>Register</h2>
        <!-- Print error message if present -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        <form action="register-user" method="post"> <!-- Adjust 'action' attribute based on your servlet URL -->
            <input type="text" name="name" placeholder="Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="tel" name="phone" placeholder="Phone" required>
            <input type="text" name="address" placeholder="Address" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Register">
        </form>
        <div class="login-link">
            <a class="loginu" href="login.jsp">Already Register:Please Login</a>
        </div>
        
        
    </div>
</body>
</html>
