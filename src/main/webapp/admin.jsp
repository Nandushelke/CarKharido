<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Car Form</title>
</head>
<body>
    <h1>Enter Car Details:</h1>
    <form action="car-from" method="post" enctype="multipart/form-data">
     
        <label>Name:</label>
        <input type="text" name="name" required><br>
        <label>Model:</label>
        <input type="text" name="model" required><br>
        <label>Price:</label>
        <input type="text" name="price" required><br>
        <label>Image:</label>
        <input type="file" name="image" required><br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>