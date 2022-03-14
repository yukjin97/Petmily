package com.petmily.service;

import java.util.List;

import com.petmily.dto.PageInfo;
import com.petmily.dto.Review;

public interface ReviewService {
	


	public void insertReview(Review review) throws Exception;

	public List<Review> getreviewList(int prod_num, int page, PageInfo pageInfo) throws Exception ;	

	
	
}
