package com.petmily.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Cart;
import com.petmily.dto.Product;

@Mapper

@Repository
public interface CartDAO {

	List<Cart> cartQueryById(String user_id) throws Exception;

	Product prodQueryByProdNum(int prod_num) throws Exception;
	
	public void deleteCart(Map<String, Object> cartParam)throws Exception;

	void updateQuan(Map<String, Object> cartParam) throws Exception;

	void insertCart(Map<String, Object> cartParam) throws Exception;
		
	
	

//	public List<Cart> selectCartList(Cart cart) throws DataAccessException;
//
//	public List<Product> selectProdList(List<Cart> cartList) throws DataAccessException;
//
//	public boolean selectCountInCart(Cart cart) throws DataAccessException;
//
//	public void insertProdInCart(Cart cart) throws DataAccessException;
//
//	public void updateCartProd(Cart cart) throws DataAccessException;
//
//	public void deleteCartProd(int cart_num) throws DataAccessException;
	
	
}
