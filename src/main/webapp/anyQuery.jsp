<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - CarKhariDo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-primary {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .success-message {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #d4edda;
            background-color: #d4edda;
            color: #155724;
            border-radius: 4px;
        }
        .faq {
            margin-top: 30px;
        }
        .faq h2 {
            margin-bottom: 20px;
        }
        .faq dt {
            font-weight: bold;
            margin-top: 20px;
        }
        .faq dd {
            margin-left: 20px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<br>
    <div class="container">
        <h1>Contact Us</h1>
        <% 
            String message = (String) request.getAttribute("message");
            if (message != null && !message.isEmpty()) {
        %>
            <div class="success-message">
                <%= message %>
            </div>
        <% 
            }
        %>
        <form action="submitQuery" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address">
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            <button type="submit" class="btn-primary">Submit</button>
        </form>

        <div class="faq">
            <h2>Frequently Asked Questions</h2>
            <dl>
                <dt>What is CarKhariDo?</dt>
                <dd>CarKhariDo is a platform where you can buy and sell used cars with ease. We provide a seamless experience for both buyers and sellers.</dd>

                <dt>How do I sell my car on CarKhariDo?</dt>
                <dd>To sell your car, simply create an account, list your car with all the necessary details and photos, and wait for interested buyers to contact you.</dd>

                <dt>Is there a fee for listing my car?</dt>
                <dd>No, listing your car on CarKhariDo is completely free. We do not charge any fees for listing your vehicle on our platform.</dd>

                <dt>How do I contact a seller?</dt>
                <dd>You can contact a seller directly through the contact information provided in the car listing. If the seller has enabled messaging through CarKhariDo, you can also send a message directly from the listing page.</dd>

                <dt>What should I do if I encounter a problem?</dt>
                <dd>If you encounter any problems, please reach out to our support team through the "Contact Us" form on this page, or email us at support@carkharido.com. We are here to help you with any issues you may face.</dd>
            </dl>
        </div>
    </div>
    <br>
    <%@include file="includes/footer.jsp" %>
</body>
</html>
