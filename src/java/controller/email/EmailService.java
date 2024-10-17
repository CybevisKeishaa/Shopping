package controller.email;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class EmailService implements IJavaMail {

    /**
     *
     * @param sendTo
     * @param topic
     * @param messageContent
     * @return
     */
    @Override
    public boolean send(String sendTo, String topic, String messageContent) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", EmailProperty.HOST_NAME);
        props.put("mail.smtp.socketFactory.port", EmailProperty.SSL_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", EmailProperty.SSL_PORT);

        Session session = Session.getDefaultInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailProperty.APP_EMAIL, EmailProperty.APP_PASSWORD);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendTo));
            message.setSubject(topic, "UTF-8");

            String htmlContent = "<html>"
                    + "<body>"
                    + "<p>Nhấp vào nút dưới đây để đặt lại mật khẩu:</p>"
                    + "<a href=\"" + messageContent + "\" style=\"display:inline-block; padding:10px 20px; font-size:16px; color:white; background-color:#007BFF; text-decoration:none; border-radius:5px;\">Đặt lại mật khẩu</a>"
                    + "</body>"
                    + "</html>";

            message.setContent(htmlContent, "text/html; charset=UTF-8");
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}
