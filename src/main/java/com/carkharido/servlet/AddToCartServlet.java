package com.carkharido.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import com.carkharido.model.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCartServlet
 */


public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
			
		try(PrintWriter out= response.getWriter() ){
			
			ArrayList<Cart> cartlist= new ArrayList<>();
			
			int Car_id=Integer.parseInt(request.getParameter("Car_id"));
			Cart cm= new Cart();
			cm.setCar_id(Car_id);
			cm.setQuantity(1);
			
			
			HttpSession session= request.getSession();
			ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
			
			if (cart_list==null) {
				cartlist.add(cm);
				session.setAttribute("cart-list", cartlist);
				response.sendRedirect("index.jsp");
			}else {
				cartlist= cart_list;
				boolean exist=false;
				
				
				for(Cart c: cartlist) {
					if (c.getCar_id()==Car_id) {
						exist=true;
					}
					out.print("<h3 style='color:crimson; text-align:center'>Items already exist in cart.<a href='cart.jsp'>Go to the cart page</a></h3>");
			
				}
				if(!exist) {
				cartlist.add(cm);	
				response.sendRedirect("index.jsp");
				}
			}
		}
	
	}

}
