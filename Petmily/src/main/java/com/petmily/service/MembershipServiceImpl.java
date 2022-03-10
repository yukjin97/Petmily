package com.petmily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.MembershipDAO;
import com.petmily.dto.Membership;
import com.petmily.dto.Order;
import com.petmily.dto.User;

@Service
public class MembershipServiceImpl implements MembershipService {
	@Autowired
	MembershipDAO membershipDAO;
	
	@Override
	public void memberShip(Membership membership) throws Exception {
		membershipDAO.insertMemberShip(membership);
	}

	@Override
	public User payinfo(String user_id) throws Exception {
		return membershipDAO.payinfo(user_id);
	}

	@Override
	public boolean silverOverlap(String user_id) throws Exception {
		Membership mem = membershipDAO.querySilverMemberShip(user_id);
		if(mem != null) return true;
		return false;
	}

	@Override
	public boolean goldOverlap(String user_id) throws Exception {
		Membership mem = membershipDAO.queryGoldMemberShip(user_id);
		if(mem != null) return true;
		return false;
	}
}
