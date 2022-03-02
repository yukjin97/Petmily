package com.petmily.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Admin;

@Mapper
@Repository
public interface AdminDAO {

	public List<Admin> selectMembershipList(int startrow) throws Exception;
	int selectMembershipCount() throws Exception;

}
