package com.petmily.service;

import com.petmily.dto.Membership;
import com.petmily.dto.User;

public interface MyPageService {
	User myPageInfo(String user_id)throws Exception;
	void userModify(User user) throws Exception;
	void userAddressModify(User user)throws Exception;
	Membership myMemberShipInfo(String mem_id)throws Exception;
}
