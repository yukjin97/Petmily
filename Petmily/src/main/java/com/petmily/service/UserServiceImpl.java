package com.petmily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.UserDAO;
import com.petmily.dto.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO userDAO;
	
	@Override
	public User join(User user) throws Exception {
		User user_id = userDAO.queryUser(user.getUser_id());
		if(user_id != null)
			throw new Exception("이미 존재하는 아이디 입니다.");
		User user_nickname = userDAO.queryUser(user.getUser_nickname());
		if(user_nickname != null)
			throw new Exception("이미 존재하는 닉네임 입니다.");
		User user_email = userDAO.queryUser(user.getUser_email());
		if(user_email != null)
			throw new Exception("이미 가입된 이메일 입니다.");
		userDAO.insertUser(user);
		return userDAO.queryUser(user.getUser_id());
	}

	@Override
	public User login(String user_id, String user_password) throws Exception {
		User user = userDAO.queryUser(new User(user_id,user_password));
		if(user == null) throw new Exception("아이디 또는 비밀번호를 입력하세요");
		return user;
	}

	@Override
	public boolean joinOverlap(String user_id) throws Exception {
		User user = userDAO.queryUser(user_id);
		if(user == null) {
		return false;
		}
		return true;
	}

}
