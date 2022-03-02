package com.petmily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.AdminDAO;
import com.petmily.dto.Admin;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO admindao;

	@Override
	public List<Admin> membership() throws Exception {
		return admindao.membership();
	}

}
