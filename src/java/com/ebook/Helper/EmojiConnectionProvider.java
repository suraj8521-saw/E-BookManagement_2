package com.ebook.Helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.io.InputStream;

/**
 * Updated to use secure properties logic
 * @author suraj
 */
public class EmojiConnectionProvider {
    private static Connection con = null;
    
    public static Connection getConnection() {
        try {
            if (con == null || con.isClosed()) {
                // 1. Load the secret properties file
                Properties props = new Properties();
                InputStream is = EmojiConnectionProvider.class.getClassLoader().getResourceAsStream("com/ebook/Helper/db.properties");
                
                if (is == null) {
                    System.out.println("Error: db.properties not found for EmojiProvider");
                    return null;
                }
                props.load(is);

                // 2. Load the Driver
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                
                // 3. Connect using the URL that supports emojis (utf8mb4)
                // Note: Make sure your db.url in db.properties includes ?useUnicode=true&characterEncoding=utf8mb4
                con = DriverManager.getConnection(
                    props.getProperty("db.url"), 
                    props.getProperty("db.user"), 
                    props.getProperty("db.password")
                );
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}