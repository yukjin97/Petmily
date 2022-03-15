package com.petmily.service;

import java.util.List;
import java.util.Map;

import com.petmily.dto.Membership;
import com.petmily.dto.User;

public interface MembershipService {
	void memberShip(Membership membership) throws Exception;

	User payinfo(String user_id)throws Exception;

	boolean silverOverlap(String user_id) throws Exception;

	boolean goldOverlap(String user_id) throws Exception;
	Membership getMembershipByidSilver(String user_id) throws Exception;
	
	Membership getMembershipByidGold(String user_id) throws Exception;
	
	void updateDateSilver(String user_id) throws Exception;
	
	void updateDateGold(String user_id) throws Exception;
	
	List<Membership> membershipList(String user_id)throws Exception;
	
	public void delete_mem(Map<String, Object> map) throws Exception;

	int membershipCount()throws Exception;
}
