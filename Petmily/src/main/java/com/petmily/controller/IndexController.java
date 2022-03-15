package com.petmily.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petmily.dto.Product;
import com.petmily.service.MembershipService;
import com.petmily.service.ProductService;
import com.petmily.service.UserService;

@Controller
public class IndexController {

	@Autowired
	ProductService productService;
	
	@Autowired
	MembershipService MembershipService;
	
	@Autowired
	UserService UserService;


//	@GetMapping("/")
//	public String index() {
//		return "index";
//	}
	@GetMapping("/")
	public ModelAndView index(@ModelAttribute Product prod) {
		ModelAndView mav = new ModelAndView("index");
		try {
			int mem_count = MembershipService.membershipCount();
			int prod_count = productService.productCount();
			int user_count = UserService.UserCount();
			List<Product> rprod = productService.getBestViewList(prod.getProd_view_cnt());
			mav.addObject("rprod", rprod);
			mav.addObject("mem_count", mem_count);
			mav.addObject("prod_count", prod_count);
			mav.addObject("user_count", user_count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
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