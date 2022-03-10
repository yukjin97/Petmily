package com.petmily.service;

import com.petmily.dto.Order;

public interface OrderService {
	void order(Order order) throws Exception;
	void mem_payment(String mem_grade, int fix1, int fix2, int fix3) throws Exception;
	void mem_payment2(int fix1, int fix2, int fix3) throws Exception;
}
