package com.kh.itworks.member.controller;

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
	
	   
	@RequestMapping("login.me")
	public String loginCheck(Model model, Member m) {
	
		
		try {
		      Member loginUser = ms.loginMember(m);
		      
		      
		      model.addAttribute("loginUser", loginUser);
		      
		      return "redirect:index.jsp";
		} catch(LoginFailedException e){
		      model.addAttribute("msg", e.getMessage());
		         
		      return "common/errorPage";
		}
	}
}
