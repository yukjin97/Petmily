package com.petmily.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.OrderDAO;
import com.petmily.dto.Order;
import com.petmily.dto.User;

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
		orderDAO.mem_payment(mem_grade,fix1,fix2,fix3);
	}

	@Override
	public void mem_payment2(int fix1, int fix2, int fix3) throws Exception {
		orderDAO.mem_payment2(fix1,fix2,fix3);
	}

	@Override
	public void paymentsingle(Order order, User user, int prod_num) throws Exception {
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("order", order);
		mapParam.put("user", user);
		mapParam.put("prod_num", prod_num);
		orderDAO.paymentsingle(mapParam);
		
	}
}
