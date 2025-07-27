package com.carkharido.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.carkharido_user.Dbcon;

/**
 * Servlet implementation class ImageServlet
 */
public class ImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String carId = request.getParameter("Car_id");
        System.out.println("Fetching image for Car_id: " + carId); // Debug

        if (carId != null && !carId.isEmpty()) {
            try (Connection conn = Dbcon.getConnection()) {
                String sql = "SELECT image FROM cars WHERE Car_id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, Integer.parseInt(carId));
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            byte[] imgData = rs.getBytes("image");
                            if (imgData != null) {
                                response.setContentType("image/jpeg");
                                try (OutputStream os = response.getOutputStream()) {
                                    os.write(imgData);
                                }
                                System.out.println("Image fetched and written to output stream"); // Debug
                            } else {
                                System.out.println("No image found for Car_id: " + carId); // Debug
                            }
                        } else {
                            System.out.println("No data found for Car_id: " + carId); // Debug
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Car_id parameter is missing or empty");
        }
    }
}