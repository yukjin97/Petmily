package com.petmily.service;

import com.petmily.dto.Mail;
import com.petmily.dto.User;

public interface MailService {
	void joinMailSend(Mail mail, User user);
}
