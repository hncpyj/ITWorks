package com.kh.itworks.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.itworks.atManagement.model.vo.ATManagement;
import com.kh.itworks.main.model.service.MainService;
import com.kh.itworks.main.model.vo.Main;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.notice.model.vo.Notice;
import com.kh.itworks.projectManage.model.vo.Project;

@Controller
public class MainController {
	
	@Autowired
	private MainService ms;
	
	@RequestMapping("main.me")
	public ModelAndView main(ModelAndView mv, Member m, @SessionAttribute("loginUser") Member loginUser) {
		m.setMno(loginUser.getMno());
		m.setCorpNo(loginUser.getCorpNo());
		ArrayList<Main> notice = ms.selectNoticeMainList(m);
		ArrayList<Main> at = ms.selectAtStatus(m);
		ArrayList<Main> project = ms.selectProjectMainList(m);
		System.out.println("notice : " + notice);
		System.out.println("project : " + project);
		
		mv.addObject("at", at);
		mv.addObject("notice", notice);
		mv.addObject("project", project);
		
		mv.setViewName("main/main");
		
		
		return mv;
	}

}
