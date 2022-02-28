package com.petmily.controller.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.petmily.dto.Membership;
import com.petmily.dto.Order;
import com.petmily.service.MembershipService;
import com.petmily.service.OrderService;

@Controller
public class MembershipController {
	@Autowired
	MembershipService membershipService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping(value = "/mem_service")
	public String mem_service() {
		return "mem_service";
	}
	
	@GetMapping(value = "/mem_silver")
	public String mem_silver() {
		return "mem_silver";
	}
	
	@GetMapping(value = "/mem_gold")
	public String mem_gold() {
		return "mem_gold";
	}
	
	@GetMapping(value = "/mem_pay")
	public String mem_pay() {
		return "mem_pay";
	}
	
	@PostMapping(value="/mem_pay_silver")
	public String mem_pay_silver(@ModelAttribute Membership membership, @ModelAttribute Order order) {
		try {
			membership.setUser_id((String)session.getAttribute("id"));
			membership.setMem_grade("Silver");
			membershipService.memberShip(membership);
			order.setUser_id((String)session.getAttribute("id"));
			//prod_num 1에 실버 2에 골드 패키지를 넣어야함
			order.setProd_num(1);
			order.setOrder_count(1);
			orderService.order(order);
			//마이페이지 구독권 쪽으로
			return "mypage";
		}catch(Exception e) {
			return "mem_pay";
		}
	}
	
	@PostMapping(value="/mem_pay_gold")
	public String mem_pay_gold(@ModelAttribute Membership membership, @ModelAttribute Order order) {
		try {
			membership.setUser_id((String)session.getAttribute("id"));
			membership.setMem_grade("Gold");
			membershipService.memberShip(membership);
			order.setUser_id((String)session.getAttribute("id"));
			//prod_num 1에 실버 2에 골드 패키지를 넣어야함
			order.setProd_num(2);
			order.setOrder_count(1);
			orderService.order(order);
			//마이페이지 구독권 쪽으로
			return "mypage";
		}catch(Exception e) {
			return "mem_pay";
		}
	}
	
}
