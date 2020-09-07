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
	
	
	//아이디 중복체크
	@RequestMapping("duplicationCheck.me")
	public void duplicationCheck(@RequestParam String userId, HttpServletResponse response) {
		
		Member m = ms.duplicationCheck(userId);
		
		//임의의 숫자 높게 줌
		int chk = 3000;
		//아이디 중복체크는 똑같은게 있으면 안 되는 조건!
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
	
	//회사코드 DB등록여부 체크
	@RequestMapping("corpNoCheck.me")
	public void corpNoCheck(@RequestParam int corpNo, HttpServletResponse response) {
		
		//return : 나를 호출한 것으로 값을 들고 돌아온 것임
		//m에는 DB에서 가져온 값 0 또는 1이 들어있다.
		int m = ms.corpNoCheck(corpNo);
		
//		System.out.println(m);
		
		//회사코드는 똑같은게 있어야 되는 조건!
		//중복되는 것이 있을 때 1 (중복체크 통과..)
		try {
			response.getWriter().print(m);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
	//회원가입 insert 
	@RequestMapping(value="insert.me")
	public String insertMember(Model model, Member m) {
		
		ms.insertMember(m);
		
		return "login/login";
	}
	
	

}
