package com.carkharido.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InitiateUPI extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String amount = request.getParameter("amount");
        String upiId = request.getParameter("upiId");

        // Log or handle the payment initiation details
        System.out.println("Initiating UPI payment");
        System.out.println("Amount: " + amount);
        System.out.println("UPI ID: " + upiId);

        // Here you would redirect to the payment gateway UPI URL
        response.setContentType("text/html");
        response.getWriter().println("<h2>UPI Payment Initiated</h2>");
        response.getWriter().println("<p>Amount: " + amount + "</p>");
        response.getWriter().println("<p>UPI ID: " + upiId + "</p>");
        response.getWriter().println("<p>Please complete the payment via your UPI app.</p>");
    }
}
