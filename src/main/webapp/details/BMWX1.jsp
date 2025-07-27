<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <style>
        /* Style for product container */
        .product {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
            width: 300px;
        }
        /* Style for buttons */
        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%-- Dummy product details (Replace with your actual data) --%>
<%
    String productName = "Sample Product";
    String productDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    String imageURL = "https://via.placeholder.com/150";
%>

<div class="product">
    <h2><%=productName %></h2>
    <p><%=productDescription %></p>
    <img src="ma/bmw/b1.jpg " alt="Product Image" width="150">
    <br><br>
    <button class="button" onclick="addToCart()">Add to Cart</button>
    <button class="button" onclick="buyNow()">Buy Now</button>
</div>

<script>
    function addToCart() {
        alert("Product added to cart!");
        // Implement your logic for adding product to cart here
    }

    function buyNow() {
        alert("Redirecting to checkout...");
        // Implement your logic for redirecting to checkout here
    }
</script>

</body>
</html>
