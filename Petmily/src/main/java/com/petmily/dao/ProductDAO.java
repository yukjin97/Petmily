package com.petmily.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Product;

@Mapper
@Repository
public interface ProductDAO {

	public List<Product> allProduct() throws Exception;
	public Product selectProduct(int prod_num) throws Exception;
	public int selectPrice(int prod_num) throws Exception;
	List<Product> selectProductList(int startrow) throws Exception;
	
	int selectProductCount() throws Exception;
	// 화면 하단에 뿌려줄 페이지 번호를 구성하기 위한 저장된 글의 총 row를 개수 정보로 반환
	
	List<Product>selectProductViewCnt(int prod_view_cnt)throws Exception;
	// 조회수 높은거 3개 가져옴
	
	public void selectProductViewCntInc(int prod_num)throws Exception;
	
	public List<Product> categorylist(Map<String, Object> mapParam) throws Exception;
	
	public List<Product> productOrberbycreate(int startrow) throws Exception;
	
	public List<Product> productOrberbyview(int startrow) throws Exception;
	
	
	public List<Product> productOrberbylowprice(int startrow)throws Exception;
	
	public List<Product> productOrberbyhighprice(int startrow)throws Exception;
	
	public int selectProductCountByCate(String prod_category) throws Exception;
}
