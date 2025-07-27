package com.carkharido.servlet;

import java.io.*;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class CarFromServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/carkharido_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String model = request.getParameter("model");
        String priceString = request.getParameter("price");
        Part filePart = request.getPart("image");

        // Validate price
        double price = 0.0; // Default value
        if (priceString != null && !priceString.trim().isEmpty()) {
            try {
                price = Double.parseDouble(priceString);
            } catch (NumberFormatException e) {
                // Handle invalid price format
                e.printStackTrace();
                request.setAttribute("error", "Invalid price format");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
                return; // Stop further processing
            }
        }

        // Connect to the database and save the car
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO cars (name, model, price, image) VALUES (?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, name);
                    statement.setString(2, model);
                    statement.setDouble(3, price);
                    statement.setBinaryStream(4, filePart.getInputStream());
                    statement.executeUpdate();
                }
            }
            // Redirect to the car list page after successful insertion
            response.sendRedirect("admin.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            // Handle database-related errors
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
    }
}
