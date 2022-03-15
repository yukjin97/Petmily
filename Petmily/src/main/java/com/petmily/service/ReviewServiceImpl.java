package com.petmily.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void insertReview(Review review) throws Exception {
		reviewDAO.insertReview(review);
	}
	
	@Override
	public void deleteReview(Review review) throws Exception {
		reviewDAO.deleteReview(review);
	}

	@Override
	public void updateReview(Review review) throws Exception {
		reviewDAO.updateReview(review);
	}

	@Override
	public List<Review> getreviewList(int prod_num, int page, PageInfo pageInfo) throws Exception  {
		int listCount = reviewDAO.selectReviewCount(prod_num);
		// table 에 있는 모든 row의 수
		System.out.println("List카운트 :" + listCount);
		
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
		
		Map<String, Object> testMap= new HashMap<String, Object>();
		testMap.put("prod_num", prod_num);
		testMap.put("startrow", startrow);
		
		return reviewDAO.selectReviewlist(testMap);
	}

	@Override
	public Review selectReviewByNum(int review_num) throws Exception {
		return reviewDAO.selectReviewByNum(review_num);
	}



}
