package com.petmily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.OrderDAO;
import com.petmily.dto.Order;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDAO orderDAO;
	
	@Override
	public void order(Order order) throws Exception {
		Integer orderNum = orderDAO.selectMaxOrderNum();
		if(orderNum==null) orderNum=1;
		else orderNum += 1;
		order.setOrder_num(orderNum);
		orderDAO.insertOrder(order);
	}

	@Override
	public void mem_payment(String mem_grade, int fix1, int fix2, int fix3) throws Exception {
		System.out.println("completeServ");
		orderDAO.mem_payment(mem_grade,fix1,fix2,fix3);
	}
}
