<%@page import="java.text.DecimalFormat"%>
<%@ page import="com.carkharido_user.Dbcon" %>
<%@ page import="com.carkharido.model.*" %>
<%@ page import="com.carkharido.dao.*" %>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
DecimalFormat dcf=new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth=(User)request.getSession().getAttribute("auth");
List<Book> book=null;
if(auth!=null){
    request.setAttribute("auth", auth);
    book= new BookDao(Dbcon.getConnection()).userBookings(auth.getId());
}else{
    response.sendRedirect("login.jsp");
}
ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");

if(cart_list !=null){
    request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookings</title>
<%@include file="includes/head.jsp" %>
<style>
    body {
        background-image: url("CARS/bc.png"); /* Replace with the path to your image */
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 50px 0;
    }

    .container {
        
    	
    }

    .card-header {
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
   		
        background-color:orange;
        border-radius: 10px;
        box-shadow: maroon;
        padding: 10px;
        margin-bottom: 20px;
        text-align: center;
        font-size: 24px;
    }
.card-header my-3{
background-color:rgba(255, 255, 255, 0.8);}
    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .table th,
    .table td {
        padding: 10px;
        text-align: left;
    }

    .table th {
        background-color: #f0f0f0;
        border-bottom: 2px solid #ddd;
    }

    .table td {
        border-bottom: 1px solid #ddd;
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
</style>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<br>

<div class="container">
    <div class="card-header my-3">All Bookings</div>
    <table class="table table-light">
        <thead>
            <tr>
                <th scope="col">Date</th>
                <th scope="col">Name</th>
                <th scope="col">Model</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Cancel</th>
            </tr>
        </thead>
        <tbody>
            <% 
            if(book !=null){
                for(Book o: book){ %>
                    <tr>
                        <td><%= o.getBooking_date() %></td>
                        <td><%= o.getName() %></td>
                        <td><%= o.getModel() %></td>
                        <td><%= o.getQuantity() %></td>
                        <td>$<%= dcf.format(o.getPrice()) %></td>
                        <td><a class="btn btn-sm btn-danger" href="cancel-order?Booking_id=<%= o.getBooking_id() %>">Cancel</a></td>
                    </tr>
                <% } 
            } %>
        </tbody>
    </table>
</div>
<br><br><br><br><br><br><br><br>
<%@include file="includes/footer.jsp" %>
</body>
</html>
