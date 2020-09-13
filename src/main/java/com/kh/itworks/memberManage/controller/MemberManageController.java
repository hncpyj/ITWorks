package com.kh.itworks.memberManage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.itworks.common.Pagination;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.memberManage.model.service.MemberManageService;
import com.kh.itworks.memberManage.model.vo.MemberManagePageInfo;

@Controller
public class MemberManageController {

	@Autowired
	private MemberManageService mms;
	
	
	
	// 가입대기 직원 리스트 전체
	@RequestMapping("waitingToJoinList.mm")
	public String waitingToJoinList(HttpServletRequest request, @SessionAttribute("loginUser") Member loginUser, Model model) {
		int currentPage = 1;
		int corpNo = loginUser.getCorpNo();
		
		if(request.getParameter("currentPage") != null) {
			 currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 전체 리스트의 행의 갯수
		int listCount = mms.getListCount1(corpNo); 
		System.out.println("listCount1 : " + listCount);
		
		MemberManagePageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = mms.selectMemberManageList(pi, corpNo);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("listCount1", listCount);
		
		return "memberManage/waitingToJoinList";
	}

	
	// 검색 조회
	@RequestMapping("searchMemberList.mm")
	public String searchMemberList() {
		
		return "";
	}
	
	
	// 가입대기 직원 리스트에서 수정버튼 누른 후 모달창
	@RequestMapping("updateJoinList.mm") 
	public String updateJoinList() {
	 
		return "memberManage/waitingToJoinList";
	
	}
	 
	// 가입 승인 버튼 누르면 가임된 직원 리스트로 내용이 이동함
	@RequestMapping("signUpApprovalList.mm") 
	public String signUpApprovalList(HttpServletRequest request, @SessionAttribute("loginUser") Member loginUser, Model model) {
		int currentPage = 1;
		int corpNo = loginUser.getCorpNo();
		
		if(request.getParameter("currentPage") != null) {
			 currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 전체 리스트의 행의 갯수
		int listCount = mms.getListCount2(corpNo); 
		System.out.println("listCount2 : " + listCount);
		
		MemberManagePageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = mms.signUpApprovalList(pi, corpNo);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("listCount2", listCount);
		
		
		return "memberManage/signUpApprovalList";
	} 

	
	
	
}
