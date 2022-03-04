package com.petmily.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Admin;
import com.petmily.dto.Product;

@Mapper
@Repository
public interface AdminDAO {

	public List<Admin> selectMembershipList(@Param(value = "startrow")int startrow,@Param(value = "mem_text")String mem_text) throws Exception;
	int selectMembershipCount(@Param(value = "mem_text")String mem_text) throws Exception;
	
	public int selectProductCount(@Param(value="search_prod")String search_prod)throws Exception;
	public List<Product> selectProductList(@Param(value="startrow")int startrow, @Param(value="search_prod")String search_prod)throws Exception;
	
	public Integer selectMaxProdNum() throws Exception;
	public void insertProduct(Product product) throws Exception;
	
	
	public Product productDetail(int prod_num)throws Exception;

}
