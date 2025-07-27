package com.carkharido.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import com.carkharido.dao.BookDao;
import com.carkharido_user.Dbcon;

public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("Booking_id");
            if (id != null) {
                BookDao bookDao = new BookDao(Dbcon.getConnection());
                boolean cancelled = bookDao.cancelBooking(Integer.parseInt(id));
                if (cancelled) {
                    // Booking successfully cancelled, redirect back to bookings page
                    response.sendRedirect("booking.jsp");
                   
                }
            }
            // If cancellation failed or no booking ID provided, redirect back to bookings page
            response.sendRedirect("booking.jsp");
        } catch (Exception e) {
            // Handle unexpected errors
            e.printStackTrace();
            // Redirect back to bookings page
            response.sendRedirect("booking.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward POST requests to doGet method
        doGet(request, response);
    }
}
