package com.petmily.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.petmily.dto.admintest;
import com.petmily.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminservice;
	
	@GetMapping(value ="admin_membership")
	public String admin_membership (Model model) {
		try {
			List<admintest> admin = adminservice.membership();
			model.addAttribute("admin", admin);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin_membership";
	}
		
}
