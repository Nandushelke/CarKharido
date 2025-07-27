<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Gateway</title>
</head>
<body>
    <h2>Payment Form</h2>
    <form action="processPayment.jsp" method="post">
        <label for="amount">Amount:</label>
        <input type="text" id="amount" name="amount" required /><br/><br/>
        <label for="cardNumber">Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" required /><br/><br/>
        <label for="expiryDate">Expiry Date (MM/YY):</label>
        <input type="text" id="expiryDate" name="expiryDate" required /><br/><br/>
        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" required /><br/><br/>
        <input type="submit" value="Pay Now" />
    </form>
</body>
</html>
