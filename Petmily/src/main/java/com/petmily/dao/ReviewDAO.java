package com.petmily.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Review;

@Mapper
@Repository
public interface ReviewDAO {

	int selectReviewCount(@Param(value = "search_review") String search_review) throws Exception;

	List<Review> selectReviewList(@Param("startrow") int startrow,@Param(value = "search_review") String search_review) throws Exception;

}
