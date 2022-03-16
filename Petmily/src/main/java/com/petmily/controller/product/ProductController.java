package com.petmily.controller.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.petmily.dao.ProductDAO;
import com.petmily.dto.PageInfo;
import com.petmily.dto.Product;
import com.petmily.dto.Review;
import com.petmily.dto.User;
import com.petmily.service.AdminService;
import com.petmily.service.MyPageService;
import com.petmily.service.ProductService;
import com.petmily.service.ReviewService;
import com.petmily.service.UserService;

@Controller
public class ProductController {
	private static Log log = LogFactory.getLog(ProductController.class);
	
	@Autowired
	HttpSession session;
	
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	AdminService adminService;

	@Autowired
	UserService userService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	MyPageService myPageService;
	
	


	// 페이징 처리 All Product
	@RequestMapping(value = "/product",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView productlist(
			@RequestParam (value = "page",required = false ,defaultValue = "1") int page,
			@RequestParam (value = "prod_category", required = false, defaultValue = "") String prod_category
			)  {
		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		System.out.println(prod_category);
		try {
			List<Product> articleList = new ArrayList<>();
			if (prod_category.equals("")) {
				articleList =productService.getProductList(page, pageInfo);
				mav.addObject("articleList",articleList);
				mav.addObject("pageInfo",pageInfo);
				mav.setViewName("productall");
			} else {
				articleList =productService.categorylist(page, pageInfo,prod_category);
				mav.addObject("prod_category",prod_category);
				mav.addObject("articleList",articleList);
				mav.addObject("pageInfo",pageInfo);
				mav.setViewName("productall");
			}
			System.out.println("조회한 제품 수" + pageInfo.getListCount());
			System.out.println("화면에 출력되는 제품 수" + articleList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}	
 	
	// 상품 상세보
	@RequestMapping("/product/detail/{prod_num}")
	public ModelAndView detailPage(@RequestParam (value = "page",required = false ,defaultValue = "1") int page , @PathVariable int prod_num) {
		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
        String user_id = (String) session.getAttribute("user_id");
        try {
        	User user = myPageService.myPageInfo(user_id);
			Product product = productService.selectProduct(prod_num);
			productService.selectProductViewCntInc(prod_num); 
            user = myPageService.myPageInfo(user_id);
			mav.addObject("product",product);	
			List<Review> reviewList = reviewService.getreviewList(prod_num, page, pageInfo);
			mav.addObject("reviewlist",reviewList);
			mav.addObject("pageInfo" , pageInfo);
            mav.addObject("user", user);
			mav.setViewName("detailproduct");
			log.info(product);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return mav;
	}
	
	
	@RequestMapping(value = "/product/pop",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView productmostviewlist(@RequestParam (value = "page",required = false ,defaultValue = "1") int page )  {
		ModelAndView mav = new ModelAndView("redirect:/product/");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Product> articleList = productService.productOrberbyview(page, pageInfo);
			mav.addObject("articleList",articleList);
			mav.addObject("pageInfo",pageInfo);
			mav.setViewName("productall");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value = "/product/lowprice",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView productlowprice(@RequestParam (value = "page",required = false ,defaultValue = "1") int page )  {
		ModelAndView mav = new ModelAndView("redirect:/product/");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Product> articleList = productService.productOrberbylowprice(page, pageInfo);
			mav.addObject("articleList",articleList);
			mav.addObject("pageInfo",pageInfo);
			mav.setViewName("productall");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}	
	
	@RequestMapping(value = "/product/highpirce",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView producthighprice(@RequestParam (value = "page",required = false ,defaultValue = "1") int page )  {
		ModelAndView mav = new ModelAndView("redirect:/product/");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Product> articleList = productService.productOrberbyhighprice(page, pageInfo);
			mav.addObject("articleList",articleList);
			mav.addObject("pageInfo",pageInfo);
			mav.setViewName("productall");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

}
