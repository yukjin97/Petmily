package com.petmily.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petmily.dto.Admin;
import com.petmily.dto.PageInfo;
import com.petmily.dto.Product;
import com.petmily.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminservice;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping(value ="admin_membership")
	public String admin_membership (@RequestParam(value="page", required=false, defaultValue="1")int page, Model model,
			@RequestParam(value = "mem_text",defaultValue="") String mem_text) {
		PageInfo pageInfo = new PageInfo();
		try {
			List<Admin> admin = adminservice.membershipList(page,pageInfo,mem_text);
			model.addAttribute("mem_text", mem_text);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("admin", admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin_membership";
	}
	
	@GetMapping(value ="admin_product")
	public String admin_product (@RequestParam(value="page", required=false, defaultValue="1")int page, Model model,
			@RequestParam(value = "search_prod",defaultValue="") String search_prod) {
		PageInfo pageInfo = new PageInfo();
		try {
			List<Product> admin_product = adminservice.productList(page,pageInfo,search_prod);
			model.addAttribute("admin_product", search_prod);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("admin_product", admin_product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin_product";
	}
	
	@GetMapping(value = "admin_product_write")
	public String admin_product_write() {
		return "admin_product_write";
	}

	@PostMapping(value="admin_product_write")
	public String product_write(@ModelAttribute Product product) {
		try {
			if(product.getFile().isEmpty()) {
				System.out.println("이미지를 등록해 주세요");
			}else {
				String path = servletContext.getRealPath("/upload/");
				File destFile = new File(path+product.getFile().getOriginalFilename());
				product.setProd_img(product.getFile().getOriginalFilename());
				product.getFile().transferTo(destFile);
				adminservice.productwrite(product);
				return "redirect:/admin_product";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin_product_write";
	}
	
	@GetMapping(value = "admin_product_modify")
	public String admin_product_modify(Model model,@RequestParam(value="prod_num", required=false)int prod_num) {
		System.out.println(prod_num);
		try {
			Product modi=adminservice.productDetail(prod_num);
			model.addAttribute("modi",modi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin_product_modify";
	}
}
