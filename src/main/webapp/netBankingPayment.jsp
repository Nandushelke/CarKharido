<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Net Banking Payment</title>
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
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"], select {
            width: 100%;
            padding: 8px;
            margin: 5px 0 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Net Banking Payment Form</h2>
        <form action="initiateNetBanking.jsp" method="post">
            <label for="amount">Amount:</label>
            <input type="text" id="amount" name="amount" required />
            <label for="bank">Select Bank:</label>
            <select id="bank" name="bank">
                <option value="bank1">Bank 1</option>
                <option value="bank2">Bank 2</option>
                <!-- Add more banks as needed -->
            </select>
            <input type="submit" value="Pay with Net Banking" />
        </form>
    </div>
</body>
</html>
