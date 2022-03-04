package com.petmily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.UserDAO;
import com.petmily.dto.User;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	UserDAO userDAO;

	@Override
	public User myPageInfo(String user_id) throws Exception {
		User user = userDAO.queryUser(user_id);
		return user;
	}

	@Override
	public void userModify(User user) throws Exception {		
		User ruser = userDAO.queryUser(user.getUser_id());		
		if (user.getUser_pwd().equals(ruser.getUser_pwd())) { //현재 비밀번호 맞는지 체크
			userDAO.updateUser(user);// 업데이트 된 db
		} else {
			throw new Exception("수정권한 없음");
		}
	}
}
