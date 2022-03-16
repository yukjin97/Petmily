package com.petmily.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.AdminDAO;
import com.petmily.dao.ProductDAO;
import com.petmily.dto.PageInfo;
import com.petmily.dto.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	AdminDAO admindao;
	

	
	
	@Override
	public List<Product> allProduct() throws Exception  {
		return productDAO.allProduct();
	}
	
	
	@Override
	public Product selectProduct(int prod_num) throws Exception {
		return productDAO.selectProduct(prod_num);
	}


	@Override
	public int selectPrice(int prod_num) throws Exception {
		return productDAO.selectPrice(prod_num);
	}
	
	@Override
	public List<Product> getProductList(int page, PageInfo pageInfo) throws Exception {
		int listCount = productDAO.selectProductCount();
		// table 에 있는 모든 row의 수
		
		int maxPage=(int)Math.ceil((double)listCount/7);
		
		int startPage=(((int) ((double)page/7+0.9))-1)*7+1;
		
		int endPage=startPage+7-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		
		int startrow=(page-1)*7+1;
		
		
		return productDAO.selectProductList(startrow);
	}


	@Override
	public List<Product> getBestViewList(int prod_view_cnt) throws Exception {
		return productDAO.selectProductViewCnt(prod_view_cnt);
	}


	@Override
	public void selectProductViewCntInc(int prod_num) throws Exception {
		productDAO.selectProductViewCntInc(prod_num);;
		
	}


	@Override
	public int productCount() throws Exception {
		
		return admindao.ProductCount();
	}


	@Override
	public List<Product> categorylist(int page, PageInfo pageInfo ,String prod_category )  throws Exception {
		int listCount = productDAO.selectProductCountByCate(prod_category);
		// table 에 있는 모든 row의 수
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		
		int startPage=(((int) ((double)page/7+0.9))-1)*7+1;
		
		int endPage=startPage+7-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		
		int startrow=(page-1)*7;
		
		System.out.println("마지막 페이지: "+pageInfo.getEndPage());
		System.out.println("제품 수 : "+pageInfo.getListCount());
		System.out.println("최대페이지: "+pageInfo.getMaxPage());
		System.out.println("현재 페이지: "+pageInfo.getPage());
		System.out.println("시작페이지: "+pageInfo.getStartPage());
		System.out.println("스타트로우 : "+startrow);
		
		
		
		
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("prod_category", prod_category);
		mapParam.put("startrow", startrow);
		return productDAO.categorylist(mapParam);
	}


	@Override
	public List<Product> productOrberbycreate(int page, PageInfo pageInfo) throws Exception {
		int listCount = productDAO.selectProductCount();
		// table 에 있는 모든 row의 수
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		
		int startPage=(((int) ((double)page/7+0.9))-1)*7+1;
		
		int endPage=startPage+7-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		
		int startrow=(page-1)*7;
		return productDAO.productOrberbycreate(startrow);
	}


	@Override
	public List<Product> productOrberbyview(int page, PageInfo pageInfo) throws Exception {
		int listCount = productDAO.selectProductCount();
		// table 에 있는 모든 row의 수
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		
		int startPage=(((int) ((double)page/7+0.9))-1)*7+1;
		
		int endPage=startPage+7-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		
		int startrow=(page-1)*7;
		return productDAO.productOrberbyview(startrow);
	}


	@Override
	public List<Product> productOrberbylowprice(int page, PageInfo pageInfo) throws Exception {
		int listCount = productDAO.selectProductCount();
		// table 에 있는 모든 row의 수
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		
		int startPage=(((int) ((double)page/7+0.9))-1)*7+1;
		
		int endPage=startPage+7-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		
		int startrow=(page-1)*7;
		return productDAO.productOrberbylowprice(startrow);
	}


	@Override
	public List<Product> productOrberbyhighprice(int page, PageInfo pageInfo) throws Exception {
		int listCount = productDAO.selectProductCount();
		// table 에 있는 모든 row의 수
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		
		int startPage=(((int) ((double)page/7+0.9))-1)*7+1;
		
		int endPage=startPage+7-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		
		int startrow=(page-1)*7;
		return productDAO.productOrberbyhighprice(startrow);
	}
	
	
	

	
}