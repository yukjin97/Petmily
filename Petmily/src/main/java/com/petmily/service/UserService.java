package com.petmily.service;

import java.util.HashMap;

import com.petmily.dto.User;

public interface UserService {
	boolean userOverlapbyId(String user_id) throws Exception;

	boolean userOverlapbyEmail(String user_email) throws Exception;

	String getAccessToken(String authorize_code) throws Exception;

	HashMap<String, Object> getUserInfo(String access_Token);

	void makeUser(User user) throws Exception;

	User accessUser(String user_id, String user_pwd) throws Exception;
	
	/* boolean login(String user_id, String user_pwd) throws Exception; */
}
