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
import com.kh.itworks.notice.model.vo.NoticePageInfo;
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
			
			NoticePageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			notice.setCorpno(loginUser.getCorpNo());
			
			ArrayList<Notice> list = ns.selectNoticeList(pi, notice.getCorpno());
			
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			
			mv.setViewName("notice/noticeList");
			
			System.out.println("list : " + list);
			
		} catch (NoticeSelectListException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping("noticeDetail.no")
	public ModelAndView noticeDetail(ModelAndView mv, @SessionAttribute("loginUser") Member loginUser, HttpServletRequest request) {
		
		//notice.setCorpNo(loginUser.getCorpNo());
		
		String noticeNo = request.getParameter("noticeno");
		
		Notice notice2 = ns.selectOneBoard(noticeNo);
		
		mv.addObject("notice2", notice2);
		
		mv.setViewName("notice/noticeDetail");
		
		System.out.println("notice2 : " + notice2);
		
		return mv;
	}
	
	//작성하기 버튼 누르면 보여지는 새글작성 폼
	@RequestMapping("insertNotice.no")
	public String showinsertNoticeForm() {
		
		return "notice/insertNoticeForm";
	}
	
	@RequestMapping("insertNo.no")
	public String insertNo(Model model, Notice notice, @SessionAttribute("loginUser") Member loginUser) {
		
		notice.setCorpno(loginUser.getCorpNo());
		notice.setMno(loginUser.getMno());
		
		int result = ns.insertNo(notice);
		
		System.out.println("mno : " + loginUser.getMno());
		System.out.println("corpNo : " + loginUser.getCorpNo());
		System.out.println("notice : " + notice);
		
		if(result > 0) {
			return "redirect:noticeList.no";
//			return "redirect:noticeDetail.notice?no=" + notice.getcId();
		} else {
			model.addAttribute("msg", "공지사항 등록 실패");
			return "notice/noticeList";
		}
		 
	}
	
	@RequestMapping("deleteNo.no")
	public String deleteNo(Model model, Notice notice, @SessionAttribute("loginUser") Member loginUser) {
		
		notice.setCorpno(loginUser.getCorpNo());
		notice.setMno(loginUser.getMno());
		
		int result = ns.deleteNo(notice);
		
		System.out.println("controller : " + notice);
		
		if (result > 0) {
			return "redirect:noticeList.no";
		} else {
			model.addAttribute("msg", "공지사항 삭제 실패");
			return "notice/noticeList";
		}

	}
	
}














