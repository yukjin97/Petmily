package com.petmily.service;

import com.petmily.dto.User;

public interface UserService {
   void join(User user) throws Exception;
   boolean login(String user_id, String user_pwd) throws Exception;
   boolean joinOverlap(String id) throws Exception;
}