package com.carkharido.servlet;

import com.carkharido.dao.UserDao;
import com.carkharido.model.User;
import com.carkharido.util.EmailUtil;
import com.carkharido_user.Dbcon;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;


public class RequestOTPServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        UserDao userDao = null;
		try {
			userDao = new UserDao(Dbcon.getConnection());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        User user = userDao.getUserByEmail(email);

        if (user != null) {
            String otp = generateOTP();
            user.setOtp(otp);
            userDao.updateUser(user);

            EmailUtil.sendEmail(email, "Your OTP for CarKhariDo", "Your OTP is: " + otp);

            request.setAttribute("message", "OTP has been sent to your email address.");
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Email address not found.");
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
        }
    }

    private String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }
}
