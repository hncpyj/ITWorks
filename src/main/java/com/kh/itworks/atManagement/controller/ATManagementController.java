package com.kh.itworks.atManagement.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
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
import com.kh.itworks.atManagement.model.exception.SelectWorkTimeListException;
import com.kh.itworks.atManagement.model.service.ATManagementService;
import com.kh.itworks.atManagement.model.vo.ATManagement;

@Controller
public class ATManagementController {
	
	@Autowired
	private ATManagementService as;
	
	@RequestMapping("selectATManagement.at")
	public ModelAndView selectATManagement(ATManagement at, ModelAndView mv, HttpSession session) {
			
		//임시값로그인연결하면바꾸기!!!!!
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
		//update workTimeSet
				String[] workingSetNo = request.getParameterValues("workingSetNo");
				String[] workingTime = at.getWorkingTime().split(",");
				String[] quittingTime = at.getQuittingTime().split(",");
				String[] harfOff = at.getHarfOff().split(",");
				
				ATManagement workTime = null;
				
				ArrayList<ATManagement> workTimelist = new ArrayList<ATManagement>();
				
				for(int i = 0; i < workingSetNo.length; i++) {
					workTime = new ATManagement();
					workTime.setWorkingSetNo(Integer.parseInt(workingSetNo[i]));
					workTime.setWorkingTime(workingTime[i]);
					workTime.setQuittingTime(quittingTime[i]);
					workTime.setHarfOff(harfOff[i]);
					workTime.setCorpNo(at.getCorpNo());
					workTimelist.add(workTime);
				}
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
	try {
			int dws = 0;
			int dwts = 0;
			//근무종류삭제
			if(dwNo != null) {
				for(int i = 0; i < dwNo.length; i++) {
					dws += as.deleteWorkingStatus(dwNo[i]);
				}
				
			}
			//근태시간삭제
			if(dtNo != null) {
				for(int i = 0; i < dtNo.length; i++) {
					dwts += as.deleteWorkTimeSet(dtNo[i]);
				}
				
			}
			//업데이트
			int uws = as.updateWorkingStatus(worklist);
			int uwt = as.updateWorkTimeSet(workTimelist);
			int uat = as.updateAttendence(at);
			int ubt = as.updateBreaktime(at);

			
			if(insertWTlist.size() != 0) {
				int insertwt = as.insertWorkTimeSet(insertWTlist);

			}
			if(insertWSlist.size() != 0) {
				int insertws = as.insertWorkingStatus(insertWSlist);

			}
			
			return "redirect:selectATManagement.at";
	
		} catch (DeleteUpdateInsertException e) {
			request.setAttribute("msg", e.getMessage());
		
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("selectAtStatus.at")
	public ModelAndView selectAtStatus(ModelAndView mv, ATManagement at, HttpServletRequest request) throws UnknownHostException {

		//ip주소 가져오기
		InetAddress ia = InetAddress.getLocalHost();
		
		String ip = ia.getHostAddress();
		System.out.println("ip : " + ip);
		//임시번호
		at.setCorpNo(1);
		at.setMno("6");
		
		try {
			//회사 출퇴근 정보 조회
			ArrayList<ATManagement> workTimeList = as.selectWorkTimeSet(at);
			
			ArrayList<ATManagement> myTime = as.selectMyWorkTime(at);
			
			for(int i = 0; i < workTimeList.size(); i++) {
				System.out.println("workTimeList : " + workTimeList.get(i));
			}
			for(int i = 0; i < myTime.size(); i++) {
				System.out.println("myTime : " + myTime.get(i));
			}
			request.setAttribute("workTimeList", workTimeList);
			request.setAttribute("myTime", myTime);
			request.setAttribute("ip", ip);
			
			mv.setViewName("atManagement/atStatus");
		} catch (SelectATManagementFailedException | SelectWorkTimeListException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		
		
		
		
		return mv;
	}
	@RequestMapping("insertAtStatus.at")
	public String insertATManagement(ModelAndView mv, ATManagement at, HttpServletRequest request) throws UnknownHostException {
		
//		InetAddress ia = InetAddress.getLocalHost();
//		
//		String ip = ia.getHostAddress();
		
		
		
		return "atManagement/atStatus";
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
