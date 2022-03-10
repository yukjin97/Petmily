package com.petmily.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petmily.dto.Order;

@Mapper
@Repository
public interface OrderDAO {
	void insertOrder(Order order) throws Exception;
	Integer selectMaxOrderNum() throws Exception;
	void mem_payment(@Param("mem_grade")String mem_grade, @Param("fix1")int fix1, @Param("fix2")int fix2,
			@Param("fix3")int fix3) throws Exception;
	void mem_payment2(@Param("fix1")int fix1, @Param("fix2")int fix2,
			@Param("fix3")int fix3) throws Exception;
	
	//주문 내역 조회
	   public List<Order> orderDetail(String user_id) throws Exception;
	
}
