package com.petmily.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.petmily.dto.Membership;
import com.petmily.dto.User;
import com.petmily.service.MembershipService;
import com.petmily.service.MyPageService;

@Controller
public class MypageController {
	@Autowired
	MyPageService myPageService;
	@Autowired
	HttpSession session;
	@Autowired
	MembershipService membershipService;

	//마이페이지 불러오기
	@GetMapping(value = "/mypageinfo")
	public ModelAndView mypageinfo() {
		ModelAndView mav = new ModelAndView("mypageinfo");
		String user_id = (String) session.getAttribute("user_id");
		try {
			User user = myPageService.myPageInfo(user_id);
			mav.addObject("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	//마이페이지 유저정보 불러오기	
	@GetMapping(value = "usermodify")
	public ModelAndView userModify() {
		ModelAndView mav = new ModelAndView("usermodify");
		String user_id = (String) session.getAttribute("user_id");
		try {
			User user = myPageService.myPageInfo(user_id);
			mav.addObject("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	//마이페이지 유저 수정
	@PostMapping(value = "usermodify")
	public ModelAndView userModify(@ModelAttribute User user) {
		ModelAndView mav = new ModelAndView("mypageinfo");
		String user_id = (String) session.getAttribute("user_id");
		try {
			user.setUser_id(user_id); // 유저객체 아이디
			myPageService.userModify(user);
			user = myPageService.myPageInfo(user_id);
			mav.addObject("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("usermodify");
		}
		return mav;
	}
	
	//마이페이지 멤버십정보 불러오기
	@GetMapping(value = "mymembership")
	public ModelAndView mymembership(@ModelAttribute Membership mem, User user) {
		ModelAndView mav = new ModelAndView("mymembership");
		String user_id = (String) session.getAttribute("user_id"); // 세션 넣기
		try {
			user = myPageService.myPageInfo(user_id);
			Membership rmem = myPageService.myMemberShipInfo(user_id);
			mem.setUser_id(user_id); // 유저객체 아이디
			mav.addObject("rmem", rmem);
			mav.addObject("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("err");
		}
		return mav;
	}
	
	//마이페이지 배송지 정보 불러오기
	@GetMapping(value = "useraddress")
	public ModelAndView userAddress(@ModelAttribute User user) {
		ModelAndView mav = new ModelAndView("addressmodify");
		String user_id = (String) session.getAttribute("user_id"); // 세션 넣기
		try {
			user = myPageService.myPageInfo(user_id);
			user.setUser_id(user_id); 
			mav.addObject("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("err");
		}
		return mav;
	}

	//마이페이지 배송지 정보 수정하기
	@PostMapping(value = "useraddressmodify")
	public ModelAndView userAddressModify(@ModelAttribute User user) {
		ModelAndView mav = new ModelAndView("addressmodify");
		String user_id = (String) session.getAttribute("user_id");
		try {	 
			user.setUser_id(user_id); // 유저객체 아이디
			myPageService.userAddressModify(user);
			user = myPageService.myPageInfo(user_id);
			mav.addObject("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("err");
		}
		return mav;
	}
}
