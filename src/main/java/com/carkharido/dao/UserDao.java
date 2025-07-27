package com.carkharido.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.carkharido.model.User;
import com.carkharido_user.Dbcon;

public class UserDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public UserDao(Connection con) {
        this.con = con;
    }

    public User userLogin(String email, String password) {
        User user = null;
        try {
            query = "SELECT * FROM users WHERE email=? AND password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getLong("phone"));
                user.setAddress(rs.getString("address"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }

        return user;
    }

    public boolean registerUser(User user) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Dbcon.getConnection();
            String sql = "INSERT INTO users (name, email, phone, address, password) VALUES (?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setLong(3, user.getPhone());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getPassword());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // If rowsAffected > 0, registration is successful
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Registration failed due to SQL exception
        }
    }

    public User getUserByEmail(String email) {
        User user = null;
        try {
            query = "SELECT * FROM users WHERE email = ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            rs = pst.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getLong("phone"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setOtp(rs.getString("otp"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User getUserByOTP(String otp) {
        User user = null;
        try {
            query = "SELECT * FROM users WHERE otp = ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, otp);
            rs = pst.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getLong("phone"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setOtp(rs.getString("otp"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public void updateUser(User user) {
        try {
            query = "UPDATE users SET password = ?, otp = ? WHERE id = ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, user.getPassword());
            pst.setString(2, user.getOtp());
            pst.setInt(3, user.getId());
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

	
}
