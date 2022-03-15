package com.petmily.service;

import com.petmily.dto.Order;
import com.petmily.dto.User;

public interface OrderService {
	void insertCartList(Order order)throws Exception;
	void order(Order order) throws Exception;
	void mem_payment(String mem_grade, int fix1, int fix2, int fix3) throws Exception;
	void mem_payment2(int fix1, int fix2, int fix3) throws Exception;
	void paymentsingle(Order order, User user, int prod_num) throws Exception;
	void soloPaymentCount(Order order, int prod_num)throws Exception;
	void soloPaymentCount2(int prod_num)throws Exception;
	void cartPayment(Order order, int prod_num)throws Exception;
	void cartPayment2(int prod_num)throws Exception;
}
