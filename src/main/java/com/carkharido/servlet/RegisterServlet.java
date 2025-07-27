package com.carkharido.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.carkharido.dao.UserDao;
import com.carkharido.model.User;
import com.carkharido_user.Dbcon;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve parameters from the request
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            long phone = Long.parseLong(request.getParameter("phone"));

            String address = request.getParameter("address");
            String password = request.getParameter("password");
            
            // Create a User object with the retrieved parameters
            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setAddress(address);
            user.setPassword(password);
            
            // Instantiate the UserDao and insert the user into the database
            UserDao userDao = new UserDao(Dbcon.getConnection());
            boolean registered = userDao.registerUser(user);
            
            if (registered) {
                // Registration successful, redirect to a success page
                response.sendRedirect("login.jsp"); // Change to your success page
            } else {
                // Registration failed, set error message and redirect back to register.jsp
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Handle unexpected errors
            e.printStackTrace();
            // Redirect to an error page
            response.sendRedirect("register.jsp"); // Change to your error page
        }
    }
}
