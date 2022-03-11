package com.petmily.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.petmily.dao.ProductDAO;
import com.petmily.dto.PageInfo;
import com.petmily.dto.Product;
import com.petmily.service.AdminService;
import com.petmily.service.ProductService;

@Controller
public class ProductController {
	private static Log log = LogFactory.getLog(ProductController.class);
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	AdminService adminService;
	
//	@GetMapping("/productall")
//	public ModelAndView productAllPage() {
//		ModelAndView mav = new ModelAndView("productall");
//		try {
//			List<Product> product=productService.allProduct();
//			mav.addObject("product",product);
//			log.info(product);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return mav;
//	}

	
	@RequestMapping(value = "productall",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView productlist(@RequestParam (value = "page",required = false ,defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Product> articleList = productService.getProductList(page, pageInfo);
			mav.addObject("articleList",articleList);
			mav.addObject("pageInfo",pageInfo);
			mav.setViewName("productall");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	

	
 	
//	@GetMapping("/detail/{prod_num}")
//	public ResponseEntity<?> productDeatilPage(@PathVariable("prod_num") int prod_num) throws Exception {
//		Product product = null;
//		try {
//			product =  productService.selectProduct(prod_num);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return new ResponseEntity<Product>(product,HttpStatus.OK);
//	}




	@RequestMapping("/product/detail/{prod_num}")
	public ModelAndView detailPage(@PathVariable int prod_num) {
		ModelAndView mav = new ModelAndView("productall");
		try {
			Product product = productService.selectProduct(prod_num);
			mav.addObject("product",product);
			mav.setViewName("detailproduct");
			log.info(product);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return mav;
	}

}
