package com.petmily.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Review;

@Mapper
@Repository
public interface ReviewDAO {	
	public void insertReview(Review review) throws  Exception;

	int selectReviewCount(int prod_num) throws Exception;

	List<Review> selectReviewlist(Map testMap) throws Exception;
	// 화면 하단에 뿌려줄 페이지 번호를 구성하기 위한 저장된 글의 총 row를 개수 정보로 반환 

	public void deleteReview(Review review) throws Exception;

	public void updateReview(Review review) throws Exception;

	public Review selectReviewByNum(int review_num) throws Exception;
}
