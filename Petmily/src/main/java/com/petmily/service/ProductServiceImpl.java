package com.petmily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.ProductDAO;
import com.petmily.dto.PageInfo;
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


	@Override
	public List<Product> getProductList(int page, PageInfo pageInfo) throws Exception {
		int listCount = productDAO.selectProductCount();
		// table 에 있는 모든 row의 수
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		
		int startPage=(((int) ((double)page/10+0.9))-1)*10+1;
		
		int endPage=startPage+10-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		
		int startrow=(page-1)*10+1;
		
		
		return productDAO.selectProductList(startrow);
	}
	
	
}