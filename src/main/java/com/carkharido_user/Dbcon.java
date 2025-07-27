package com.carkharido_user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbcon {

    private static Connection connection = null;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (connection == null || connection.isClosed()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/carkharido_db", "root", "root");
            System.out.println("Connected to the database");
        }
        return connection;
    }
}
