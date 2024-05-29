/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Dell
 */
public class forgotPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        HttpSession mySession = request.getSession();
        UserDAO userDAO = new UserDAO();
        if (email != null || !email.equals("")) {
            // sending new password
            String passGen = generateRandomPassword(8);
            // update password generate random
            userDAO.updatePassword(email, passGen);

            String to = email;// change accordingly
            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("hoangthhek17@gmail.com", "ghvl eyfe jmiq lwzt");// Put your email
                    // id and
                    // password here
                }
            });
            // compose message
            try {
                // Create MimeMessage within try-with-resources to ensure it's closed properly
                try (Transport transport = session.getTransport("smtp")) {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email)); // Set the sender's email address
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // Set the recipient's email address
                    message.setSubject("Xin chào!"); // Set the email subject
                    message.setText("Mật khẩu mới của bạn là: " + passGen); // Set the email content

                    // Send the message
                    transport.connect(); // Connect to the mail server
                    transport.sendMessage(message, message.getAllRecipients()); // Send the email
                    // No need to print success message as it's already sent
                }
            } catch (MessagingException e) {
                // Handle any messaging related exceptions
                throw new RuntimeException("Failed to send email", e);
            }
            dispatcher = request.getRequestDispatcher("EnterNewPassword.jsp");
            request.setAttribute("message", "Mat khau moi da duoc gui den ban , vui long kiem tra email");
            mySession.setAttribute("passGen", passGen);
            mySession.setAttribute("email", email);
            dispatcher.forward(request, response);
        }
    }

    private String generateRandomPassword(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random rand = new Random();
        StringBuilder password = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            password.append(characters.charAt(rand.nextInt(characters.length())));
        }
        return password.toString();
    }

}
