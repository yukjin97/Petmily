package com.petmily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("join")
	public String joinPage() {
		return "join";
	}
	
	@GetMapping("login")
	public String loginPage() {
		return "login";
	}
}