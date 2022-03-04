package com.petmily.service;

import com.petmily.dto.User;

public interface MyPageService {
	User myPageInfo(String user_id)throws Exception;
	void userModify(User user) throws Exception;
}
