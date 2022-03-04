package com.petmily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("singup")
	public String signup() {
		return "signup";
	}
	
	@GetMapping("singin")
	public String signin() {
		return "signup";
	}
}
