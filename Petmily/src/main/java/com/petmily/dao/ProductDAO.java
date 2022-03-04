package com.petmily.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Product;

@Mapper
@Repository
public interface ProductDAO {

	public List<Product> allProduct() throws Exception;
	public Product selectProduct(int prod_num) throws Exception;

}
