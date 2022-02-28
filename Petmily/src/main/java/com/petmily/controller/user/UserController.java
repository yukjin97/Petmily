package com.petmily.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.petmily.dto.User;
import com.petmily.service.UserService;

@Controller
public class UserController {
	@Autowired 
	UserService userService ;

	/* 회원가입 기능 구현 */
	@PostMapping(value = "/join")
	public ModelAndView join(@ModelAttribute User user) {
		ModelAndView mav = new ModelAndView(""); //추가예정
		try {
			User ruser = userService.join(user);
			mav.addObject("user", ruser);
			mav.addObject("cpage", "login");
		} catch (Exception e) {
			mav.addObject(e.getMessage());
		}
		return mav;
	}
	
	/* 아이디 중복 조회 기능 구현 */
	@ResponseBody
	@PostMapping(value = "/useroverlap")
	public String useroverlap(@RequestParam(value = "id") String id) {
		boolean overlap = false;
		try {
			overlap = userService.joinOverlap(id);
		} catch (Exception e) {}
		return String.valueOf(overlap);
	}
	/* 로그인 기능 구현 */
	@ResponseBody
	@PostMapping(value = "/login")
	public ModelAndView login(@RequestParam(value = "id") String id, @RequestParam(value = "password") String password, HttpServletRequest req){
		ModelAndView mav = new ModelAndView("");
		try {
			User user = userService.login(id, password);
			HttpSession session = req.getSession();
			session.setAttribute(id, user.getUser_id());
			session.setAttribute(password, user.getUser_pwd());
			mav.addObject("cpage", "");//main
		} catch (EmptyResultDataAccessException e) {
			mav.addObject("err", "아이디 또는 비밀번호가 틀렸습니다.");
//			mav.addObject("cpage", "err");
		} catch (Exception e) {
//			mav.addObject("cpage", "err");
			mav.addObject("err", "아이디 또는 비밀번호가 틀렸습니다.");
		}
		return mav;
	}
}
