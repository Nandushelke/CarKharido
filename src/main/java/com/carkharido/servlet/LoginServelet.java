package com.carkharido.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.carkharido.dao.UserDao;
import com.carkharido.model.User;
import com.carkharido_user.Dbcon;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");

            UserDao userDao = new UserDao(Dbcon.getConnection());
            User user = userDao.userLogin(email, password);

            if (user != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("auth", user);
                response.sendRedirect("index.jsp");
            } else {
                // User authentication failed
                String errorMessage = "Invalid email or password. Please try again.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Error handling: Print stack trace or redirect to error page
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
