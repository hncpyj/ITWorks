package com.kh.itworks.member.controller;

<<<<<<< src/main/java/com/kh/itworks/member/controller/MemberController.java
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/join.me")
	public String memberJoin() {
		
		return "join/join";
	}
	
=======
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.itworks.member.model.exception.LoginFailedException;
import com.kh.itworks.member.model.service.MemberService;
import com.kh.itworks.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping("main.me")
	public String main() {
		
		return "main/main";
	}
	   
	@RequestMapping("login.me")
	public String loginCheck(Model model, Member m) {
	
		
		try {
		      Member loginUser = ms.loginMember(m);
		      
		      
		      model.addAttribute("loginUser", loginUser);
		      
		      return "redirect:main.me";
		} catch(LoginFailedException e){
		      model.addAttribute("msg", e.getMessage());
		         
		      return "common/errorPage";
		}
	}
	@Controller
public class MemberController {

	@RequestMapping("/join.me")
	public String memberJoin() {
		
		return "join/join";
	}
>>>>>>> src/main/java/com/kh/itworks/member/controller/MemberController.java
}
