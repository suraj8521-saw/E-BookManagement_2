package com.ebook.Helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection con = null;

    public static Connection getConnection() {
        try {
            if (con == null || con.isClosed()) {
                // 1. Correct JDBC Format with SSL parameters
                // Note: Humne ssl-mode=REQUIRED ko verifyServerCertificate=false ke saath joda hai taaki Railway crash na kare
                String dbUrl = "jdbc:mysql://mysql-2671b501-suraj71442-45b8.h.aivencloud.com:13931/defaultdb?useSSL=true&requireSSL=true&verifyServerCertificate=false";
                String dbUser = "avnadmin";
                
                // 2. Railway Environment Variable
                String dbPass = System.getenv("DB_PASSWORD");

                // Debug log for Railway console
                System.out.println("Attempting to connect to Aiven MySQL...");

                // 3. Driver Load
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // 4. Connection
                con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                System.out.println("SUCCESS: Connected to Aiven!");
            }
        } catch (Exception e) {
            System.err.println("CONNECTION FAILED: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }
}
