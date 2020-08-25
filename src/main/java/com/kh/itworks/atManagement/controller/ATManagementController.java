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
	@RequestMapping("insertVacation.at")
	public String insertVacation() {
		
		return "atManagement/insertVacation";
	}
	@RequestMapping("insertObjectionForm.at")
	public String insertObjectionForm() {
		
		return "atManagement/insertObjectionForm";
	}
	@RequestMapping("insertCorrectionForm.at")
	public String insertCorrectionForm() {
		
		return "atManagement/insertCorrectionForm";
	}
	@RequestMapping("selectTakeTimeOffList.at")
	public String selectTakeTimeOffList() {
		
		return "atManagement/takeTimeOffList";
	}
	@RequestMapping("selectEmployeeATManagement.at")
	public String selectEmployeeATManagement() {
		
		return "atManagement/employeeATManagement";
	}
	@RequestMapping("updateEmpAt.at")
	public String updateEmpAt() {
		
		return "atManagement/updateEmpAt";
	}
	@RequestMapping("employeeWorkManagement.at")
	public String employeeWorkManagement() {
		
		return "atManagement/employeeWorkManagement";
	}
	@RequestMapping("vacationManagement.at")
	public String vacationManagement() {
		
		return "atManagement/vacationManagement";
	}
	@RequestMapping("employeeVacation.at")
	public String employeeVacation() {
		
		return "atManagement/employeeVacation";
	}
	@RequestMapping("selectVacationList.at")
	public String selectVacationList() {
		
		return "atManagement/vacationList";
	}
	@RequestMapping("insertRewardVacation.at")
	public String insertRewardVacation() {
		
		return "atManagement/insertRewardVacation";
	}
	@RequestMapping("selectATDetail.at")
	public String selectATDetail() {
		
		return "atManagement/selectATDetail";
	}
	@RequestMapping("selectOvertimeDetail.at")
	public String selectOvertimeDetail() {
		
		return "atManagement/selectOvertimeDetail";
	}
}
