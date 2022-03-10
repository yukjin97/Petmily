package com.petmily.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Cart;
import com.petmily.dto.Product;

@Mapper

@Repository
public interface CartDAO {

	public List<Cart> selectCartList(Cart cart) throws DataAccessException;

	public List<Product> selectProdList(List<Cart> cartList) throws DataAccessException;

	public boolean selectCountInCart(Cart cart) throws DataAccessException;

	public void insertProdInCart(Cart cart) throws DataAccessException;

	public void updateCartProd(Cart cart) throws DataAccessException;

	public void deleteCartProd(int cart_num) throws DataAccessException;
}
