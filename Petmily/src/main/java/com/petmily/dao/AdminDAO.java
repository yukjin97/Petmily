package com.petmily.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Admin;

@Mapper
@Repository
public interface AdminDAO {

	public List<Admin> selectMembershipList(@Param(value = "startrow")int startrow,@Param(value = "mem_text")String mem_text) throws Exception;
	int selectMembershipCount(@Param(value = "mem_text")String mem_text) throws Exception;

}
