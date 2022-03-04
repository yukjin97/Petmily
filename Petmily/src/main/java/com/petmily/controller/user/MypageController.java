package com.petmily.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.petmily.dto.User;
import com.petmily.service.MyPageService;

@Controller
public class MypageController {
   @Autowired
   MyPageService myPageService;
   @Autowired
   HttpSession session;

   @GetMapping(value = "/mypageinfo")
   public String mypageinfo(Model model) {
      String user_id = (String) session.getAttribute("user_id");
      try {
         User user = myPageService.myPageInfo(user_id);
         model.addAttribute("user", user);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "mypageinfo";
   }

   @GetMapping(value = "usermodify")
   public String usermodify(Model model) {
      String user_id = (String) session.getAttribute("user_id");
      
      try {
         User user = myPageService.myPageInfo(user_id);
         model.addAttribute("user", user);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "usermodify";
   }
   @PostMapping(value = "usermodify")
   public String usermodify(@ModelAttribute User user, Model model) {
      String user_id = (String) session.getAttribute("user_id");
      try {   
         user.setUser_id(user_id); // 유저객체 아이디
         myPageService.userModify(user);
         user = myPageService.myPageInfo(user_id);
         model.addAttribute("user", user);
         return "mypageinfo";
      } catch (Exception e) {
         e.printStackTrace();
         return "usermodify";
      }
   }

}