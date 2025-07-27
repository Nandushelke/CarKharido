package com.carkharido.servlet;

import com.carkharido.dao.UserDao;
import com.carkharido.model.User;
import com.carkharido_user.Dbcon;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class VerifyOTPServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String otp = request.getParameter("otp");
        String newPassword = request.getParameter("newPassword");

        Connection con = null;
        try {
            con = Dbcon.getConnection();
            UserDao userDao = new UserDao(con);
            User user = userDao.getUserByOTP(otp);

            if (user != null) {
                user.setPassword(newPassword);
                user.setOtp(null); // Clear the OTP after verification
                userDao.updateUser(user);

                request.setAttribute("message", "Password has been updated successfully.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Invalid OTP.");
                request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("Database error occurred", e);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
