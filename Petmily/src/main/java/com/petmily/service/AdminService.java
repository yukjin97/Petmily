package com.petmily.service;

import java.util.List;

import com.petmily.dto.Admin;
import com.petmily.dto.PageInfo;

public interface AdminService {

	public List<Admin> membershipList(int page, PageInfo pageInfo) throws Exception;

}
	