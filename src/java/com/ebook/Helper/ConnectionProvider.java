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
                // 1. Properties file load karein (Sirf URL aur User ke liye)
                Properties props = new Properties();
                InputStream is = ConnectionProvider.class.getClassLoader().getResourceAsStream("com/ebook/Helper/db.properties");
                if (is != null) {
                    props.load(is);
                }

                // 2. Railway Environment Variables check karein (Higher Priority)
                // Agar Railway dashboard mein set hai, toh wahi uthayega
                String dbUrl = props.getProperty("db.url");
                String dbUser = props.getProperty("db.user");
                
                // Sabse zaroori change: Direct Environment Variable read karna
                String dbPass = System.getenv("DB_PASSWORD"); 

                // Agar environment variable null hai (local testing ke liye), toh props file se lo
                if (dbPass == null) {
                    dbPass = props.getProperty("db.password");
                }

                // 3. Driver load karein
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                
                // 4. Connection establish karein
                con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                System.out.println("Database Connected Successfully via Environment Variables!");
            }
        } catch (Exception e) {
            System.out.println("Connection Error: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }
}
