package util;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.tomcat.dbcp.dbcp2.ConnectionFactory;

import com.ibatis.common.resources.Resources;

public class EmailUtil {
	private static String user;
	private static String password;
	static {
		String resource = "config/emailinfo.properties";
		Properties properties = new Properties();
		try{
			Reader reader = Resources.getResourceAsReader(resource);
			properties.load(reader);
			user = properties.getProperty("user");
			password = properties.getProperty("password");
		} catch ( IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void sendEmail(String recipient, String title, String content) {
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			message.setSubject(title);
			message.setText(content);
			Transport.send(message);	// send message
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
