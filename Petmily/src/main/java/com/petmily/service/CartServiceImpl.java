package com.petmily.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.CartDAO;
import com.petmily.dto.Cart;
import com.petmily.dto.Product;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO cartDao;

	@Override
	public List<Cart> cartQueryById(String user_id) throws Exception {
		List<Cart> cartList = cartDao.cartQueryById(user_id);
		return cartList;
	}

	@Override
	public Product prodQueryByProdNum(int prod_num) throws Exception {
		return cartDao.prodQueryByProdNum(prod_num);
	}
	
}
