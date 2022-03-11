package com.petmily.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petmily.dto.Product;
import com.petmily.service.ProductService;

@Controller
public class IndexController {

	@Autowired
	ProductService productService;

//	@GetMapping("/")
//	public String index() {
//		return "index";
//	}
	@GetMapping("/")
	public ModelAndView index(@ModelAttribute Product prod) {
		ModelAndView mav = new ModelAndView("index");
		try {
			List<Product> rprod = productService.getBestViewList(prod.getProd_view_cnt());
			mav.addObject("rprod", rprod);
			System.out.println("check1");
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