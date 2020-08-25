package com.kh.itworks.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	//공지사항 리스트
	@RequestMapping("noticeList.no")
	public String noticeList() {
		
		return "notice/noticeList";
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
	
	
}
