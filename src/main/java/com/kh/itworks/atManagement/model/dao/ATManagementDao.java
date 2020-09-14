package com.kh.itworks.atManagement.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

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

public interface ATManagementDao {

	ATManagement selectAtBt(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException ;

	ArrayList<ATManagement> selectWorkingStatus(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException ;

	ArrayList<ATManagement> selectWorkTimeSet(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException ;

	int deleteWorkingStatus(SqlSessionTemplate sqlSession, String dwNo) throws DeleteUpdateInsertException ;

	int deleteWorkTimeSet(SqlSessionTemplate sqlSession, String dtNo) throws DeleteUpdateInsertException;

	int updateWorkingStatus(SqlSessionTemplate sqlSession, ArrayList<ATManagement> worklist) throws DeleteUpdateInsertException;

	int updateWorkTimeSet(SqlSessionTemplate sqlSession, ArrayList<ATManagement> workTimelist) throws DeleteUpdateInsertException;

	int updateAttendence(SqlSessionTemplate sqlSession, ATManagement at) throws DeleteUpdateInsertException;

	int insertWorkTimeSet(SqlSessionTemplate sqlSession, ArrayList<ATManagement> insertWTlist) throws DeleteUpdateInsertException;

	int insertWorkingStatus(SqlSessionTemplate sqlSession, ArrayList<ATManagement> insertWSlist) throws DeleteUpdateInsertException;

	int updateBreaktime(SqlSessionTemplate sqlSession, ATManagement at) throws DeleteUpdateInsertException;

	ArrayList<ATManagement> selectMyWorkTime(SqlSessionTemplate sqlSession, ATManagement at) throws SelectWorkTimeListException;

	int insertWorkInfo(SqlSessionTemplate sqlSession, ATManagement at) throws InsertWorkInfoException;

	ArrayList<ATManagement> selectCorrectionList(SqlSessionTemplate sqlSession, ATManagement at, PageInfo pi) throws SelectCorrenctionListException;

	int getCorrentionListCount(SqlSessionTemplate sqlSession, ATManagement at) throws SelectCorrenctionListException;

	ATManagement selectAtDetail(SqlSessionTemplate sqlSession, int objNo) throws SelectCorrenctionListException;

	int getOvertimeListCount(SqlSessionTemplate sqlSession, ATManagement at) throws SelectOvertimeListException;

	ArrayList<ATManagement> selectOvertimeList(SqlSessionTemplate sqlSession, ATManagement at, PageInfo pi) throws SelectOvertimeListException;

	ATManagement selectOvertimeDetail(SqlSessionTemplate sqlSession, int otNo) throws SelectOvertimeListException;

	ArrayList<ATManagement> selectDateEmpWork(SqlSessionTemplate sqlSession, ATManagement date);

	ArrayList<ATManagement> selectEmployeeATManagement(SqlSessionTemplate sqlSession, ATManagement at);

	ATManagement selectLeaveSetting(SqlSessionTemplate sqlSession, ATManagement at) throws SelectLeaveException;

	ArrayList<ATManagement> selectYearAleave(SqlSessionTemplate sqlSession, ATManagement at) throws SelectLeaveException;

	ArrayList<ATManagement> selectLeave(SqlSessionTemplate sqlSession, ATManagement at) throws SelectLeaveException;

	int updateLeaveList(SqlSessionTemplate sqlSession, ArrayList<ATManagement> updateLeave) throws UpdateInsertLeaveException;

	int updateYearAleave(SqlSessionTemplate sqlSession, ArrayList<ATManagement> updateAleave) throws UpdateInsertLeaveException;

	int updateLeaveSettion(SqlSessionTemplate sqlSession, ATManagement at) throws UpdateInsertLeaveException;

	int insertLeaveList(SqlSessionTemplate sqlSession, ArrayList<ATManagement> insertLeave) throws UpdateInsertLeaveException;

	ArrayList<ATManagement> selectVacationStatus(SqlSessionTemplate sqlSession, ATManagement at, PageInfo pi) throws SelectVacationException;

	String selectVacationEmployee(SqlSessionTemplate sqlSession, ATManagement at) throws SelectVacationException;

	int selectRewardCount(SqlSessionTemplate sqlSession, int mno) throws SelectVacationException;

	int selectAleaveCount(SqlSessionTemplate sqlSession, int hireyear) throws SelectVacationException;

	int getVacationListCount(SqlSessionTemplate sqlSession, ATManagement at);

	ATManagement selectVacationDetail(SqlSessionTemplate sqlSession, String lInfoNo)throws SelectVacationException;

	int getAdminVacationListCount(SqlSessionTemplate sqlSession, ATManagement at);

	ArrayList<ATManagement> selectVacationList(SqlSessionTemplate sqlSession, ATManagement at, PageInfo pi) throws SelectVacationException;

	int updateVacationApproval(SqlSessionTemplate sqlSession, String lInfoNo) throws SelectVacationException;

	ArrayList<ATManagement> selectEmp(SqlSessionTemplate sqlSession, int corpNo) throws SelectVacationException;

	ArrayList<ATManagement> selectVacationDate(SqlSessionTemplate sqlSession, ATManagement at) throws SelectVacationException;

	List<Map<String, Object>> selectLateCount(SqlSessionTemplate sqlSession, ATManagement at);

	ArrayList<ATManagement> selectSearchEmployee(SqlSessionTemplate sqlSession, SearchCondition sc);

	ATManagement selectWorkInfo(SqlSessionTemplate sqlSession, ATManagement at);

	int insertObj(SqlSessionTemplate sqlSession, ATManagement at);


	

}
