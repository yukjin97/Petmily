package com.petmily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.UserDAO;
import com.petmily.dto.User;

@Service
public class MyPageServiceImpl implements MyPageService {
	// DB와 연결 (의존주입)
	@Autowired
	UserDAO userDAO;

	// 나의 정보 조회
	@Override
	public User myPageInfo(String id) throws Exception {
		User user = userDAO.queryUserID(id);
		return user;
	}

	// 나의 정보 수정
	@Override
	   public void updateUser(User user) throws Exception {      
	      User ruser = userDAO.queryUserID(user.getUser_id());      
	      if (user.getUser_pwd().equals(ruser.getUser_pwd())) {   //현재 비밀번호 맞는지 체크
	         userDAO.updateUser(user);    // 업데이트 된 db
	      } else {
	         throw new Exception("수정권한 없음");
	      }
	   }

	}

