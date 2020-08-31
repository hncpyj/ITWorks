package com.kh.itworks.projectManage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.itworks.common.Pagination;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.projectManage.model.service.ProjectService;
import com.kh.itworks.projectManage.model.vo.Project;
import com.kh.itworks.projectManage.model.vo.ProjectMember;
import com.kh.itworks.projectManage.model.vo.ProjectPageInfo;
import com.kh.itworks.projectManage.model.vo.ProjectSearchCondition;


@Controller
@SessionAttributes("loginUser")
public class ProjectManageController {
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("selectAllProjectList.pm")
	public String selectAllProjectList(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		//int loginMno = loginUser.getMno();
		
		int listCount = projectService.getListCount(loginUser);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectProjectList(pi, loginUser);
		
		System.out.println(projectList);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/allProjectList";
		
	}
	
	@RequestMapping("searchAll.pm")
	public String searchAllProject(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		
		ProjectSearchCondition searchCondition = new ProjectSearchCondition();
		
		if(!request.getParameter("startDate").isEmpty()) {
			searchCondition.setStartDate(request.getParameter("startDate"));
		}
		if(!request.getParameter("endDate").isEmpty()) {
			searchCondition.setEndDate(request.getParameter("endDate"));
		}
		if(!request.getParameter("projectName").isEmpty()) {
			searchCondition.setProjectName(request.getParameter("projectName"));
		}
		if(!request.getParameter("progress").isEmpty()) {
			switch(request.getParameter("progress")) {
				case "schedule": searchCondition.setProgress("예정"); break;
				case "progress": searchCondition.setProgress("진행"); break;
				case "finish": searchCondition.setProgress("완료"); break;
				case "hold": searchCondition.setProgress("보류"); break;
				case "discard": searchCondition.setProgress("폐기"); break;
			}
		}
		if(!request.getParameter("writer").isEmpty()) {
			searchCondition.setWriter(request.getParameter("writer"));
		}
		if(!request.getParameter("charge").isEmpty()) {
			searchCondition.setCharge(request.getParameter("charge"));
		}
		if(!request.getParameter("join").isEmpty()) {
			searchCondition.setJoin(request.getParameter("join"));
		}
		
		searchCondition.setScMno(loginUser.getMno());
		
		System.out.println("searchCondition : " + searchCondition);

		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = projectService.getSearchListCount(searchCondition, loginUser);
		
		System.out.println("controller listCount : " + listCount);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectSearchProjectList(pi, loginUser, searchCondition);
		
		System.out.println(projectList);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/allProjectList";
	}

	@RequestMapping("ongoingProjectList.pm")
	public String ongoingProjectList(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = projectService.getOngoingListCount(loginUser);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectOngoingProjectList(pi, loginUser);
		
		System.out.println("controller projectList : " + projectList);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/ongoingProjectList";
	}
	
	@RequestMapping("searchOngoing.pm")
	public String searchOngoing(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		ProjectSearchCondition searchCondition = new ProjectSearchCondition();
		
		if(!request.getParameter("startDate").isEmpty()) {
			searchCondition.setStartDate(request.getParameter("startDate"));
		}
		if(!request.getParameter("endDate").isEmpty()) {
			searchCondition.setEndDate(request.getParameter("endDate"));
		}
		if(!request.getParameter("projectName").isEmpty()) {
			searchCondition.setProjectName(request.getParameter("projectName"));
		}
		if(!request.getParameter("writer").isEmpty()) {
			searchCondition.setWriter(request.getParameter("writer"));
		}
		if(!request.getParameter("charge").isEmpty()) {
			searchCondition.setCharge(request.getParameter("charge"));
		}
		if(!request.getParameter("join").isEmpty()) {
			searchCondition.setJoin(request.getParameter("join"));
		}
		
		searchCondition.setScMno(loginUser.getMno());
		
		System.out.println("ongoing searchCondition : " + searchCondition);

		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = projectService.getSearchOngoingListCount(searchCondition, loginUser);
		
		System.out.println("controller ongoing search listCount : " + listCount);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectSearchOngoingProjectList(pi, loginUser, searchCondition);
		
		System.out.println("search ongoing projectList : " + projectList);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/ongoingProjectList";
	}
	
	@RequestMapping("finishProjectList.pm")
	public String finishProjectList(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = projectService.getFinishListCount(loginUser);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectFinishProjectList(pi, loginUser);
		
		System.out.println("controller projectList : " + projectList);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/finishProjectList";
	}
	
	@RequestMapping("searchFinish.pm")
	public String searchFinish(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		ProjectSearchCondition searchCondition = new ProjectSearchCondition();
		
		if(!request.getParameter("startDate").isEmpty()) {
			searchCondition.setStartDate(request.getParameter("startDate"));
		}
		if(!request.getParameter("endDate").isEmpty()) {
			searchCondition.setEndDate(request.getParameter("endDate"));
		}
		if(!request.getParameter("projectName").isEmpty()) {
			searchCondition.setProjectName(request.getParameter("projectName"));
		}
		if(!request.getParameter("writer").isEmpty()) {
			searchCondition.setWriter(request.getParameter("writer"));
		}
		if(!request.getParameter("charge").isEmpty()) {
			searchCondition.setCharge(request.getParameter("charge"));
		}
		if(!request.getParameter("join").isEmpty()) {
			searchCondition.setJoin(request.getParameter("join"));
		}
		
		searchCondition.setScMno(loginUser.getMno());
		
		System.out.println("finish searchCondition : " + searchCondition);

		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = projectService.getSearchFinishListCount(searchCondition, loginUser);
		
		System.out.println("controller ongoing search listCount : " + listCount);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectSearchFinishProjectList(pi, loginUser, searchCondition);
		
		System.out.println("search finish projectList : " + projectList);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/finishProjectList";
	}
	
	@RequestMapping("insertProjectForm.pm")
	public String showInsertProjectForm(Model model, @SessionAttribute("loginUser") Member loginUser) {
		
		HashMap<String, Object> allMemberDept = projectService.selectAllMemberDept(loginUser.getCorpNo());
		
		System.out.println("controller allMemberDept : " + allMemberDept);
		
		model.addAttribute("allMemberDept", allMemberDept);
		
		return "projectManage/insertProjectForm";
	}
	
	@RequestMapping("insertProject.pm")
	public String insertProject(Model model, Project project, ProjectMember member, HttpServletRequest request, MultipartFile file, @SessionAttribute("loginUser") Member loginUser) {
		System.out.println(project);
		System.out.println(member);
		System.out.println(file);
		
		return "";
	}
	
	@RequestMapping("searchPerson.pm")
	public String searchPerson(Model model, HttpServletRequest request, @SessionAttribute("loginUser") Member loginUser) {
		
		System.out.println(request.getParameter("mno"));
		
		return "";
	}
	
	@RequestMapping("projectNotice.pm")
	public String showProjectNotice() {
		return "projectManage/projectNoticeList";
	}
	
	@RequestMapping("projectDetail.pm")
	public String showProjectDetail(Model model, HttpServletRequest request) {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println("pno : " + pno);
		
		HashMap<String, Object> projectInfo = projectService.selectOneProject(pno);
		System.out.println("projectinfo : " + projectInfo);
		
		model.addAttribute("projectInfo", projectInfo);
		
		return "projectManage/projectDetail";
	}

	@RequestMapping("insertTaskForm.pm")
	public String showInsertTaskForm() {
		return "projectManage/insertTaskForm";
	}
	
	
	@RequestMapping("taskDetail.pm")
	public String showTaskDetail() {
		return "projectManage/taskDetail";
	}
	
	@RequestMapping("insertSubTaskForm.pm")
	public String showInsertSubTaskForm() {
		return "projectManage/insertSubTaskForm";
	}
	
	@RequestMapping("subTaskDetail.pm")
	public String showSubTaskDetail() {
		return "projectManage/subTaskDetail";
	}
	
	@RequestMapping("insertProjectNotice.pm")
	public String showInsertProjectNoticeForm() {
		return "projectManage/insertProjectNoticeForm";
	}
	
	@RequestMapping("noticeDetail.pm")
	public String showNoticeDetail() {
		return "projectManage/noticeDetail";
	}
}
