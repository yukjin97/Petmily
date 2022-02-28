package com.petmily.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petmily.dao.ProductDAO;
import com.petmily.dto.Product;
import com.petmily.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	private static Log log = LogFactory.getLog(ProductController.class);
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductDAO productDAO;

// 	전체상품조회 
	@GetMapping("/")
	public String productmain(@RequestParam(value = "key",defaultValue = "") Product product, Model model) {
		List<Product> listProduct = productService.listProduct(product);
		for(Product vo: listProduct) {
			System.out.println(vo);
		}
		model.addAttribute("productList",listProduct);
		log.info(listProduct);
		return "product_all";
	}
//	카테고리별 상품 조회
	@GetMapping("/category")
	public String productKindAction(Product product,Model model , HttpServletRequest req) {
		List<Product> categoryProduct = productService.getPorductListByKind(product);
		log.info(product.getProd_category());
		for(Product product2: categoryProduct) {
			log.info(product2);
		}
		req.setAttribute("productKindList", categoryProduct);	
		return "product_all";
	}
}
