package com.petmily.service;

import com.petmily.dto.Membership;
import com.petmily.dto.User;

public interface MembershipService {
	void memberShip(Membership membership) throws Exception;

	User payinfo(String user_id)throws Exception;
}
