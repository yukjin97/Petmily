package com.petmily.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Membership;
import com.petmily.dto.User;

@Mapper
@Repository
public interface MembershipDAO {
	void insertMemberShip(Membership membership) throws Exception;
	
	public Membership queryUserMemberShip(String user_id) throws Exception;
	
	User payinfo(String user_id) throws Exception;
	
	public Membership querySilverMemberShip(String user_id) throws Exception;

	public Membership queryGoldMemberShip(String user_id) throws Exception;
}
