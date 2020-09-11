package com.kh.itworks.atManagement.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.atManagement.model.dao.ATManagementDao;
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

@Service
public class ATManagementServiceImpl implements ATManagementService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ATManagementDao ad;


	@Override
	public ATManagement selectAtBt(ATManagement at) throws SelectATManagementFailedException {

		return ad.selectAtBt(sqlSession, at);
	}


	@Override
	public ArrayList<ATManagement> selectWorkingStatus(ATManagement at) throws SelectATManagementFailedException {

		return ad.selectWorkingStatus(sqlSession, at);
	}


	@Override
	public ArrayList<ATManagement> selectWorkTimeSet(ATManagement at) throws SelectATManagementFailedException {

		return ad.selectWorkTimeSet(sqlSession, at);
	}


	@Override
	public int deleteWorkingStatus(String dwNo) throws DeleteUpdateInsertException {
		
		return ad.deleteWorkingStatus(sqlSession, dwNo);
	}


	@Override
	public int deleteWorkTimeSet(String dtNo) throws DeleteUpdateInsertException {

		return ad.deleteWorkTimeSet(sqlSession, dtNo);
	}


	@Override
	public int updateWorkingStatus(ArrayList<ATManagement> worklist) throws DeleteUpdateInsertException {

		return ad.updateWorkingStatus(sqlSession, worklist);
	}


	@Override
	public int updateWorkTimeSet(ArrayList<ATManagement> workTimelist) throws DeleteUpdateInsertException {

		return ad.updateWorkTimeSet(sqlSession, workTimelist);
	}


	@Override
	public int updateAttendence(ATManagement at) throws DeleteUpdateInsertException {

		return ad.updateAttendence(sqlSession, at);
	}


	@Override
	public int insertWorkTimeSet(ArrayList<ATManagement> insertWTlist) throws DeleteUpdateInsertException {
		
		return ad.insertWorkTimeSet(sqlSession, insertWTlist);
	}


	@Override
	public int insertWorkingStatus(ArrayList<ATManagement> insertWSlist) throws DeleteUpdateInsertException {

		return ad.insertWorkingStatus(sqlSession, insertWSlist);
	}


	@Override
	public int updateBreaktime(ATManagement at) throws DeleteUpdateInsertException {

		return ad.updateBreaktime(sqlSession, at);
	}


	@Override
	public ArrayList<ATManagement> selectMyWorkTime(ATManagement at) throws SelectWorkTimeListException {
		
		return ad.selectMyWorkTime(sqlSession, at);
	}


	@Override
	public int insertWorkInfo(ATManagement at) throws InsertWorkInfoException {

		return ad.insertWorkInfo(sqlSession, at);
	}


	@Override
	public ArrayList<ATManagement> selectCorrectionList(ATManagement at, PageInfo pi) throws SelectCorrenctionListException {
		
		return ad.selectCorrectionList(sqlSession, at, pi);
	}


	@Override
	public int getCorrentionListCount(ATManagement at) throws SelectCorrenctionListException {

		return ad.getCorrentionListCount(sqlSession, at);
	}


	@Override
	public ATManagement selectAtDetail(int objNo) throws SelectCorrenctionListException {

		return ad.selectAtDetail(sqlSession, objNo);
	}


	@Override
	public int getOvertimeListCount(ATManagement at) throws SelectOvertimeListException {

		return ad.getOvertimeListCount(sqlSession, at);
	}


	@Override
	public ArrayList<ATManagement> selectOvertimeList(ATManagement at, PageInfo pi) throws SelectOvertimeListException {

		return ad.selectOvertimeList(sqlSession, at, pi);
	}


	@Override
	public ATManagement selectOvertimeDetail(int otNo) throws SelectOvertimeListException {

		return ad.selectOvertimeDetail(sqlSession, otNo);
	}


	@Override
	public ArrayList<ATManagement> selectDateEmpWork(ATManagement date) {

		return ad.selectDateEmpWork(sqlSession, date);
	}


	@Override
	public ArrayList<ATManagement> selectEmployeeATManagement(ATManagement at) {

		return ad.selectEmployeeATManagement(sqlSession, at);
	}


	@Override
	public ATManagement selectLeaveSetting(ATManagement at) throws SelectLeaveException {

		
		return ad.selectLeaveSetting(sqlSession, at);
	}


	@Override
	public ArrayList<ATManagement> selectYearAleave(ATManagement at) throws SelectLeaveException {

		return ad.selectYearAleave(sqlSession, at);
	}


	@Override
	public ArrayList<ATManagement> selectLeave(ATManagement at) throws SelectLeaveException {

		return ad.selectLeave(sqlSession, at);
	}


	@Override
	public int updateLeaveList(ArrayList<ATManagement> updateLeave) throws UpdateInsertLeaveException {

		return ad.updateLeaveList(sqlSession, updateLeave);
	}


	@Override
	public int updateYearAleave(ArrayList<ATManagement> updateAleave) throws UpdateInsertLeaveException {

		return ad.updateYearAleave(sqlSession, updateAleave);
	}


	@Override
	public int updateLeaveSetting(ATManagement at) throws UpdateInsertLeaveException {

		return ad.updateLeaveSettion(sqlSession, at);
	}


	@Override
	public int insertLeaveList(ArrayList<ATManagement> insertLeave) throws UpdateInsertLeaveException {

		return ad.insertLeaveList(sqlSession, insertLeave);
	}


	@Override
	public ArrayList<ATManagement> selectVacationStatus(ATManagement at, PageInfo pi) throws SelectVacationException {

		return ad.selectVacationStatus(sqlSession, at, pi);
	}


	@Override
	public String selectVacationEmployee(ATManagement at) throws SelectVacationException {

		return ad.selectVacationEmployee(sqlSession, at);
	}


	@Override
	public int selectAleaveCount(int hireyear) throws SelectVacationException {
		
		return ad.selectAleaveCount(sqlSession, hireyear);
	}
	
	
	@Override
	public int selectRewardCount(int mno) throws SelectVacationException {
		
		return ad.selectRewardCount(sqlSession, mno);
	}


	@Override
	public int getVacationListCount(ATManagement at) {
		
		return ad.getVacationListCount(sqlSession, at);
	}


	@Override
	public ATManagement selectVacationDetail(String lInfoNo) throws SelectVacationException {

		return ad.selectVacationDetail(sqlSession, lInfoNo);
	}


	@Override
	public int getAdminVacationListCount(ATManagement at) {

		return ad.getAdminVacationListCount(sqlSession, at);
	}


	@Override
	public ArrayList<ATManagement> selectVacationList(ATManagement at, PageInfo pi) throws SelectVacationException {
		
		return ad.selectVacationList(sqlSession, at, pi);
	}


	@Override
	public int updateVacationApproval(String lInfoNo) throws SelectVacationException {

		return ad.updateVacationApproval(sqlSession, lInfoNo);
	}


	@Override
	public ArrayList<ATManagement> selectEmp(int corpNo) throws SelectVacationException {

		return ad.selectEmp(sqlSession, corpNo);
	}


	@Override
	public ArrayList<ATManagement> selectVacationDate(ATManagement at) throws SelectVacationException {

		return ad.selectVacationDate(sqlSession, at);
	}


	

}
