package com.petmily.service;

import java.util.List;
import java.util.Map;

import com.petmily.dto.Admin;
import com.petmily.dto.PageInfo;
import com.petmily.dto.Product;
import com.petmily.dto.User;

public interface AdminService {

	public List<Admin> membershipList(int page, PageInfo pageInfo,String mem_text) throws Exception;

	public List<Product> productList(int page, PageInfo pageInfo, String search_prod)throws Exception;

	public void productwrite(Product product) throws Exception;

	public Product productDetail(int prod_num) throws Exception;

	public void modifyproduct(Product product) throws Exception;

	public void productDelete(int prod_num)throws Exception;

	public List<Product> inventoryList(int page, PageInfo pageInfo, String search_inven) throws Exception;

	public void addAmount(Product product)throws Exception;

	public List<Admin> orderList(int page, PageInfo pageInfo, String search_text)throws Exception;
	
	public void updateOrderStatus(Map<String, Object> map) throws Exception;
	
	public List<Admin> shipList(int page, PageInfo pageInfo, String search_text)throws Exception;

	public void updateMemStatus(Map<String, Object> map)throws Exception;

	public List<Admin> memshipList(int page, PageInfo pageInfo, String search_text)throws Exception;

	public List<User> alluserList(int page, PageInfo pageInfo, String mem_text)throws Exception;

}
	