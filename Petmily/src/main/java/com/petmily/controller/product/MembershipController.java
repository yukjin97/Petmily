package com.petmily.controller.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petmily.dto.Membership;
import com.petmily.dto.Order;
import com.petmily.dto.User;
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

   @GetMapping(value = "/subscribe")
   public String membership() {
      return "subscribe";
   }
   
   @GetMapping(value = "/mem_pay")
	public String mem_pay(Model model) {
		String user_id = (String)session.getAttribute("user_id");
	   try {
			System.out.println(user_id);
			User pay = membershipService.payinfo(user_id);
			model.addAttribute("pay", pay);
			System.out.println(pay);
			return "/mem_pay";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mem_pay";
	}
   
   @ResponseBody
   @PostMapping(value = "/mem_silver")
   public String mem_silverPass(){
	   String user_id = (String)session.getAttribute("user_id");
	   boolean overlap = false;
      try {
         session.setAttribute("mem_grade","silver");
         session.setAttribute("mem_productNum", 1);
         session.setAttribute("fix1", 1);
         session.setAttribute("fix2", 2);
         session.setAttribute("fix3", 3);
         session.setAttribute("mem_price", 9800);
         session.setAttribute("mem_img", "pricing-1.jpg");
         session.setAttribute("mem_name", "Very Nice Silver Pakage");
         overlap = membershipService.silverOverlap(user_id);
         return String.valueOf(overlap);
      }catch(Exception e) {
         return "subscribe";
      }
   }
   
   @GetMapping(value="mem_silver")
   public String mem_silver() {
		if(session.getAttribute("user_id")==null) {
			return "login";
		}
	   return "mem_silver";
			   
   }
   
   @ResponseBody
   @PostMapping(value = "/mem_gold")
   public String mem_goldPass(){
	   String user_id = (String)session.getAttribute("user_id");
	   boolean overlap = false;
      try {
         session.setAttribute("mem_grade","gold");
         session.setAttribute("mem_productNum", 2);
         session.setAttribute("fix1", 4);
         session.setAttribute("fix2", 5);
         session.setAttribute("fix3", 6);
         session.setAttribute("mem_price", 19800);
         session.setAttribute("mem_img", "staff-6.jpg");
         session.setAttribute("mem_name", "Amazing Gold Pakage");
         overlap = membershipService.goldOverlap(user_id);
         return String.valueOf(overlap);
      }catch(Exception e) {
         return "subscribe";
      }
   }
   
   @GetMapping(value="mem_gold")
   public String mem_gold() {
		if(session.getAttribute("user_id")==null) {
			return "login";
		}
	   return "mem_gold";		   
   }
   
   @PostMapping(value="/mem_pay")
   public String mem_pay(@ModelAttribute Membership membership, @ModelAttribute Order order) {
      try {
         membership.setUser_id((String)session.getAttribute("user_id"));
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
         orderService.mem_payment2(fix1,fix2,fix3);
         session.removeAttribute("mem_grade");
         session.removeAttribute("mem_productNum");
         session.removeAttribute("fix1");
         session.removeAttribute("fix2");
         session.removeAttribute("fix3");
         session.removeAttribute("mem_price");
         session.removeAttribute("mem_img");
         session.removeAttribute("mem_name");
         return "subscribe";
      }catch(Exception e) {
    	 e.printStackTrace();
         return "mem_pay";
      }
   }   
   
}