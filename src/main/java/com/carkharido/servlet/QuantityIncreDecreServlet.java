package com.carkharido.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.carkharido.model.Cart;

/**
 * Servlet implementation class QuantityIncreDecreServlet
 */
public class QuantityIncreDecreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/type;charset=UTF-8");
	    try (PrintWriter out = response.getWriter();) {
	        String action = request.getParameter("action");
	        String carIdParam = request.getParameter("Car_id");
	        
	        // Check if car_id parameter is not null and not empty before parsing
	        if (carIdParam != null && !carIdParam.isEmpty()) {
	            int Car_id = Integer.parseInt(carIdParam);
	            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

	            if (action != null && Car_id >= 1) {
	                if (action.equals("inc")) {
	                    for (Cart c : cart_list) {
	                        if (c.getCar_id() == Car_id) {
	                            int quantity = c.getQuantity();
	                            quantity++;
	                            c.setQuantity(quantity);
	                            response.sendRedirect("cart.jsp");
	                            return;
	                        }
	                    }
	                }
	                if (action.equals("dec")) {
	                    for (Cart c : cart_list) {
	                        if (c.getCar_id() == Car_id && c.getQuantity() > 1) {
	                            int quantity = c.getQuantity();
	                            quantity--;
	                            c.setQuantity(quantity);
	                            break;
	                        }
	                    }
	                    response.sendRedirect("cart.jsp");
	                   
	                }
	                else {
	                	response.sendRedirect("cart.jsp");
					}
	            }
	        }

	        // Redirect to cart.jsp if there are no issues or invalid parameters
	        
	    }
	}


}
