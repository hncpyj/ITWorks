package com.kh.itworks.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.notice.model.exception.NoticeSelectListException;
import com.kh.itworks.notice.model.service.NoticeService;
import com.kh.itworks.notice.model.vo.Notice;
import com.kh.itworks.notice.model.vo.PageInfo;
import com.kh.itworks.notice.model.vo.Pagination;

@Controller
@SessionAttributes("loginUser")
public class NoticeController {

	@Autowired
	private NoticeService ns;
	
	//공지사항 리스트
	@RequestMapping("noticeList.no")
	public ModelAndView noticeList(ModelAndView mv, Notice notice, HttpServletRequest request, @SessionAttribute("loginUser") Member loginUser) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = ns.getListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			notice.setCorpNo(loginUser.getCorpNo());
			
			ArrayList<Notice> list = ns.selectNoticeList(pi, notice.getCorpNo());
			
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			
//			request.setAttribute("list", list);
//			request.setAttribute("pi", pi);
			
			mv.setViewName("notice/noticeList");
			
			System.out.println("list : " + list);
			
		} catch (NoticeSelectListException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	//작성하기 버튼 누르면 보여지는 새글작성 폼
	@RequestMapping("insertNotice.no")
	public String showinsertNoticeForm() {
		
		return "notice/insertNoticeForm";
	}
	
	//공지사항 리스트에서 글 클릭하면 보여지는 상세보기 화면
	@RequestMapping("noticeDetail.no")
	public String showNoticeDetail() {
		
		return "notice/noticeDetail";
				
	}
	
	@RequestMapping("insertNo.no")
	public String insertNo(Model model, Notice notice, @SessionAttribute("loginUser") Member loginUser) {
		
		notice.setCorpNo(loginUser.getCorpNo());
		notice.setMno(loginUser.getMno());
		
		int result = ns.insertNo(notice);
		
		System.out.println("mno : " + loginUser.getMno());
		System.out.println("corpNo : " + loginUser.getCorpNo());
		System.out.println("notice : " + notice);
		
		if(result > 0) {
			return "notice/noticeList";
//			return "redirect:noticeDetail.notice?no=" + notice.getcId();
		} else {
			model.addAttribute("msg", "공지사항 등록 실패");
			return "notice/noticeList";
		}
		 
	}
	
}
