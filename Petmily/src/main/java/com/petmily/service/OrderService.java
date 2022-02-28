package com.petmily.service;

import com.petmily.dto.Order;

public interface OrderService {
	void order(Order order) throws Exception;
	void mem_payment(String mem_grade) throws Exception;
}
