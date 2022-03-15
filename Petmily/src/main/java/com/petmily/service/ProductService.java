package com.petmily.service;
import java.util.List;

import com.petmily.dto.PageInfo;
import com.petmily.dto.Product;



public interface ProductService {
	public List<Product> listProduct(Product product);

	public List<Product> getPorductListByKind(Product product);

	public List<Product> allProduct() throws Exception;

	public Product selectProduct(int prod_num) throws Exception;

	public int selectPrice(int prod_num) throws Exception;
	
	public List<Product> getProductList(int page, PageInfo pageInfo) throws Exception;
	
	public List<Product> getBestViewList(int prod_view_cnt)throws Exception;
	
	public void selectProductViewCntInc(int prod_num)throws Exception;

	public int productCount() throws Exception;
}
