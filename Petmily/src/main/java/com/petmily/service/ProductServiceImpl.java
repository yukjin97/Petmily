package com.petmily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.ProductDAO;
import com.petmily.dto.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDAO productDAO;
	
	@Override
	public List<Product> listProduct(Product product) {
		return null;
	}
	
	
	@Override
	public List<Product> getPorductListByKind(Product product) {
		return null;
	}
	
	
	@Override
	public List<Product> allProduct() throws Exception  {
		return productDAO.allProduct();
	}
	
	
	@Override
	public Product selectProduct(int prod_num) throws Exception {
		return productDAO.selectProduct(prod_num);
	}
	
	
}