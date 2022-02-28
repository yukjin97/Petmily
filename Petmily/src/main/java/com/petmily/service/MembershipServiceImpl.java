package com.petmily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.MembershipDAO;
import com.petmily.dto.Membership;
import com.petmily.dto.Order;

@Service
public class MembershipServiceImpl implements MembershipService {
	@Autowired
	MembershipDAO membershipDAO;
	
	@Override
	public void memberShip(Membership membership) throws Exception {
		membershipDAO.insertMemberShip(membership);
	}
}
