package com.kh.itworks.atManagement.controller;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.itworks.atManagement.model.exception.DeleteUpdateInsertException;
import com.kh.itworks.atManagement.model.exception.SelectATManagementFailedException;
import com.kh.itworks.atManagement.model.service.ATManagementService;
import com.kh.itworks.atManagement.model.vo.ATManagement;

@Controller
public class ATManagementController {
	
	@Autowired
	private ATManagementService as;
	
	@RequestMapping("selectATManagement.at")
	public ModelAndView selectATManagement(ATManagement at, ModelAndView mv, HttpSession session) {
			at.setCorpNo(1);
		
			ATManagement atbt;
			try {
				atbt = as.selectAtBt(at);
				ArrayList<ATManagement> workingStatus = as.selectWorkingStatus(at);
				ArrayList<ATManagement> workTimeSet = as.selectWorkTimeSet(at);
				
				session.setAttribute("atbt", atbt);
				session.setAttribute("workTimeSet", workTimeSet);
				session.setAttribute("workingStatus", workingStatus);
				
				mv.setViewName("atManagement/atManagement");
			} catch (SelectATManagementFailedException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
				
			}
			
		return mv;
	}
	
	@RequestMapping("updateInsert.at")
	public String updateInsert(Model model, ATManagement at, HttpServletRequest request) {
		
		System.out.println(at);
		//dayOfTheWeek, workingStatusNo, workType, work(,로split해야할듯)
		
		//delete workingStatus
		String[] dwNo = request.getParameterValues("deleteWorkingStatusNo");
		
		//delete workTimeSet
		String[] dtNo = request.getParameterValues("deleteWorkTimeSetNo");
		
		//update workingStatus
				String[] workingStatusNo = at.getWorkingStatusNo().split(",");
				String[] workType = at.getWorkType().split(",");
				String[] work = at.getWork().split(",");
				
				ATManagement workAt = null;
				
				ArrayList<ATManagement> worklist = new ArrayList<ATManagement>();
				
				for(int i = 0; i < workingStatusNo.length; i++) {
					workAt = new ATManagement();
					workAt.setWorkingStatusNo(workingStatusNo[i]);
					workAt.setWorkType(workType[i]);
					workAt.setWork(work[i]);
					workAt.setCorpNo(at.getCorpNo());

					worklist.add(workAt);
				}	
		//update workTimeSet
				
		
	try {
			int[] dws = null;
			int[] dwts = null;
			for(int i = 0; i < dwNo.length; i++) {
				dws[i] = as.deleteWorkingStatus(dwNo[i]);
			}
			for(int i = 0; i < dtNo.length; i++) {
				dwts[i] = as.deleteWorkTimeSet(dtNo[i]);
			}
			int uws = as.updateWorkingStatus(worklist);
			
		} catch (DeleteUpdateInsertException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		return "";
	}
	
	@RequestMapping("selectAtStatus.at")
	public String selectAtStatus() {
		
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
