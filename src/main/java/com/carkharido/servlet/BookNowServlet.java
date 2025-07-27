package com.carkharido.servlet;

import jakarta.servlet.ServletException;
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

public class BookNowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            User auth = (User)request.getSession().getAttribute("auth");
            
            if (auth != null) {
                String carId = request.getParameter("Car_id");
                String quantityParam = request.getParameter("quantity");
                int carsQuantity = (quantityParam != null && !quantityParam.isEmpty()) ? Integer.parseInt(quantityParam) : 1;
                
                if (carsQuantity <= 0) {
                    carsQuantity = 1;
                }
                
                Book bookModel = new Book();
                bookModel.setCar_id(Integer.parseInt(carId));
                bookModel.setUser_id(auth.getId());
                bookModel.setQuantity(carsQuantity);
                bookModel.setBooking_date(formatter.format(date));
                
                BookDao bookDao = new BookDao(Dbcon.getConnection());
                boolean result = bookDao.insertBook(bookModel);
                
                if (result) {
                    ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                    if (cartList != null) {
                        for(Cart c : cartList) {
                            if (c.getCar_id() == Integer.parseInt(carId)) {
                                cartList.remove(cartList.indexOf(c));
                                break;
                            }
                        }
                    }
                    response.sendRedirect("booking.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
