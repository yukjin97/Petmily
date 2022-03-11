package com.petmily.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.MembershipDAO;
import com.petmily.dto.Membership;
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
	
	
	@Override
	public List<Membership> membershipList(String user_id) throws Exception {
		return membershipDAO.membershipList(user_id);
	}
	
	@Override
	public Membership getMembershipByidSilver(String user_id) throws Exception {
		return membershipDAO.getMembershipByidSilver(user_id);
	}

	@Override
	public Membership getMembershipByidGold(String user_id) throws Exception {
		return membershipDAO.getMembershipByidGold(user_id);
	}
	
	@Override
	public void updateDateSilver(String user_id) throws Exception {
		Membership membership = getMembershipByidSilver(user_id);
		if(membership != null) {
			Date today = new Date(System.currentTimeMillis());
			Date next_date = membership.getMem_next_date();
			if(today.before(next_date)) {
				System.out.println("아직 결제일이 도래하지 않았다");
			} else {
				System.out.println("결제일이 지났다");
				membershipDAO.updateMembershipSilver(user_id);
			}
		}
	}
	@Override
	public void updateDateGold(String user_id) throws Exception {
		Membership membership = getMembershipByidGold(user_id);
		if(membership != null) {
			Date today = new Date(System.currentTimeMillis());
			Date next_date = membership.getMem_next_date();
			if(today.before(next_date)) {
				System.out.println("아직 결제일이 도래하지 않았다");
			} else {
				System.out.println("결제일이 지났다");
				membershipDAO.updateMembershipGold(user_id);
			}
			
		}
	}
}
