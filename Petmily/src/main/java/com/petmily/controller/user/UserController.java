package com.petmily.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petmily.dto.User;
import com.petmily.service.UserService;

@Controller
public class UserController {
   @Autowired
   UserService userService;
   @Autowired
   HttpSession session;

   @GetMapping(value = "/login")
   public String login() {
      return "login";
   }

   @GetMapping(value = "/join")
   public String join() {
      return "join";
   }

   /* 회원가입 기능 구현 */
   @PostMapping(value = "/join")
   public String join(@ModelAttribute User user, Model model) {
      try {
         userService.join(user);
         model.addAttribute("ok", "true");
         return "login";
      } catch (Exception e) {
         model.addAttribute("ok", "false");
         return "join";
      }
   }

   /* 아이디 중복 조회 기능 구현 */
   @ResponseBody
   @PostMapping("/useroverlap")
   public String userOverlap(@RequestParam(value = "id") String user_id) {
      boolean overlap = true;
      System.out.println(user_id);
      try {
         overlap = userService.joinOverlap(user_id);
      } catch (Exception e) {
      }
      System.out.println(overlap);
      return String.valueOf(overlap);
   }

   /* 로그인 기능 구현 */
   @PostMapping("/login")
   public String login(@RequestParam(value = "user_id") String user_id,
         @RequestParam(value = "user_pwd") String user_pwd, Model model) {
      try {
         userService.login(user_id, user_pwd);
         session.setAttribute("user_id", user_id);
         session.setAttribute("login", "true");
         
         System.out.println("check");
         return "index";
      } catch (Exception e) {
         e.printStackTrace();
         model.addAttribute("login", "false");
         return "login";
      }
   }

   @GetMapping(value = "/logout")
   public String logout(HttpServletRequest request, Model model) {
      HttpSession session = request.getSession();
      session.removeAttribute("user_id");
      return "login";
   }
}
