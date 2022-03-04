package com.petmily.service;

import java.util.ArrayList;

import com.petmily.dto.User;

public interface MyPageService {
	User myPageInfo(String user_id) throws Exception;
	 void updateUser(User user) throws Exception;
	
		/*
		 * public ArrayList<Order> orderList(String user_id) throws Exception{ return
		 * orderMapper.orderList(user_id); }
		 */
}
