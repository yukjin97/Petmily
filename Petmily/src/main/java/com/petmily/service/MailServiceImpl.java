package com.petmily.service;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.petmily.dao.UserDAO;
import com.petmily.dto.Mail;
import com.petmily.dto.User;
import com.petmily.handler.MailHandler;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	JavaMailSender javaMailSender;
	
	@Autowired
	UserDAO userDAO;

	
	@Override
	public void joinMailSend(Mail mail, User user) {
		mail.setTitle(user.getUser_id()+"님 펫밀리 회원이 되신것을 환영합니다.");
		mail.setAddress(user.getUser_email());
		try {
			MailHandler mailHandler = new MailHandler(javaMailSender);
			mailHandler.setTo(mail.getAddress());
			mailHandler.setFrom("oxwk123@naver.com");
			mailHandler.setSubject(mail.getTitle());
			String htmlContent = "<h1>Petmily 회원이 되신것을 환영합니다.</h1>"
					+ "<br>"
					+ "<h2>Petmily만의 상품을 확인해보세요</h2>"
					+ "<img src='cid:welcome-img'>";
            mailHandler.setText(htmlContent, true);
			mailHandler.setInline("welcome-img", "static/mail/welcome.jpg");
			mailHandler.setAttach("펫밀리 구독.pdf", "static/mail/펫밀리 구독.pdf");
			mailHandler.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
