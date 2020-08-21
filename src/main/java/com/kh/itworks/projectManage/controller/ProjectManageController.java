package com.kh.itworks.projectManage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectManageController {
	
	@RequestMapping("selectAllProjectList.pm")
	public String selectAllProjectList() {
		return "projectManage/allProjectList";
	}

	@RequestMapping("ongoingProjectList.pm")
	public String ongoingProjectList() {
		return "projectManage/ongoingProjectList";
	}
	
	@RequestMapping("finishProjectList.pm")
	public String finishProjectList() {
		return "projectManage/finishProjectList";
	}
	
	@RequestMapping("insertProjectForm.pm")
	public String showInsertProjectForm() {
		return "projectManage/insertProjectForm";
	}
	
	@RequestMapping("projectInfo.pm")
	public String showProjectInfo() {
		return "projectManage/projectDetail";
	}
	
	@RequestMapping("projectNotice.pm")
	public String showProjectNotice() {
		return "projectManage/projectNoticeList";
	}
	
	@RequestMapping("projectDetail.pm")
	public String showProjectDetail() {
		return "projectManage/projectDetail";
	}

}