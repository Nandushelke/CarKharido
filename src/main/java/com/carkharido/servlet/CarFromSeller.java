package com.carkharido.servlet;

import com.carkharido.model.User;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.Properties;

//Import statements remain the same as in your code

public class CarFromSeller extends HttpServlet {

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     String carRegNumber = request.getParameter("carRegNumber");
     String carName = request.getParameter("carName");
     String carModel = request.getParameter("carModel");
     String carPrice = request.getParameter("carPrice");
     
    
     // Retrieve the authenticated user's email address from the session
     User auth = (User) request.getSession().getAttribute("auth");
     if (auth != null) {
         String userEmail = auth.getEmail(); // Assuming there's a getEmail() method in the User class

         Part filePart = request.getPart("carImage");
         if (filePart != null) {
             // Process the file upload and save the file to the server

             // Send email with form details
             if (sendEmail(userEmail, carRegNumber, carName, carModel, carPrice)) {
                 // Email sent successfully, redirect to a success page
                 response.sendRedirect("sell.jsp");
             } else {
                 // Failed to send email, redirect to an error page
                 response.sendRedirect("sell.jsp");
             }
         } else {
             // Handle the case where filePart is null
             response.sendRedirect("sell.jsp");
         }
     } else {
         // User not authenticated, redirect to a login page
         response.sendRedirect("login.jsp");
     }
 }

 private boolean sendEmail(String userEmail, String carRegNumber, String carName, String carModel, String carPrice) {
     // SMTP server details
     String host = "smtp.gmail.com";
     String port = "587";
     String username = "carkharido4140@gmail.com"; // Update with your Gmail email
     String password = "dwgb jhln pqsj tnll"; // Update with your Gmail password

     // Email properties
     Properties props = new Properties();
     props.put("mail.smtp.host", host);
     props.put("mail.smtp.port", port);
     props.put("mail.smtp.auth", "true");
     props.put("mail.smtp.starttls.enable", "true");

     // Create a mail session with authentication
     Session session = Session.getInstance(props, new Authenticator() {
         @Override
         protected PasswordAuthentication getPasswordAuthentication() {
             return new PasswordAuthentication(username, password);
         }
     });

     try {
         // Create a message
         Message message = new MimeMessage(session);
         message.setFrom(new InternetAddress(username));
         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
         message.setSubject("Car Registration Details");

         // Construct the message body
         String messageBody = "Car Registration Number: " + carRegNumber + "\n"
                             + "Car Name: " + carName + "\n"
                             + "Car Model: " + carModel + "\n"
                             + "Car Price: " + carPrice;
         message.setText(messageBody);

         // Send the message
         Transport.send(message);
         return true; // Email sent successfully
     } catch (MessagingException e) {
         e.printStackTrace();
         // Handle the messaging exception, if necessary
         return false; // Failed to send email
     }
 }
}
