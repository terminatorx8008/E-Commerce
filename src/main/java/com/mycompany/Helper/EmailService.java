package com.mycompany.Helper;


import Data.User;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class EmailService {

    int number;

    public String generateOtp(User user) {
        Random rnd = new Random();
        number = rnd.nextInt(999999);
        String num= String.format("%06d", number);
        user.setOtp(num);
        return num;
        
    }

    public boolean sendEmail(User user) {
        String to = user.getEmail();
        String from = "vasunamdevidformovies@gmail.com"; // Corrected email address
        boolean flag = false; // Corrected variable name

        try {
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true"); // Changed to string value
            properties.put("mail.smtp.starttls.enable", "true"); // Changed to string value
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.host", "smtp.gmail.com"); // Corrected SMTP host

            Session session = Session.getInstance(properties, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    String password = "rqbryvmnwbmzzlyg"; // Replace with your app password
                    String user_name = "vasunamdevidformovies";
                    return new PasswordAuthentication(user_name, password);
                }
            });

            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(from));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            mess.setSubject("Your OTP is: "); // Include OTP in the subject
            mess.setText("Enter the given OTP for setting a new password: " + generateOtp(user)); // Include OTP in the content

            Transport.send(mess);
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
