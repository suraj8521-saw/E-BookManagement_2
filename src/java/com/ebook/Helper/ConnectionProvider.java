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
                // 1. Hardcoded values fallback ke liye (Railway URL change nahi hota)
                String dbUrl = "jdbc:mysql://mysql-2671b501-suraj71442-45b8.h.aivencloud.com:13931/defaultdb?ssl-mode=REQUIRED";
                String dbUser = "avnadmin";
                
                // 2. Railway Environment Variable read karna
                String dbPass = System.getenv("DB_PASSWORD");

                // Debugging ke liye logs (Railway Deploy Logs mein dikhega)
                if (dbPass == null || dbPass.isEmpty()) {
                    System.out.println("DEBUG: DB_PASSWORD Environment Variable NOT FOUND!");
                } else {
                    System.out.println("DEBUG: Environment Variable Loaded Successfully.");
                }

                // 3. Driver Load (Modern Driver)
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                } catch (ClassNotFoundException e) {
                    Class.forName("com.mysql.jdbc.Driver"); // Purana driver backup
                }

                // 4. Connection Establish
                con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            }
        } catch (Exception e) {
            System.err.println("CRITICAL CONNECTION ERROR: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }
}
