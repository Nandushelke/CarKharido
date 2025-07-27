<%@ page import="com.carkharido_user.Dbcon" %>
<%@ page import="com.carkharido.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
User auth=(User)request.getSession().getAttribute("auth");
if(auth!=null){
    request.setAttribute("auth", auth);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carkharido - Sell Your Car</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<br><br><br><br>

<div class="container">
    <h2>Sell Your Car</h2>
    <form action="https://api.web3forms.com/submit" method="POST">
        <div class="form-group">
        <input type="hidden" name="access_key" value="af8d986d-09e5-4b11-b148-79dafe71c5a1">
            <label for="carRegNumber">Car Register Number (Format: MH21-DC-2025):</label>
            <input type="text" class="form-control" id="carRegNumber" name="carRegNumber" pattern="[A-Z]{2}[0-9]{2}-[A-Z]{2}-[0-9]{4}" required>
        </div>
        <div class="form-group">
            <label for="carName"> Car Name:</label>
            <input type="text" class="form-control" id="carName" name="carName" required>
        </div>
        <div class="form-group">
            <label for="carModel">Model:</label>
            <input type="text" class="form-control" id="carModel" name="carModel" required>
        </div>
        <div class="form-group">
            <label for="carPrice">Price:</label>
            <input type="number" class="form-control" id="carPrice" name="carPrice" required>
        </div>
        <div class="form-group">
            <label for="carImage">Image:</label>
            <input type="file" class="form-control" id="carImage" name="carImage" accept="image/*" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
<br><br><br><br><br><br><br><br><br>

<%@include file="includes/footer.jsp" %>
</body>
</html>
