package com.petmily.service;

import java.util.List;

import com.petmily.dto.Cart;
import com.petmily.dto.Product;

public interface CartService {

//	void insertProdInCart(Cart cart);
//
//
//	boolean updateCartProd(Cart cart);
//
//	void deleteCart(int cart_amount);
//
//	void addProdInCart(Cart cart);
//
//	boolean findCartProd(Cart cart) throws Exception;
//
//	Map<String, List> myCartList(Cart cart) throws Exception;

	

	
	// 여기가 진짜
	List<Cart> cartQueryById(String user_id) throws Exception;

	Product prodQueryByProdNum(int prod_num) throws Exception;
	
	public void deleteCart(int prod_num, String user_id) throws Exception;

	void updateQuan(int prod_num, String user_id, int quantity) throws Exception;

	void insertCart(int prod_num, int cart_amount, String user_id) throws Exception;
}
