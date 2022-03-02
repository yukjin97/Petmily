package com.petmily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO admindao;

	@Override
	public void membership() throws Exception {
		admindao.membership();
	}

}
