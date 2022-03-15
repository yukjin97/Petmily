package com.petmily.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.petmily.dto.User;

@Mapper
@Repository
public interface UserDAO {
	public User queryUser(String user_id) throws Exception;
	public User queryUserByEmail(String user_email) throws Exception;
	public void insertUser(User user)throws Exception;
	public void updateUser(User user)throws Exception;
	public void updateUserAddress(User user)throws Exception;
	public int UserCount()throws Exception;
}
