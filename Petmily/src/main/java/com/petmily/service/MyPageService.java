package com.petmily.service;

import java.util.List;

import com.petmily.dto.Membership;
import com.petmily.dto.Order;
import com.petmily.dto.PageInfo;
import com.petmily.dto.User;

public interface MyPageService {
	User myPageInfo(String user_id) throws Exception;
	void userModify(User user) throws Exception;
	void userAddressModify(User user) throws Exception;
	Membership myMemberShipInfo(String mem_id) throws Exception;
	// 주문 내역 조회
	List<Order> orderDetail(String user_id, int page, PageInfo pageInfo) throws Exception;

	
}
