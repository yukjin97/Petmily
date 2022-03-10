package com.petmily.controller.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.petmily.dto.PageInfo;
import com.petmily.dto.Product;
import com.petmily.dto.Review;
import com.petmily.service.ProductService;
import com.petmily.service.ReviewService;
import com.petmily.service.UserService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	
	@GetMapping(value = "{prod_num}/reviewlist")
	public String product_review(@RequestParam(value = "page",required = false,defaultValue = "1")int page, Model model,
			@RequestParam(value = "search_review",defaultValue = "") String search_review) {
		PageInfo pageInfo = new PageInfo();
		try {
			List<Review> product_review =  reviewService.reviewList(page, pageInfo, search_review);
			model.addAttribute("product_review" , product_review);
			model.addAttribute("pageInfo",pageInfo);
			model.addAttribute("product_review",search_review);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "detailproduct";
	}
	
	
	@PostMapping("/")
	public String addReiview(@ModelAttribute Review review) {
		try {
			reviewService.reviewrite(review);
			return "redirect:/{prod_num}";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "{prod_num}";
	}
	
}
