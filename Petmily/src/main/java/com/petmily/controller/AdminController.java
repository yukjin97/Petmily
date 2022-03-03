package com.petmily.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petmily.dto.Admin;
import com.petmily.dto.PageInfo;
import com.petmily.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminservice;
	
	@GetMapping(value ="admin_membership")
	public String admin_membership (@RequestParam(value="page", required=false, defaultValue="1")int page, Model model,
			@RequestParam(value = "mem_text",defaultValue="") String mem_text) {
		PageInfo pageInfo = new PageInfo();
		try {
			List<Admin> admin = adminservice.membershipList(page,pageInfo,mem_text);
			model.addAttribute("mem_text", mem_text);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("admin", admin);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin_membership";
	}
		
}
