package com.kh.itworks.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	  
	//로그인
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
	
	//회원가입 폼
	@RequestMapping("/MemberjoinForm.me")
	public String showMemberJoinForm() {
		
		return "join/join";
	}
	
	//중복체크
	@RequestMapping("duplicationCheck.me")
	public void duplicationCheck(@RequestParam String userId, HttpServletResponse response) {
		
		Member m = ms.duplicationCheck(userId);
		
		int chk = 3000;
		//중복되는 것이 없을 때  0 (중복체크 통과)
		if(m == null) {
			chk = 0;
		} else {
			chk = 1;
		}
		
		try {
			response.getWriter().print(chk);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	//이용약관
	@RequestMapping("/TermsOfUse.me")
	public String showTermsOfUse() {
		
		return "join/termsOfUse";
	}
	
	//개인정보 수집/이용
	@RequestMapping("/PrivacyPolicy.me")
	public String showPrivacyPolicy() {
		
		return "join/privacyPolicy";
	}
	
	
	
	
	//회원가입 insert 
	@RequestMapping(value="insert.me")
	public String insertMember(Model model, Member m) {
		
		ms.insertMember(m);
		
		
		return "main/main";
	}
	
	

}
