package com.ebook.Helper;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import jakarta.mail.Message;
import jakarta.mail.Transport;
import java.io.InputStream;

/**
 * Standardized Email Helper
 * Reads credentials from db.properties for security
 * @author suraj
 */
public class EmailSendForUserContactUsPage {

    public boolean sendEmail(String content, String subject, String recipientAddress) {
        boolean send = false;
        
        try {
            // 1. Load credentials from the properties file
            Properties configProps = new Properties();
            InputStream is = getClass().getClassLoader().getResourceAsStream("com/ebook/Helper/db.properties");
            
            if (is == null) {
                System.out.println("Error: db.properties not found in com.ebook.Helper");
                return false;
            }
            configProps.load(is);

            final String userName = configProps.getProperty("mail.user");
            final String password = configProps.getProperty("mail.pass");

            // 2. Setup SMTP Server Properties
            Properties smtpProps = new Properties();
            smtpProps.put("mail.smtp.auth", "true");
            smtpProps.put("mail.smtp.starttls.enable", "true");
            smtpProps.put("mail.smtp.port", "587");
            smtpProps.put("mail.smtp.host", "smtp.gmail.com");

            // 3. Create Session with Authenticator
            Session session = Session.getInstance(smtpProps, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(userName, password);
                }
            });

            // 4. Compose the Message
            Message m = new MimeMessage(session);
            m.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientAddress));
            m.setFrom(new InternetAddress(userName)); // Uses the email from properties
            m.setSubject(subject);
            m.setContent(content, "text/html");

            // 5. Send Email
            Transport.send(m);
            send = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return send;
    }
}