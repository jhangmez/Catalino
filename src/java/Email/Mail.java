/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Email;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Airth
 */
public class Mail {

    public boolean enviarCorreo(String host, String port,
            final String de, final String clave, String[] para,
            String asunto, String mensaje)
            throws AddressException, MessagingException {

        boolean enviado = false;

        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.user", de);
        properties.put("mail.password", clave);

        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(de, clave);
            }
        };

        Session session = Session.getInstance(properties, auth);
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(de));

        InternetAddress[] direcciones = new InternetAddress[para.length];
        for (int i = 0; i < para.length; i++) {
            direcciones[i] = new InternetAddress(para[i]);
        }

        for (int i = 0; i < direcciones.length; i++) {
            msg.addRecipient(Message.RecipientType.TO, direcciones[i]);
        }

        msg.setRecipients(Message.RecipientType.TO, direcciones);
        msg.setSubject(asunto);
        msg.setSentDate(new Date());

        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(mensaje, "text/html");

//        // creates multi-part
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
//
//        // adds attachments
//        if (Files != null && Files.length > 0) {
//            for (String filePath : Files) {
//                MimeBodyPart attachPart = new MimeBodyPart();
//
//                try {
//                    attachPart.attachFile(filePath);
//                } catch (IOException ex) {
//                    ex.printStackTrace();
//                }
//
//                multipart.addBodyPart(attachPart);
//            }
//        }
//
//        // sets the multi-part as e-mail's content
        msg.setContent(multipart);

        // sends the e-mail
        Transport.send(msg);
        return true;

    }
}
