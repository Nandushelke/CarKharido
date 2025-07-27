package com.carkharido.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.io.IOException;
import java.util.Properties;


public class SubmitQueryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String message = request.getParameter("message");

        // Implement email sending logic
        sendEmail(name, email, address, message);

        // Redirect to a success page or display a success message
        response.sendRedirect("anyQuery.jsp");
    }

    private void sendEmail(String name, String email, String address, String messageContent) {
        String host = "smtp.gmail.com";
        String port = "587";
        String username = "carkharido4140@gmail.com";  // Use your email
        String password = "dwgb jhln pqsj tnll";  // Use your email password

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("nandushelke145@gmail.com"));  // Change to your support email
            message.setSubject("User Query from " + name);

            String messageBody = "Name: " + name + "\n"
                                + "Email: " + email + "\n"
                                + "Address: " + address + "\n"
                                + "Message: " + messageContent;
            message.setText(messageBody);

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            // Handle messaging exception
        }
    }
}
