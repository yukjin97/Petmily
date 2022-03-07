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
   
   @GetMapping(value = "/membership")
   public String membership() {
      return "membership";
   }

   @GetMapping(value = "/mem_pay")
   public String mem_pay() {
      return "mem_pay";
   }
   
   @PostMapping(value = "/mem_silver")
   public String mem_silverPass(){
      try {
         session.setAttribute("mem_grade","silver");
         session.setAttribute("mem_productNum", 1);
         session.setAttribute("fix1", 1);
         session.setAttribute("fix2", 2);
         session.setAttribute("fix3", 3);
         session.setAttribute("mem_price", "9,800");
         session.setAttribute("mem_img", "");
         return "mem_silver";
      }catch(Exception e) {
         return "membership";
      }
   }
   
   @GetMapping(value="mem_silver")
   public String mem_silver() {
	   return "mem_pay";
			   
   }
   
   @PostMapping(value = "/mem_gold")
   public String mem_goldPass(){
      try {
         session.setAttribute("mem_grade","gold");
         session.setAttribute("mem_productNum", 2);
         session.setAttribute("fix1", 4);
         session.setAttribute("fix2", 5);
         session.setAttribute("fix3", 6);
         session.setAttribute("mem_price", "13,800");
         session.setAttribute("mem_img", "");
         return "mem_gold";
      }catch(Exception e) {
         return "membership";
      }
   }
   
   @GetMapping(value="mem_gold")
   public String mem_gold() {
	   return "mem_pay";
			   
   }
   
   @PostMapping(value="/mem_pay")
   public String mem_pay(@ModelAttribute Membership membership, @ModelAttribute Order order) {
	   session.setAttribute("id", "test");
      try {
         membership.setUser_id((String)session.getAttribute("id"));
         membership.setMem_grade((String)session.getAttribute("mem_grade"));
         membershipService.memberShip(membership);
         order.setUser_id((String)session.getAttribute("id"));
         //prod_num 1에 실버 2에 골드 패키지를 넣어야함
         order.setProd_num((Integer)session.getAttribute("mem_productNum"));
         order.setOrder_count(1);
         //address 부분 벨류값 넣어줘야함
         order.setOrder_address(null);
         orderService.order(order);
         //마이페이지 구독권 쪽으로
         String grade = (String)session.getAttribute("mem_grade");
         int fix1 = (Integer)session.getAttribute("fix1");
         int fix2 = (Integer)session.getAttribute("fix2");
         int fix3 = (Integer)session.getAttribute("fix3");
         orderService.mem_payment(grade,fix1,fix2,fix3);
         session.removeAttribute("mem_grade");
         session.removeAttribute("mem_productNum");
         session.removeAttribute("fix1");
         session.removeAttribute("fix2");
         session.removeAttribute("fix3");
         session.removeAttribute("mem_price");
         session.removeAttribute("mem_img");
         return "membership";
      }catch(Exception e) {
    	 e.printStackTrace();
         return "mem_pay";
      }
   }   
   

}