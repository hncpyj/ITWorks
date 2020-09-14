package com.kh.itworks.atManagement.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.itworks.atManagement.model.exception.DeleteUpdateInsertException;
import com.kh.itworks.atManagement.model.exception.InsertWorkInfoException;
import com.kh.itworks.atManagement.model.exception.SelectATManagementFailedException;
import com.kh.itworks.atManagement.model.exception.SelectCorrenctionListException;
import com.kh.itworks.atManagement.model.exception.SelectLeaveException;
import com.kh.itworks.atManagement.model.exception.SelectOvertimeListException;
import com.kh.itworks.atManagement.model.exception.SelectVacationException;
import com.kh.itworks.atManagement.model.exception.SelectWorkTimeListException;
import com.kh.itworks.atManagement.model.exception.UpdateInsertLeaveException;
import com.kh.itworks.atManagement.model.vo.ATManagement;
import com.kh.itworks.atManagement.model.vo.PageInfo;
import com.kh.itworks.atManagement.model.vo.SearchCondition;

public interface ATManagementService {

	ATManagement selectAtBt(ATManagement at) throws SelectATManagementFailedException ;

	ArrayList<ATManagement> selectWorkingStatus(ATManagement at) throws SelectATManagementFailedException ;

	ArrayList<ATManagement> selectWorkTimeSet(ATManagement at) throws SelectATManagementFailedException ;

	int deleteWorkingStatus(String string) throws DeleteUpdateInsertException;

	int deleteWorkTimeSet(String string) throws DeleteUpdateInsertException;

	int updateWorkingStatus(ArrayList<ATManagement> worklist) throws DeleteUpdateInsertException;

	int updateWorkTimeSet(ArrayList<ATManagement> workTimelist) throws DeleteUpdateInsertException;

	int updateAttendence(ATManagement at) throws DeleteUpdateInsertException;

	int insertWorkTimeSet(ArrayList<ATManagement> insertWTlist) throws DeleteUpdateInsertException;

	int insertWorkingStatus(ArrayList<ATManagement> insertWSlist) throws DeleteUpdateInsertException;

	int updateBreaktime(ATManagement at) throws DeleteUpdateInsertException;

	ArrayList<ATManagement> selectMyWorkTime(ATManagement at) throws SelectWorkTimeListException;

	int insertWorkInfo(ATManagement at) throws InsertWorkInfoException;

	ArrayList<ATManagement> selectCorrectionList(ATManagement at, PageInfo pi) throws SelectCorrenctionListException;

	int getCorrentionListCount(ATManagement at) throws SelectCorrenctionListException;

	ATManagement selectAtDetail(int objNo) throws SelectCorrenctionListException;

	int getOvertimeListCount(ATManagement at) throws SelectOvertimeListException;

	ArrayList<ATManagement> selectOvertimeList(ATManagement at, PageInfo pi) throws SelectOvertimeListException;

	ATManagement selectOvertimeDetail(int otNo) throws SelectOvertimeListException;

	ArrayList<ATManagement> selectDateEmpWork(ATManagement date);

	ArrayList<ATManagement> selectEmployeeATManagement(ATManagement at);

	ATManagement selectLeaveSetting(ATManagement at) throws SelectLeaveException;

	ArrayList<ATManagement> selectYearAleave(ATManagement at) throws SelectLeaveException;

	ArrayList<ATManagement> selectLeave(ATManagement at) throws SelectLeaveException;

	int updateLeaveList(ArrayList<ATManagement> updateLeave) throws UpdateInsertLeaveException;

	int updateYearAleave(ArrayList<ATManagement> updateAleave) throws UpdateInsertLeaveException;

	int updateLeaveSetting(ATManagement at) throws UpdateInsertLeaveException;

	int insertLeaveList(ArrayList<ATManagement> insertLeave) throws UpdateInsertLeaveException;

	ArrayList<ATManagement> selectVacationStatus(ATManagement at, PageInfo pi) throws SelectVacationException;

	String selectVacationEmployee(ATManagement at) throws SelectVacationException;

	int selectAleaveCount(int hireyear) throws SelectVacationException;

	int selectRewardCount(int mno) throws SelectVacationException;

	int getVacationListCount(ATManagement at);

	ATManagement selectVacationDetail(String lInfoNo)throws SelectVacationException;

	int getAdminVacationListCount(ATManagement at);

	ArrayList<ATManagement> selectVacationList(ATManagement at, PageInfo pi) throws SelectVacationException;

	int updateVacationApproval(String lInfoNo) throws SelectVacationException;

	ArrayList<ATManagement> selectEmp(int corpNo) throws SelectVacationException;

	ArrayList<ATManagement> selectVacationDate(ATManagement at) throws SelectVacationException;

	List<Map<String, Object>> selectLateCount(ATManagement at);

	ArrayList<ATManagement> selectSearchEmployee(SearchCondition sc);

	ATManagement selectWorkInfo(ATManagement at);

	int insertObj(ATManagement at);

	int insertVacation(ATManagement at);




}
