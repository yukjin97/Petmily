package com.petmily.controller.user;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.petmily.dto.Mail;
import com.petmily.dto.User;
import com.petmily.service.MailService;
import com.petmily.service.UserService;

@Controller
public class UserController {

	@Autowired
	HttpSession session;
	@Autowired
	UserService userService;
	@Autowired
	MailService mailService;

	
	
	@PostMapping("signup")
	public ModelAndView join(@ModelAttribute User user) {
		ModelAndView mav = new ModelAndView();
		Mail mail = new Mail();
		try {
			userService.makeUser(user);
			if(user.getUser_type().equals("noraml")) {
				mailService.joinMailSend(mail,user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@ResponseBody
	@PostMapping("login")
	public ResponseEntity<?> login(@RequestBody User user) {
		User tmp = new User();
		Map<String, String> map = new HashMap<String,String>();
		try {
			tmp = userService.accessUser(user.getUser_id(),user.getUser_pwd());
		} catch (Exception e) {
			return new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		if(tmp.getUser_type().equals("normal")) {
			session.setAttribute("user_id", tmp.getUser_id());
			session.setAttribute("user_type", tmp.getUser_type());
			map.put("user_type", tmp.getUser_type());
			map.put("user_id", tmp.getUser_id());
			return new ResponseEntity<Map<String, String>>(map,HttpStatus.OK);
		} else {
			session.setAttribute("user_id", tmp.getUser_id());
			session.setAttribute("user_type",tmp.getUser_type());
			map.put("user_type", tmp.getUser_type());
			map.put("user_id", tmp.getUser_id());
			return new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
		}
	}
	
	
	@PostMapping("logout")
	public String logout() {
		session.removeAttribute("user_id");
		session.removeAttribute("user_type");
		return "redirect:/";
	}
	
	
	

	@RequestMapping(value="/kakaologin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("#########" + code);
		String access_Token = userService.getAccessToken(code);
		HashMap<String, Object> userInfo = userService.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		return "/kakaologin";
    	}
	
	
	
	@RequestMapping(value="naverlogin", method=RequestMethod.GET)
	public String callBack(){
		return "naverlogin";
	}

}
