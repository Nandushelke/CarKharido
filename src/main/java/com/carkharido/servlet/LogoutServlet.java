package com.carkharido.servlet;



import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class LogoutServlet
 */

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try (PrintWriter out = response.getWriter()) {
	        if (request.getSession().getAttribute("auth") != null) { // Removed semicolon here
	            request.getSession().removeAttribute("auth");
	            response.sendRedirect("login.jsp");
	        } else {
	          response.sendRedirect("index.jsp");  
	        }
	    }
	}


}
