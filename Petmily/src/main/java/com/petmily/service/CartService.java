package com.petmily.service;

import java.util.List;
import java.util.Map;

import com.petmily.dto.Cart;

public interface CartService {

	void insertProdInCart(Cart cart);

	List<Cart> selectCountInCart(String user_id, int Prod_num);

	boolean updateCartProd(Cart cart);

	void deleteCart(int cart_amount);

	void addProdInCart(Cart cart);

	boolean findCartProd(Cart cart) throws Exception;

	Map<String, List> myCartList(Cart cart) throws Exception;
}
