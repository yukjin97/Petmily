package com.petmily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.UserDAO;
import com.petmily.dto.User;

@Service
public class UserServiceImpl implements UserService {
   @Autowired
   UserDAO userDAO;
   
   @Override
      public void join(User user) throws Exception {
         userDAO.insertUser(user);
      }
   
   @Override
   public boolean joinOverlap(String user_id) throws Exception {
      User user = userDAO.queryUserID(user_id);
      if(user == null) {
      return false;
      }
      return true;
   }

   @Override
   public boolean login(String user_id, String user_pwd) throws Exception {
      try {
         User user = userDAO.queryUserID(user_id);
         if(user == null) throw new Exception();
         if(user_pwd.equals(user.getUser_pwd())) {
            return true;
         }else {
            throw new Exception();
         }
      } catch(Exception e) {
         throw new Exception("로그인 오류");
      }   
   }
}