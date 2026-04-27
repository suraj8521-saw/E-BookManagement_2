package com.ebook.config;

import java.io.InputStream;
import java.util.Properties;

public class RazorpayConfig {
    private static Properties props = new Properties();

    static {            // एक बार ही load
        try (InputStream in =
            RazorpayConfig.class.getClassLoader()
                 .getResourceAsStream("com/ebook/config/razorpay.properties")) {
            props.load(in);
        } catch (Exception e) { e.printStackTrace(); }
    }

    public static String get(String key) {       // 👉 अब ये काम करेगा
        return props.getProperty(key);
    }
}

