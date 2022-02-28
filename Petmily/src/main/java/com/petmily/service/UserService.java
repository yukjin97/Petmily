package com.petmily.service;

import com.petmily.dto.User;

public interface UserService {
	User join(User user) throws Exception;
	User login(String id, String password) throws Exception;
	boolean joinOverlap(String id) throws Exception;	
}
