package com.petmily.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.petmily.dto.User;

@Mapper
@Repository
public interface UserDAO {
	public User queryUser(String id) throws Exception;
	public User queryUser(User user) throws Exception;
	public void insertUser(User user)throws Exception;
	public void updateUser(User user)throws Exception;
}
