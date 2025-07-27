package com.carkharido.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.carkharido.dao.BookDao;
import com.carkharido.model.Book;
import com.carkharido.model.Cart;
import com.carkharido.model.User;
import com.carkharido_user.Dbcon;

/**
 * Servlet implementation class CheckOutServlet
 */
public class CheckOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out= response.getWriter()) {
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date=new Date();    
            
            // Retrieve all list cars
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");  
            // User authentication
            User auth = (User) request.getSession().getAttribute("auth");
            
            // Check auth and list
            if (cart_list != null && auth != null) {
                for(Cart c : cart_list) {
                    // Prepare booking object
                    Book book = new Book();
                    book.setCar_id(c.getCar_id());
                    book.setUser_id(auth.getId());
                    book.setQuantity(c.getQuantity());
                    book.setBooking_date(formatter.format(date));
                    
                    // Instantiate the dao class
                    BookDao oDao = new BookDao(Dbcon.getConnection());
                    // Call insert method
                    boolean result = oDao.insertBook(book);
                    if(!result) break;
                }
                cart_list.clear();
                response.sendRedirect("booking.jsp");
            } else {
                if (auth == null) {
                    response.sendRedirect("login.jsp");
                } else {
                    response.sendRedirect("cart.jsp");
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }    
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
