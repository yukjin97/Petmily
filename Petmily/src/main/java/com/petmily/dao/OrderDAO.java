package com.petmily.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Order;

@Mapper
@Repository
public interface OrderDAO {
	void insertOrder(Order order) throws Exception;
	Integer selectMaxOrderNum() throws Exception;	
}
