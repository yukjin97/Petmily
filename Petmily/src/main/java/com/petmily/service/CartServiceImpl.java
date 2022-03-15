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

	@Override
	public void updateQuan(int prod_num, String user_id, int quantity) throws Exception {
		Map<String, Object> cartParam = new HashMap<String, Object>();
		cartParam.put("prod_num", prod_num);
		cartParam.put("user_id", user_id);
		cartParam.put("cart_amount", quantity);
		cartDao.updateQuan(cartParam);
	}

	@Override
	public void deleteCart(int prod_num, String user_id) throws Exception {
		Map<String, Object> cartParam = new HashMap<String, Object>();
		cartParam.put("prod_num", prod_num);
		cartParam.put("user_id", user_id);
		cartDao.deleteCart(cartParam);
	}

	@Override
	public void insertCart(int prod_num, int cart_amount, String user_id) throws Exception {
		Map<String, Object> cartParam = new HashMap<String, Object>();
		cartParam.put("prod_num", prod_num);
		cartParam.put("user_id", user_id);

		// cart에 prod_num, user_id를 통해서 cart_amount가 있다면, 그 값 가져오기  없으면 0을 가져온다
		// int plus_amount = cartDao.selectAmount(cartParam);
		// if (plus_amount != 0) {
		// 	cart_amount += plus_amount
		//	cartParam.put("cart_amount", cart_amount);
		//	cartDao.updateQuan(cartParam);
		// }
		cartParam.put("cart_amount", cart_amount);
		cartDao.insertCart(cartParam);
	}

	@Override
	public void updateCart(int prod_num, int cart_amount, String user_id) throws Exception {
		Map<String, Object> cartParam = new HashMap<String, Object>();
		cartParam.put("prod_num", prod_num);
		cartParam.put("user_id", user_id);

		// cart에 prod_num, user_id를 통해서 cart_amount가 있다면, 그 값 가져오기  없으면 0을 가져온다
		// int plus_amount = cartDao.selectAmount(cartParam);
		// if (plus_amount != 0) {
		// 	cart_amount += plus_amount
		//	cartParam.put("cart_amount", cart_amount);
		//	cartDao.updateQuan(cartParam);
		// }
		cartParam.put("cart_amount", cart_amount);
		cartDao.updateQuan(cartParam);
	}

	@Override
	public void deleteCartAll(String user_id) throws Exception {
		cartDao.deleteCartAll(user_id);
	}
}


