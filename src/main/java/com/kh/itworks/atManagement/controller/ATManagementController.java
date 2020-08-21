package com.kh.itworks.atManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ATManagementController {
	@RequestMapping("selectATManagement.at")
	public String selectATManagement() {
		
		return "atManagement/atStatus";
	}
	@RequestMapping("insertATManagement.at")
	public String insertATManagement() {
		
		return "atManagement/atManagement";
	}
	@RequestMapping("selectCorrectionList.at")
	public String selectCorrentionList() {
		
		return "atManagement/selectCorrectionList";
	}
	@RequestMapping("selectOvertimeList.at")
	public String selectOvertimeList() {
		
		return "atManagement/selectOvertimeList";
	}
	@RequestMapping("selectVacationStatus.at")
	public String selectVacationStatus() {
		
		return "atManagement/vacationStatus";
	}
}
