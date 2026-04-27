package com.ebook.Helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.io.InputStream;

public class ConnectionProvider {
    private static Connection con = null;

    public static Connection getConnection() {
        try {
            if (con == null || con.isClosed()) {
                // 1. Load the secret properties file
                Properties props = new Properties();
                InputStream is = ConnectionProvider.class.getClassLoader().getResourceAsStream("com/ebook/Helper/db.properties");
                props.load(is);

                // 2. Load the Driver (The way you know works)
                Class.forName("com.mysql.jdbc.Driver"); 
                
                // 3. Connect directly
                con = DriverManager.getConnection(
                    props.getProperty("db.url"), 
                    props.getProperty("db.user"), 
                    props.getProperty("db.password")
                );
            }
        } catch (Exception e) {
            System.out.println("Connection Error: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }
}