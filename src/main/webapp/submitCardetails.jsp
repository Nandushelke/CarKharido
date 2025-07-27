<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="com.carkharido_user.Dbcon" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Details Submission</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>

<div class="container">
    <%
    String carRegNumber = request.getParameter("carRegNumber");
    String carName = request.getParameter("carName");
    String carModel = request.getParameter("carModel");
    String carPrice = request.getParameter("carPrice");

    Part filePart = request.getPart("carImage");
    String fileName = filePart.getSubmittedFileName();
    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
    
    // Ensure the upload directory exists
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }

    String filePath = uploadPath + File.separator + fileName;

    // Save the uploaded file to the server
    InputStream inputStream = filePart.getInputStream();
    FileOutputStream outputStream = new FileOutputStream(filePath);

    int read = 0;
    final byte[] bytes = new byte[1024];
    while ((read = inputStream.read(bytes)) != -1) {
        outputStream.write(bytes, 0, read);
    }
    
    inputStream.close();
    outputStream.close();

    // Save car details to the database
    Connection con = null;
    PreparedStatement pst = null;

    try {
        con = Dbcon.getConnection();
        String query = "INSERT INTO carsell (Register_Number, name, Model, Price, image) VALUES (?, ?, ?, ?, ?)";
        pst = con.prepareStatement(query);
        pst.setString(1, carRegNumber);
        pst.setString(2, carName);
        pst.setString(3, carModel);
        pst.setString(4, carPrice);
        pst.setString(5, filePath);
        int result = pst.executeUpdate();
        
        if (result > 0) {
            out.println("<h3>Car details submitted successfully!</h3>");
        } else {
            out.println("<h3>Failed to submit car details.</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>
</div>

<%@include file="includes/footer.jsp" %>
</body>
</html>
