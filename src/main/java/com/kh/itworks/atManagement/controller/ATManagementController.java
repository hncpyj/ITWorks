package com.kh.itworks.atManagement.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.itworks.atManagement.model.exception.DeleteUpdateInsertException;
import com.kh.itworks.atManagement.model.exception.InsertWorkInfoException;
import com.kh.itworks.atManagement.model.exception.SelectATManagementFailedException;
import com.kh.itworks.atManagement.model.exception.SelectCorrenctionListException;
import com.kh.itworks.atManagement.model.exception.SelectOvertimeListException;
import com.kh.itworks.atManagement.model.exception.SelectWorkTimeListException;
import com.kh.itworks.atManagement.model.service.ATManagementService;
import com.kh.itworks.atManagement.model.vo.ATManagement;
import com.kh.itworks.atManagement.model.vo.PageInfo;
import com.kh.itworks.atManagement.model.vo.Pagination;



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
	@ResponseBody
	@RequestMapping("selectAtStatus.at")
	public ModelAndView selectAtStatus(ModelAndView mv, ATManagement at, HttpServletRequest request) throws UnknownHostException {

		//ip주소 가져오기
		InetAddress ia = InetAddress.getLocalHost();
		
		String ip = ia.getHostAddress();
		
		//임시번호
		int corpNo = 1;
		String mno = "6";
		at.setCorpNo(corpNo);
		at.setMno(mno);
		
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
			 
//			  Map<String, Object> retVal = new HashMap<String, Object>();
//			  retVal.put("workTimeList", workTimeList);
//			  retVal.put("myTime", myTime);
//			  mv.addAllObjects(retVal);
			 
			//mv.addObject("workTimeList", workTimeList);
			//mv.addObject("myTime", myTime);
			//mv.addObject("ip", ip);
//			mv.setViewName("jsonView");
			mv.setViewName("atManagement/atStatus");
		} catch (SelectATManagementFailedException | SelectWorkTimeListException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	@RequestMapping("insertAtStatus.at")
	public String insertATManagement(ATManagement at, HttpServletRequest request) throws UnknownHostException {
		
		System.out.println("insert : " + at);
		if(at.getOutsideWork() != null) {
			at.setOutsideWork("Y");
		} else {
			at.setOutsideWork("N");
		}
		
		try {
			as.insertWorkInfo(at);
			
			return "redirect:selectAtStatus.at";
		} catch (InsertWorkInfoException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
		
		
		//return "atManagement/atStatus";
	}
	
	@RequestMapping("selectCorrectionList.at")
	public ModelAndView selectCorrentionList(ModelAndView mv, ATManagement at, HttpServletRequest request) {
		
		at.setCorpNo(1);
		at.setMno("6");
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			
			int listCount = as.getCorrentionListCount(at);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<ATManagement> objection = as.selectCorrectionList(at, pi);
			System.out.println("objection : " + objection);
			mv.addObject("objection", objection);
			mv.addObject("pi", pi);
			mv.setViewName("atManagement/selectCorrectionList");
			
		} catch (SelectCorrenctionListException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("selectATDetail.at")
	public ModelAndView selectATDetail(ModelAndView mv, ATManagement at, HttpServletRequest request) {
		
		int objNo = Integer.parseInt(request.getParameter("no"));
		
		try {
			ATManagement atDetail =as.selectAtDetail(objNo);
			
			System.out.println("atDetail : " + atDetail);
			
			mv.addObject("atDetail" , atDetail);
			mv.setViewName("atManagement/selectATDetail");
			
		} catch (SelectCorrenctionListException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("selectOvertimeList.at")
	public ModelAndView selectOvertimeList(ModelAndView mv, ATManagement at, HttpServletRequest request) {
		
		at.setCorpNo(1);
		at.setMno("6");
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			
			int listCount = as.getOvertimeListCount(at);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<ATManagement> overTime = as.selectOvertimeList(at, pi);
			System.out.println("overTime : " + overTime);
			mv.addObject("overTime", overTime);
			mv.addObject("pi", pi);
			mv.setViewName("atManagement/selectOvertimeList");
			
		} catch (SelectOvertimeListException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		

	}
	
	@RequestMapping("selectOvertimeDetail.at")
	public ModelAndView selectOvertimeDetail(ModelAndView mv, ATManagement at, HttpServletRequest request) {
		
		int otNo = Integer.parseInt(request.getParameter("no"));
		
		try {
			ATManagement overtimeOne = as.selectOvertimeDetail(otNo);
			
			mv.addObject("overtime", overtimeOne);
			mv.setViewName("atManagement/selectOvertimeDetail");
		} catch (SelectOvertimeListException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("employeeWorkManagement.at")
	public ModelAndView employeeWorkManagement(ModelAndView mv, ATManagement at) {
		Calendar c = Calendar.getInstance();
 		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yy/MM/dd");
 		c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
 		String mon = formatter.format(c.getTime());
 		c.set(Calendar.DAY_OF_WEEK,Calendar.TUESDAY);
 		String tue = formatter.format(c.getTime());
 		c.set(Calendar.DAY_OF_WEEK,Calendar.WEDNESDAY);
 		String wed = formatter.format(c.getTime());
 		c.set(Calendar.DAY_OF_WEEK,Calendar.THURSDAY);
 		String thu = formatter.format(c.getTime());
 		c.set(Calendar.DAY_OF_WEEK,Calendar.FRIDAY);
 		String fri = formatter.format(c.getTime());
 		c.set(Calendar.DAY_OF_WEEK,Calendar.SATURDAY);
 		String sat = formatter.format(c.getTime());
 		c.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
 		c.add(c.DATE,7);
 		String sun = formatter.format(c.getTime());
 		
 		String[] dayArr = {mon, tue, wed, thu, fri, sat, sun};
 		ATManagement day = null;
		ArrayList<ATManagement> date = new ArrayList<ATManagement>();
		for(int i = 0 ; i < dayArr.length; i++) {
			day = new ATManagement();
			System.out.println("dayArr : "+dayArr[i]);
			day.setWdate(dayArr[i]);
			day.setCorpNo(1);
			
			date.add(day);
		}
		System.out.println(date);
		ArrayList<ATManagement> empworklist = new ArrayList<ATManagement>();
		ArrayList<ATManagement> empWork = new ArrayList<ATManagement>();
		ATManagement empwork = null;
		for(int i = 0 ; i < dayArr.length; i++) {
			System.out.println("date : " + date.get(i));
			empWork = as.selectDateEmpWork(date.get(i));
			
			
			for(int j = 0; j < empWork.size(); j++) {
				System.out.println("뭔데");
				empwork = new ATManagement();
				empwork = empWork.get(j);
				System.out.println("empwork : " + empwork);
				empworklist.add(empwork);
				
			}
			
			
		}
		
		System.out.println("empworklist : " + empworklist);
		mv.addObject("empworklist", empworklist);
		mv.setViewName("atManagement/employeeWorkManagement");
		
		return mv;
	}
	
	@RequestMapping("selectDateEmpWork.at")
	public ModelAndView selectDateEmpWork(ModelAndView mv, ATManagement at, HttpServletRequest request) {
		
		String mon = request.getParameter("mon");
		String tue = request.getParameter("tue");
		String wed = request.getParameter("wed");
		String thu = request.getParameter("thu");
		String fri = request.getParameter("fri");
		String sat = request.getParameter("sat");
		String sun = request.getParameter("sun");
		String[] dayArr = {mon, tue, wed, thu, fri, sat, sun};
		ATManagement day = null;
		ArrayList<ATManagement> date = new ArrayList<ATManagement>();
		for(int i = 0 ; i < dayArr.length; i++) {
			day = new ATManagement();
			System.out.println("dayArr : "+dayArr[i]);
			day.setWdate(dayArr[i]);
			day.setCorpNo(1);
			
			date.add(day);
		}
		System.out.println(date);
		ArrayList<ATManagement> empWorklist = new ArrayList<ATManagement>();
		ArrayList<ATManagement> empWork = new ArrayList<ATManagement>();
		ATManagement empwork = null;
		for(int i = 0 ; i < dayArr.length; i++) {
			System.out.println("date : " + date.get(i));
			empWork = as.selectDateEmpWork(date.get(i));
			
			
			for(int j = 0; j < empWork.size(); j++) {
				System.out.println("뭔데");
				empwork = new ATManagement();
				empwork = empWork.get(j);
				System.out.println("empwork : " + empwork);
				empWorklist.add(empwork);
				
			}
			
			
		}
		
		System.out.println("enpWorklist : " + empWorklist);
		mv.addObject("empWorklist", empWorklist);
		mv.setViewName("jsonView");
		
		return mv;
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

	
}
