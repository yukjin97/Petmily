package com.petmily.service;

import com.petmily.dto.Order;
import com.petmily.dto.User;

public interface MyPageService {
	User myPageInfo(String user_id) throws Exception;
	void userModify(User user) throws Exception;
	
	//주문 내역 조회
	Order orderDetail(String user_id) throws Exception;
	
}

