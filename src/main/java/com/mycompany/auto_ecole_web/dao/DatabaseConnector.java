package com.mycompany.auto_ecole_web.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class DatabaseConnector {

    // Method to establish a database connection
    public static Connection connect() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // Handle ClassNotFoundException
            e.printStackTrace();
            return null;
        }

        return DriverManager.getConnection("jdbc:mysql://localhost:3305/auto_ecole?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
    }

    // Method to close a database connection
    public static void close(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
