package com.petmily.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petmily.dto.Product;
import com.petmily.dto.Review;
import com.petmily.service.ProductService;
import com.petmily.service.ReviewService;

@Controller
public class IndexController {

	@Autowired
	ProductService productService;
	
	@Autowired
	ReviewService reviewService;

	
	@GetMapping("/")
	public ModelAndView index(@ModelAttribute Product prod ,@ModelAttribute Review review) {
		ModelAndView mav = new ModelAndView("index");
		try {
			List<Product> rprod = productService.getBestViewList(prod.getProd_view_cnt());
			Review review2 = reviewService.getAllReviewList(review.getProd_num());
			mav.addObject("review",review2);
			mav.addObject("rprod", rprod);
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