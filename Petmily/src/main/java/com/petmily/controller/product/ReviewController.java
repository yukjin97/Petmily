package com.petmily.controller.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

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

	@Autowired
	HttpSession session;

	@GetMapping("product/detail/{prod_num}/reviewrite")
	public ModelAndView reviewForm(@PathVariable int prod_num) {
		ModelAndView mav = new ModelAndView("reviewrite");
		mav.addObject("prod_num", prod_num);
		return mav;
	}

	@PostMapping("/product/detail/{prod_num}/add")
	public ModelAndView detailaddreview(@PathVariable int prod_num, @ModelAttribute Review review) {
		ModelAndView mav = new ModelAndView("redirect:/product/detail/" + prod_num);
		try {
			mav.addObject("prod_num", prod_num);
			reviewService.insertReview(review);
		} catch (Exception e) {
			mav.setViewName("login");
			e.printStackTrace();
		}
		return mav;
	}

	@PostMapping("/product/detail/{prod_num}/delete/{review_num}")
	public ModelAndView deletereview(@PathVariable int prod_num, @PathVariable int review_num,
			@ModelAttribute Review review) {
		ModelAndView mav = new ModelAndView("redirect:/product/detail/" + prod_num);
		try {
			mav.addObject("review_num", review_num);
			mav.addObject("prod_num", prod_num);
			reviewService.deleteReview(review);
		} catch (Exception e) {
			mav.setViewName("login");
			e.printStackTrace();
		}
		return mav;
	}

	@GetMapping("product/detail/{prod_num}/update/{review_num}")
	public ModelAndView updatereviewForm(@PathVariable int prod_num, @PathVariable int review_num,
			@ModelAttribute Review review) {
		ModelAndView mav = new ModelAndView("updatereview");
		try {
			review = reviewService.selectReviewByNum(review_num);
			mav.addObject(review);
		} catch (Exception e) {
			mav.setViewName("login");
			e.printStackTrace();
		}
		return mav;
	}

	@PostMapping("product/detail/{prod_num}/update/{review_num}")
	public ModelAndView updatereview(@PathVariable int prod_num, @PathVariable int review_num,
			@ModelAttribute Review review) {
		ModelAndView mav = new ModelAndView("redirect:/product/detail/" + prod_num);
		try {
			reviewService.updateReview(review);
		} catch (Exception e) {
			mav.setViewName("login");
			e.printStackTrace();
			System.out.println("수정");
		}
		return mav;
	}

//	@GetMapping("product/datail/{prod_num}/")
//	public ModelAndView detailreviewlist(@RequestParam (value = "page",required = false ,defaultValue = "1") int page , @PathVariable int prod_num) {
//		System.out.println(prod_num);
//		ModelAndView mav = new ModelAndView("detailproduct");
//		PageInfo pageInfo = new PageInfo();
//		try {
//			List<Review> reviewList = reviewService.getreviewList(page,pageInfo);
//			mav.addObject("reviewlist",reviewList);
//			mav.addObject("pageinfo" , pageInfo);
//			mav.setViewName("detailproduct");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return mav;
//	}

}
