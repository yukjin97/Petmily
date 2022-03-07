package com.petmily.service;

import java.util.List;

import com.petmily.dto.PageInfo;
import com.petmily.dto.Review;

public interface ReviewService {
	
	public List<Review> reviewList(int page, PageInfo pageInfo, String search_review) throws Exception;

	public void reviewrite(Review review) throws Exception;

	
}
