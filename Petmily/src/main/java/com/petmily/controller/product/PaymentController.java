package com.petmily.controller.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.petmily.dao.ProductDAO;
import com.petmily.dto.Order;
import com.petmily.dto.User;
import com.petmily.service.MyPageService;
import com.petmily.service.OrderService;
import com.petmily.service.ProductService;
import com.petmily.service.UserService;

@Controller
public class PaymentController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	MyPageService myPageService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	UserService userService;
	
	@PostMapping("product/detail/{prod_num}/payment")
	public ModelAndView paymentsingle(@PathVariable int prod_num, @ModelAttribute Order order) {
		ModelAndView mav = new ModelAndView("redirect:/product/detail/"+prod_num);
		try {
			String userId = (String)session.getAttribute("user_id");
			User user = userService.queryUser(userId);
        	orderService.paymentsingle(order, user, prod_num );
		} catch (Exception e) {
			e.printStackTrace();
		}
        return mav;
	}
	
	
}
