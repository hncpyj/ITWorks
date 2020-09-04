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
		if(dwNo != null) {
		for(int i = 0; i <dwNo.length; i++) {
			System.out.println(dwNo[i]);
		}
		}
		
		//delete workTimeSet
		String[] dtNo = request.getParameterValues("deleteWorkTimeSetNo");
		if(dtNo != null) {
		for(int i = 0; i <dtNo.length; i++) {
			System.out.println(dtNo[i]);
		}
		}
		//update workingStatus
				String[] workingStatusNo = at.getWorkingStatusNo().split(",");
				String[] workType = at.getWorkType().split(",");
				String[] work = at.getWork().split(",");
				String[] updatework = request.getParameterValues("updatework");
				String[] updateworkType = request.getParameterValues("updateworkType");
				String[] updateWorkingStatusNo = request.getParameterValues("updateWorkingStatusNo");
				ATManagement workAt = null;
				System.out.println("updateworkType : " + updateworkType[0]);
				ArrayList<ATManagement> worklist = new ArrayList<ATManagement>();
				
				for(int i = 0; i < workingStatusNo.length; i++) {
					workAt = new ATManagement();
					workAt.setWorkingStatusNo(workingStatusNo[i]);
					workAt.setWorkType(workType[i]);
					workAt.setWork(work[i]);
					workAt.setCorpNo(at.getCorpNo());
					
					 
					worklist.add(workAt);
				}
				if( updatework != null) { 
					for(int i = 0 ; i < updatework.length; i++) {
						workAt = new ATManagement();
						workAt.setWorkingStatusNo(updateWorkingStatusNo[i]);
						workAt.setWorkType(updateworkType[i]);
						workAt.setWork(updatework[i]);
						workAt.setCorpNo(at.getCorpNo());
						 
						worklist.add(workAt);
					}
					
				}
				System.out.println("worklist : " + worklist);
		//update workTimeSet
				String[] workingSetNo = request.getParameterValues("workingSetNo");
				String[] workingTime = at.getWorkingTime().split(",");
				String[] quittingTime = at.getQuittingTime().split(",");
				String[] harfOff = at.getHarfOff().split(",");
				
				System.out.println("workingSetNo[0] : " + workingSetNo[0]);
				System.out.println("workingTime[0] : " + workingTime[0]);
				System.out.println("quittingTime[0] : " + quittingTime[0]);
				System.out.println("harfOff[0] : " + harfOff[0]);
				
				ATManagement workTime = null;
				
				ArrayList<ATManagement> workTimelist = new ArrayList<ATManagement>();
				
				for(int i = 0; i < workingSetNo.length; i++) {
					workTime = new ATManagement();
					workTime.setWorkingSetNo(Integer.parseInt(workingSetNo[i]));
					workTime.setWorkingTime(workingTime[i]);
					workTime.setQuittingTime(quittingTime[i]);
					workTime.setHarfOff(harfOff[i]);
					workTime.setCorpNo(at.getCorpNo());
					System.out.println("workTime : " + workTime);
					workTimelist.add(workTime);
				}
				System.out.println("workTimelist : " + workTimelist);
				//update attendence
				if(at.getLaborDay() == null) {
					at.setLaborDay("N");
				}
				if(at.getHolidays() == null) {
					at.setHolidays("N");
				}
				if(at.getAlternativeHolidays() == null) {
					at.setAlternativeHolidays("N");
				}
				
				
				//insert workTimeSet
				String[] insertWorkingTime = request.getParameterValues("insertWorkingTime");
				String[] insertQuittingTime = request.getParameterValues("insertQuittingTime");
				String[] insertHarfOff = request.getParameterValues("insertHarfOff");
				String[] insertWorkingSetTime = request.getParameterValues("insertWorkingSetTime");
				String[] insertDayOfTheWeek = request.getParameterValues("insertDayOfTheWeek");
				
				ATManagement insertWT = null;
				
				ArrayList<ATManagement> insertWTlist = new ArrayList<ATManagement>();
				if(insertWorkingTime !=null) {
					for(int i = 0; i < insertWorkingTime.length; i++) {
						insertWT = new ATManagement();
						insertWT.setWorkingTime(insertWorkingTime[i]);
						insertWT.setQuittingTime(insertQuittingTime[i]);
						insertWT.setHarfOff(insertHarfOff[i]);
						insertWT.setWorkingSetTime(insertWorkingSetTime[i]);
						insertWT.setDayOfTheWeek(insertDayOfTheWeek[i]);
						insertWT.setCorpNo(at.getCorpNo());
						
						insertWTlist.add(insertWT);
					}
				}	
					System.out.println("insertWTlist : " + insertWTlist);
					//insertWorkingStatus
					String[] insertWorkType = request.getParameterValues("insertWorkType");
					String[] insertWork = request.getParameterValues("insertWork");
					ATManagement insertWS = null;
					
					ArrayList<ATManagement> insertWSlist = new ArrayList<ATManagement>();
					if(insertWorkType != null) {
						for(int i = 0; i < insertWorkType.length; i++) {
							insertWS = new ATManagement();
							insertWS.setWorkType(insertWorkType[i]);
							insertWS.setWork(insertWork[i]);
							insertWS.setCorpNo(at.getCorpNo());
							
							
							insertWSlist.add(insertWS);
						}
					}	
						System.out.println("insertWSlist : " + insertWSlist);
	try {
			int dws = 0;
			int dwts = 0;
			if(dwNo != null) {
				for(int i = 0; i < dwNo.length; i++) {
					dws += as.deleteWorkingStatus(dwNo[i]);
					System.out.println("dws[i] : " + dws);
				}
				
			}
			if(dtNo != null) {
				for(int i = 0; i < dtNo.length; i++) {
					dwts += as.deleteWorkTimeSet(dtNo[i]);
					System.out.println("dwts[i] : " + dwts);
				}
				
			}
			int uws = as.updateWorkingStatus(worklist);
			int uwt = as.updateWorkTimeSet(workTimelist);
			int uat = as.updateAttendence(at);
			int ubt = as.updateBreaktime(at);
			System.out.println("uws : " + uws);
			System.out.println("uwt : " + uwt);
			System.out.println("uat : " + uat);
			System.out.println("UBT : " + ubt);
			
			if(insertWTlist.size() != 0) {
				int insertwt = as.insertWorkTimeSet(insertWTlist);
				System.out.println("insertwt : " + insertwt);
			}
			if(insertWSlist.size() != 0) {
				int insertws = as.insertWorkingStatus(insertWSlist);
				System.out.println("insertws : " + insertws);
			}
			
			return "redirect:selectATManagement.at";
	
		} catch (DeleteUpdateInsertException e) {
			request.setAttribute("msg", e.getMessage());
		
			return "common/errorPage";
		}
		
		
		
		
		
		
		
		//return "";
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
