package com.petmily.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.ReviewDAO;
import com.petmily.dto.PageInfo;
import com.petmily.dto.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewDAO reviewDAO;

	@Override
	public void reviewrite(Review review) throws Exception {
		
	}

	@Override
	public List<Review> reviewList(int page, PageInfo pageInfo, String search_review) throws Exception {
		int listCount = reviewDAO.selectReviewCount(search_review);
		// teable에 있는 모든 row 개수 
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		// 그 개수를 10으로 나누고 올림처리하여 페이지 수 계산
		
		int startPage=(((int) ((double)page/10+0.9))-1)*10+1;
		// 현재 페이지에 보여줄 시작 페이지 수 
		
		int endPage=startPage+10-1;
		// 현제페이에서 보여줄 마지막 페이지 수 
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		
		
		int startrow= (page-1)*10+1;
		
		
		return reviewDAO.selectReviewList(startrow,search_review);
		
	}




}
