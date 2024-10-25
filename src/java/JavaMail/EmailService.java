/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package JavaMail;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.ArrayList;
import java.util.Properties;
import model.Address;
import model.Product;

/**
 *
 * @author KEISHA
 */
public class EmailService implements IJavaMail {

    public boolean send(String sendTo, String topic, String messageContent, String verificationLink) {
        // Get properties object
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", EmailProperty.HOST_NAME);
        props.put("mail.smtp.socketFactory.port", EmailProperty.SSL_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", EmailProperty.SSL_PORT);

        // Get Session
        Session session = Session.getDefaultInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailProperty.APP_EMAIL, EmailProperty.APP_PASSWORD);
            }
        });

        // Compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendTo));
            message.setSubject(topic);

            // Tạo nội dung HTML với button chứa liên kết
            String htmlContent = "<html>"
                    + "<body>"
                    + "<p>" + messageContent + "</p>"
                    + "<p>Click the button below to direct:</p>"
                    + "<a href='" + verificationLink + "' style='background-color: #4CAF50; color: white; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; border-radius: 5px;'>Verify Account</a>"
                    + "</body>"
                    + "</html>";

            // Đặt nội dung email là HTML
            message.setContent(htmlContent, "text/html; charset=utf-8");

            // Send message
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            return false;
        }
    }

    public boolean send(String sendT, String topic, String message) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean sendOrderConfirmation(String sendTo, int orderId, String customerName, ArrayList<Product> products, int totalCost, Address address, String note) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", EmailProperty.HOST_NAME);
        props.put("mail.smtp.socketFactory.port", EmailProperty.SSL_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", EmailProperty.SSL_PORT);

        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailProperty.APP_EMAIL, EmailProperty.APP_PASSWORD);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendTo));
            message.setSubject("Order Confirmation - Order #" + orderId, "UTF-8");

            // Xây dựng nội dung HTML của email
            StringBuilder htmlContent = new StringBuilder();
            htmlContent.append("<html><body>");
            htmlContent.append("<h2>Thank you for your order, ").append(customerName).append("!</h2>");
            htmlContent.append("<p>Your order ID is <strong>").append(orderId).append("</strong>.</p>");
            htmlContent.append("<h3>Order Details:</h3>");
            htmlContent.append("<table style='border-collapse: collapse; width: 100%;'>");
            htmlContent.append("<tr>")
                    .append("<th style='border: 1px solid #ddd; padding: 8px;'>Product Name</th>")
                    .append("<th style='border: 1px solid #ddd; padding: 8px;'>Quantity</th>")
                    .append("<th style='border: 1px solid #ddd; padding: 8px;'>Price</th>")
                    .append("</tr>");
            for (Product product : products) {
                htmlContent.append("<tr>")
                        .append("<td style='border: 1px solid #ddd; padding: 8px;'>").append(product.getName()).append("</td>")
                        .append("<td style='border: 1px solid #ddd; padding: 8px;'>").append(product.getStock()).append("</td>")
                        .append("<td style='border: 1px solid #ddd; padding: 8px;'>").append(product.getCapacity().get(0).getUnit_price()).append("</td>")
                        .append("</tr>");
            }
            htmlContent.append("</table>");
            htmlContent.append("<p><strong>Total Cost: </strong>").append(totalCost).append(" VND</p>");

            // Thông tin địa chỉ
            htmlContent.append("<h3>Shipping Address:</h3>");
            htmlContent.append("<p><strong>Recipient Name:</strong> ").append(customerName).append("</p>");
            htmlContent.append("<p><strong>Phone:</strong> ").append(address.getA_phone()).append("</p>");
            htmlContent.append("<p><strong>Address:</strong> ").append(address.getStreet())
                    .append(", ").append(address.getWard())
                    .append(", ").append(address.getDistrict())
                    .append(", ").append(address.getCity()).append("</p>");
            if (address.getDetail() != null && !address.getDetail().isEmpty()) {
                htmlContent.append("<p><strong>Detail:</strong> ").append(address.getDetail()).append("</p>");
            }
            htmlContent.append("<p><strong>Note:</strong> ").append(note).append("</p>");
            htmlContent.append("</body></html>");

            // Gán nội dung HTML vào email
            message.setContent(htmlContent.toString(), "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
