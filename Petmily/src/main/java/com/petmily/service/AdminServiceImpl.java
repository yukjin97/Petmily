package com.petmily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.petmily.dao.AdminDAO;
import com.petmily.dto.Admin;
import com.petmily.dto.PageInfo;
import com.petmily.dto.Product;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO admindao;

	@Override
	public List<Admin> membershipList(int page, PageInfo pageInfo,@RequestParam(value = "mem_text") String mem_text) throws Exception {
		int listCount=admindao.selectMembershipCount(mem_text);
		//table에 있는 모든 row 개수
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		//그 개수를 10으로 나누고 올림처리하여 페이지 수 계산
		
		//아래 2개의 알고리즘은 현재 하나의 페이지에 글 목록을 10개 보여주고
		//아래에 페이지 이동 버튼도 10개로 구성하고자 하기 위함이다.
		int startPage=(((int) ((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21, ...)
		
		int endPage=startPage+10-1;
		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		//즉, getBoardList를 호출한 컨트롤러에 생성된(new) pageInfo 객체에 초기화하는 것이다.
		
		int startrow=(page-1)*10+1;
		
		return admindao.selectMembershipList(startrow,mem_text);
	}

	@Override
	public List<Product> productList(int page, PageInfo pageInfo, @RequestParam(value = "search_prod") String search_prod) throws Exception {
		int listCount=admindao.selectProductCount(search_prod);
		//table에 있는 모든 row 개수
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		//그 개수를 10으로 나누고 올림처리하여 페이지 수 계산
		
		//아래 2개의 알고리즘은 현재 하나의 페이지에 글 목록을 10개 보여주고
		//아래에 페이지 이동 버튼도 10개로 구성하고자 하기 위함이다.
		int startPage=(((int) ((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21, ...)
		
		int endPage=startPage+10-1;
		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		//즉, getBoardList를 호출한 컨트롤러에 생성된(new) pageInfo 객체에 초기화하는 것이다.
		
		int startrow=(page-1)*10+1;
		
		return admindao.selectProductList(startrow,search_prod);
	}

	@Override
	public void productwrite(Product product) throws Exception {
		Integer prod_num = admindao.selectMaxProdNum();
		if(prod_num ==null) { prod_num =1;}
		else {prod_num +=1;}
		product.setProd_num(prod_num);
		admindao.insertProduct(product);
		
	}

	@Override
	public Product productDetail(int prod_num) throws Exception {
		Product modi = admindao.productDetail(prod_num);
		return modi;
	}

	@Override
	public void modifyproduct(Product product) throws Exception {
		admindao.modifyproduct(product);
		
	}

	@Override
	public void productDelete(int prod_num) throws Exception {
		admindao.deleteproduct(prod_num);
		
	}

	@Override
	public List<Product> inventoryList(int page, PageInfo pageInfo, String search_inven) throws Exception {
		int listCount=admindao.selectInventoryCount(search_inven);
		//table에 있는 모든 row 개수
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		//그 개수를 10으로 나누고 올림처리하여 페이지 수 계산
		
		//아래 2개의 알고리즘은 현재 하나의 페이지에 글 목록을 10개 보여주고
		//아래에 페이지 이동 버튼도 10개로 구성하고자 하기 위함이다.
		int startPage=(((int) ((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21, ...)
		
		int endPage=startPage+10-1;
		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		//즉, getBoardList를 호출한 컨트롤러에 생성된(new) pageInfo 객체에 초기화하는 것이다.
		
		int startrow=(page-1)*10+1;
		
		return admindao.selectInventoryList(startrow,search_inven);
	}

	@Override
	public void addAmount(Product product) throws Exception {
		admindao.addAmount(product);
		
	}

	@Override
	public List<Admin> orderList(int page, PageInfo pageInfo, String search_text) throws Exception {
		int listCount=admindao.selectOrderCount(search_text);
		//table에 있는 모든 row 개수
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		//그 개수를 10으로 나누고 올림처리하여 페이지 수 계산
		
		//아래 2개의 알고리즘은 현재 하나의 페이지에 글 목록을 10개 보여주고
		//아래에 페이지 이동 버튼도 10개로 구성하고자 하기 위함이다.
		int startPage=(((int) ((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21, ...)
		
		int endPage=startPage+10-1;
		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		//즉, getBoardList를 호출한 컨트롤러에 생성된(new) pageInfo 객체에 초기화하는 것이다.
		
		int startrow=(page-1)*10+1;
		
		return admindao.selectOrderList(startrow,search_text);
	}

	@Override
	public Integer updateOrderStatus(int order_num) throws Exception {
		return admindao.updateOrderStatus(order_num);
	}

}
