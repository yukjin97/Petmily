package com.petmily.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.petmily.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminservice;
	
	@GetMapping(value ="admin_membership")
	public void admin_membership () {
		try {
			adminservice.membership();
		} catch (Exception e) {
		}
	}
}
