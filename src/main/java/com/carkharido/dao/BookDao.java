package com.carkharido.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carkharido.model.*;

public class BookDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public BookDao(Connection con) {
        this.con = con;
    }

    public boolean insertBook(Book model) {
        boolean result = false;
        try {
            query = "insert into bookings (Car_id, user_id, quantity, Booking_date) values (?, ?, ?, ?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getCar_id());
            pst.setInt(2, model.getUser_id());
            pst.setInt(3, model.getQuantity());
            pst.setString(4, model.getBooking_date());

            // Execute the prepared statement
            int rowsAffected = pst.executeUpdate();

            // If one or more rows are affected, consider it a successful insertion
            if (rowsAffected > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Book> userBookings(int id) {
        List<Book> list = new ArrayList<>();
        try {
            query = "select * from bookings where user_id=? order by Booking_id desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                CarsDao carsDao = new CarsDao(this.con);
                int cId = rs.getInt("Car_id");
                Cars cars = carsDao.getSingleCar(cId);
                book.setBooking_id(rs.getInt("Booking_id"));
                book.setCar_id(cId);
                book.setName(cars.getName());
                book.setModel(cars.getModel());
                book.setPrice(cars.getPrice() * rs.getInt("quantity"));
                book.setQuantity(rs.getInt("quantity"));
                book.setBooking_date(rs.getString("Booking_date"));
                list.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean cancelBooking(int id) {
        try {
            query = "delete from bookings where Booking_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return false;
    }
}
