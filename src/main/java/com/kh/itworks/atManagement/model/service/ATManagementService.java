package com.kh.itworks.atManagement.model.service;

import java.util.ArrayList;

import com.kh.itworks.atManagement.model.exception.DeleteUpdateInsertException;
import com.kh.itworks.atManagement.model.exception.InsertWorkInfoException;
import com.kh.itworks.atManagement.model.exception.SelectATManagementFailedException;
import com.kh.itworks.atManagement.model.exception.SelectCorrenctionListException;
import com.kh.itworks.atManagement.model.exception.SelectOvertimeListException;
import com.kh.itworks.atManagement.model.exception.SelectWorkTimeListException;
import com.kh.itworks.atManagement.model.vo.ATManagement;
import com.kh.itworks.atManagement.model.vo.PageInfo;

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




}
