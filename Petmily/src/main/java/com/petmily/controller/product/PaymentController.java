package com.petmily.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.petmily.dao.ProductDAO;
import com.petmily.service.ProductService;

@Controller
public class PaymentController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductDAO productDAO;
	
	@GetMapping("payment")
	public String paymentsAPI() {
		return "payment";
	}
	

	
}
