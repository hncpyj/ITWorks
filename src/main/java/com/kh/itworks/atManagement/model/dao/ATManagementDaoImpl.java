package com.kh.itworks.atManagement.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class ATManagementDaoImpl implements ATManagementDao {

	

	@Override
	public ATManagement selectAtBt(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException {

		ATManagement selectAtBt = sqlSession.selectOne("ATManagement.selectAtBt", at.getCorpNo());
		
		System.out.println("selectAtBt : " + selectAtBt);
		
		if(selectAtBt == null) {
			
			throw new SelectATManagementFailedException("근태 기본정보 조회 실패!");
		}
		
		return selectAtBt;
	}

	@Override
	public ArrayList<ATManagement> selectWorkingStatus(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException {

		ArrayList<ATManagement> selectWorkingStatus = (ArrayList)sqlSession.selectList("ATManagement.selectWorkingStatus", at.getCorpNo());
		
		System.out.println("selectWorkingStatus : " + selectWorkingStatus);
		
		if(selectWorkingStatus == null) {
			
			throw new SelectATManagementFailedException("근태 기본정보 조회 실패!");
		}
		
		return selectWorkingStatus;
	}

	@Override
	public ArrayList<ATManagement> selectWorkTimeSet(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException {

		ArrayList<ATManagement> selectWorkTimeSet = (ArrayList)sqlSession.selectList("ATManagement.selectWorkTimeSet", at.getCorpNo());
		
		System.out.println("selectWorkTimeSet : " + selectWorkTimeSet);
		
		if(selectWorkTimeSet == null) {
			
			throw new SelectATManagementFailedException("근태 기본정보 조회 실패!");
		}
		
		return selectWorkTimeSet;
	}

	@Override
	public int deleteWorkingStatus(SqlSessionTemplate sqlSession, String dwNo) throws DeleteUpdateInsertException {
		System.out.println("dwNoDAO : "+dwNo);
		int delWS = sqlSession.delete("ATManagement.deleteWorkingStatus", dwNo);
		System.out.println("delWS : " + delWS);
		if(delWS == 0) {
			
			throw new DeleteUpdateInsertException("근태 상태 삭제 실패");
		}
		
		return delWS;
	}

	@Override
	public int deleteWorkTimeSet(SqlSessionTemplate sqlSession, String dtNo) throws DeleteUpdateInsertException {
		System.out.println("dtNoDAO : "+dtNo);
		int delWTS = sqlSession.delete("ATManagement.deleteWorkTimeSet", dtNo);
		
		if(delWTS == 0) {
			
			throw new DeleteUpdateInsertException("근태 기본 시간 삭제 실패");
		}
		
		return delWTS;
	}

	@Override
	public int updateWorkingStatus(SqlSessionTemplate sqlSession, ArrayList<ATManagement> worklist) throws DeleteUpdateInsertException {
		int updateWS = 0;
		for(int i = 0; i < worklist.size(); i++) {
			updateWS += sqlSession.update("ATManagement.updateWorkingStatus", worklist.get(i));
			
		}
		int result = 0;
		if(updateWS == 0) {
			throw new DeleteUpdateInsertException("근태 상태 수정 실패");
		} else {
			result = 1;
		}
		
		return result;
	}

	@Override
	public int updateWorkTimeSet(SqlSessionTemplate sqlSession, ArrayList<ATManagement> workTimelist) throws DeleteUpdateInsertException {
		System.out.println("workTimelist : " + workTimelist.get(0));
		int updateWT = 0;
		for(int i = 0; i < workTimelist.size();i++) {
			updateWT += sqlSession.update("ATManagement.updateWorkTimeSet", workTimelist.get(i));
		}
		int result = 0;
		if(updateWT == 0) {
			throw new DeleteUpdateInsertException("근무 기본 시간 수정 실패");
		} else {
			result = 1;
		}
		
		return result;
	}

	@Override
	public int updateAttendence(SqlSessionTemplate sqlSession, ATManagement at) throws DeleteUpdateInsertException {
		
		int upAt = sqlSession.update("ATManagement.updateAttendence", at);
		
		if(upAt == 0) {
			throw new DeleteUpdateInsertException("근무 기본 정보 수정 실패");
		}
		
		return upAt;
	}

	@Override
	public int insertWorkTimeSet(SqlSessionTemplate sqlSession, ArrayList<ATManagement> insertWTlist) throws DeleteUpdateInsertException {
		
		int iwt = 0;
		for(int i = 0; i < insertWTlist.size();i++) {
		iwt += sqlSession.insert("ATManagement.insertWorkTimeSet", insertWTlist.get(i));
		}
		int result = 0;
		if(iwt == 0) {
			throw new DeleteUpdateInsertException("근무 시간 생성 실패");
		} else {
			result = 1;
		}
		return result;
	}

	@Override
	public int insertWorkingStatus(SqlSessionTemplate sqlSession, ArrayList<ATManagement> insertWSlist) throws DeleteUpdateInsertException {
		int iws = 0;
		for(int i = 0; i < insertWSlist.size();i++) {
			iws += sqlSession.insert("ATManagement.insertWorkingStatus", insertWSlist.get(i));
		}
		int result = 0;
		if(iws == 0) {
			throw new DeleteUpdateInsertException("근무 상태 생성 실패");
		} else {
			result = 1;
		}
		return result;
	}

	@Override
	public int updateBreaktime(SqlSessionTemplate sqlSession, ATManagement at) throws DeleteUpdateInsertException {

		int updateBreaktime = sqlSession.update("ATManagement.updateBreaktime", at);
		
		if(updateBreaktime == 0) {
			throw new DeleteUpdateInsertException("휴식 기본 정보 수정 실패");
		}
		
		return updateBreaktime;
	}

	@Override
	public ArrayList<ATManagement> selectMyWorkTime(SqlSessionTemplate sqlSession, ATManagement at) throws SelectWorkTimeListException {

		ArrayList<ATManagement> workList = (ArrayList)sqlSession.selectList("ATManagement.selectMyWorkTime", at);
		
		if(workList == null) {
			throw new SelectWorkTimeListException("근무 시간 정보 조회 실패");
		}
		
		return workList;
	}

	@Override
	public int insertWorkInfo(SqlSessionTemplate sqlSession, ATManagement at) throws InsertWorkInfoException {
		
		int workInfo = sqlSession.insert("ATManagement.insertWorkInfo", at);
		
		if(workInfo == 0) {
			throw new InsertWorkInfoException("출퇴근 정보 입력 실패");
		}
		
		return workInfo;
	}

	@Override
	public ArrayList<ATManagement> selectCorrectionList(SqlSessionTemplate sqlSession, ATManagement at, PageInfo pi) throws SelectCorrenctionListException {

		ArrayList<ATManagement> selectcl = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		selectcl = (ArrayList)sqlSession.selectList("ATManagement.selectCorrentionList", at, rowBounds);
		
		if(selectcl == null) {
			throw new SelectCorrenctionListException("근태 수정 내역 조회 실패");
		}
		
		return selectcl;
	}

	@Override
	public int getCorrentionListCount(SqlSessionTemplate sqlSession, ATManagement at) throws SelectCorrenctionListException {

		int count = sqlSession.selectOne("ATManagement.getCorrentionListCount", at);
		
		if(count == 0) {
			throw new SelectCorrenctionListException("근태 수정 내역 카운드 실패");
		}
		
		return count;
	}

	@Override
	public ATManagement selectAtDetail(SqlSessionTemplate sqlSession, int objNo) throws SelectCorrenctionListException {

		ATManagement atDetail = sqlSession.selectOne("ATManagement.selectAtDetail", objNo);
		
		if(atDetail == null) {
			throw new SelectCorrenctionListException("근태 수정 조회 실패");
		}
		
		return atDetail;
	}

	@Override
	public int getOvertimeListCount(SqlSessionTemplate sqlSession, ATManagement at) throws SelectOvertimeListException {

		int listCount = sqlSession.selectOne("ATManagement.selectOvertimeListCount", at.getMno());
		
		if(listCount == 0) {
			throw new SelectOvertimeListException("연장 근무 조회 실패");
		}
		
		return listCount;
	}

	@Override
	public ArrayList<ATManagement> selectOvertimeList(SqlSessionTemplate sqlSession, ATManagement at, PageInfo pi) throws SelectOvertimeListException {

		
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		
		ArrayList<ATManagement> overtimeList = (ArrayList)sqlSession.selectList("ATManagement.selectOvertimeList", at, rowBounds);
		
		if(overtimeList == null) {
			throw new SelectOvertimeListException("연장 근무 리스트 조회 실패");
		}
		
		return overtimeList;
	}

	@Override
	public ATManagement selectOvertimeDetail(SqlSessionTemplate sqlSession, int otNo) throws SelectOvertimeListException {

		ATManagement selectOvertimeOne = sqlSession.selectOne("ATManagement.selectOvertiemDetail", otNo);
		
		if(selectOvertimeOne == null) {
			throw new SelectOvertimeListException("연장 근무 상세 조회 실패");
		}
		
		return selectOvertimeOne;
	}


	@Override
	public ArrayList<ATManagement> selectDateEmpWork(SqlSessionTemplate sqlSession, ATManagement date) {
		
		ArrayList<ATManagement> empwork = (ArrayList)sqlSession.selectList("ATManagement.selectDateEmpWork", date);
		
		return empwork;
	}

	@Override
	public ArrayList<ATManagement> selectEmployeeATManagement(SqlSessionTemplate sqlSession, ATManagement at) {

		ArrayList<ATManagement> emplist = (ArrayList)sqlSession.selectList("ATManagement.empATManagement", at);
		
		
		return emplist;
	}

	@Override
	public ATManagement selectLeaveSetting(SqlSessionTemplate sqlSession, ATManagement at) throws SelectLeaveException {

		
		ATManagement leaveSetting = sqlSession.selectOne("ATManagement.selectLeaveSetting", at.getCorpNo());
		
		if(leaveSetting == null) {
			throw new SelectLeaveException("휴가 기능 사용 여부 조회 실패");
		}
		
		return leaveSetting;
	}

	@Override
	public ArrayList<ATManagement> selectYearAleave(SqlSessionTemplate sqlSession, ATManagement at) throws SelectLeaveException {

		ArrayList<ATManagement> yearAleave = (ArrayList)sqlSession.selectList("ATManagement.selectYearAleave", at);
		
		if(yearAleave == null) {
			throw new SelectLeaveException("휴가 근속 연수 연차 관리 조회 실패");
		}
		return yearAleave;
	}

	@Override
	public ArrayList<ATManagement> selectLeave(SqlSessionTemplate sqlSession, ATManagement at) throws SelectLeaveException {

		ArrayList<ATManagement> leave = (ArrayList)sqlSession.selectList("ATManagement.selectLeave", at);
		
		if(leave == null) {
			throw new SelectLeaveException("휴가 정보 관리 조회 실패");
		}
		
		return leave;

	}

	@Override
	public int updateLeaveList(SqlSessionTemplate sqlSession, ArrayList<ATManagement> updateLeave) throws UpdateInsertLeaveException {
		int result = 0;
		for(int i = 0; i < updateLeave.size(); i++) {
			result = sqlSession.update("ATManagement.updateLeaveList", updateLeave.get(i));
			
		}
		System.out.println("leave : " + result);
		if(result == 0) {
			throw new UpdateInsertLeaveException("휴가 정보 수정 실패");
		}
		return result;
	}

	@Override
	public int updateYearAleave(SqlSessionTemplate sqlSession, ArrayList<ATManagement> updateAleave) throws UpdateInsertLeaveException {
		int result = 0;
		for(int i = 0; i < updateAleave.size(); i++) {
			result = sqlSession.update("ATManagement.updateYearAleave", updateAleave.get(i));
			
		}
		System.out.println("year : " + result);
		if(result == 0) {
			throw new UpdateInsertLeaveException("년수 연차 수정 실패");
		}
		return result;
	}

	@Override
	public int updateLeaveSettion(SqlSessionTemplate sqlSession, ATManagement at) throws UpdateInsertLeaveException {

		int result = sqlSession.update("ATManagement.updateLeaveSettion", at);
		if(result == 0) {
			throw new UpdateInsertLeaveException("휴가 기본 정보 수정 실패");
		}
		System.out.println("setting : " + result);
		return result;
	}

	@Override
	public int insertLeaveList(SqlSessionTemplate sqlSession, ArrayList<ATManagement> insertLeave) throws UpdateInsertLeaveException {
		int result = 0;
		for(int i = 0; i < insertLeave.size(); i++) {
			result = sqlSession.insert("ATManagement.insertLeaveList", insertLeave.get(i));
			
		}
		System.out.println("insert : " + result);
		if(result == 0) {
			throw new UpdateInsertLeaveException("휴가 정보 생성 실패");
		}
		return result;
	}

	@Override
	public ArrayList<ATManagement> selectVacationStatus(SqlSessionTemplate sqlSession, ATManagement at, PageInfo pi) throws SelectVacationException {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<ATManagement> vacation = (ArrayList)sqlSession.selectList("ATManagement.selectVacationStatus", at, rowBounds);
		
		if(vacation == null) {
			throw new SelectVacationException("휴가 정보 조회 실패");
		}
		
		return vacation;
	}

	@Override
	public String selectVacationEmployee(SqlSessionTemplate sqlSession, ATManagement at) throws SelectVacationException {

		String vacationemp = sqlSession.selectOne("ATManagement.selectVacationEmployee", at);
		if(vacationemp.equals("")) {
			throw new SelectVacationException("입사일 조회 실패");
		}

		return vacationemp;
	}

	@Override
	public int selectRewardCount(SqlSessionTemplate sqlSession, int mno) throws SelectVacationException {

		int rewardCount = sqlSession.selectOne("ATManagement.selectRewardCount", mno);
		
		
		
		return rewardCount;
	}

	@Override
	public int selectAleaveCount(SqlSessionTemplate sqlSession, int hireyear) throws SelectVacationException {

		int aleaveCount = sqlSession.selectOne("ATManagement.selectAleaveCount", hireyear);
		
		return aleaveCount;
	}

	@Override
	public int getVacationListCount(SqlSessionTemplate sqlSession, ATManagement at) {

		int count = sqlSession.selectOne("ATManagement.getVacationListCount", at);
		return count;
	}

	@Override
	public ATManagement selectVacationDetail(SqlSessionTemplate sqlSession, String lInfoNo) throws SelectVacationException {

		
		ATManagement detail = sqlSession.selectOne("ATManagement.selectVacationDetail", lInfoNo);
		if(detail == null) {
			throw new SelectVacationException("휴가 상세 조회 실패");
		}
		return detail;
	}

	@Override
	public int getAdminVacationListCount(SqlSessionTemplate sqlSession, ATManagement at) {

		
		int listCount = sqlSession.selectOne("ATManagement.getAdminVacationListCount", at.getCorpNo());
		
		return listCount;
	}

	@Override
	public ArrayList<ATManagement> selectVacationList(SqlSessionTemplate sqlSession, ATManagement at, PageInfo pi) throws SelectVacationException {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<ATManagement> vacationList = (ArrayList)sqlSession.selectList("ATManagement.selectVacationList", at.getCorpNo(), rowBounds);
		
		if(vacationList == null) {
			throw new SelectVacationException("휴가 상세 조회 실패");
		}
		
		return vacationList;
	}

	@Override
	public int updateVacationApproval(SqlSessionTemplate sqlSession, String lInfoNo) throws SelectVacationException {
		
		int approval = sqlSession.update("ATManagement.updateVacationApproval", lInfoNo);
		
		if(approval == 0) {
			throw new SelectVacationException("휴가 승인 실패");
		}
		
		return approval;
	}

	@Override
	public ArrayList<ATManagement> selectEmp(SqlSessionTemplate sqlSession, int corpNo) throws SelectVacationException {

		
		ArrayList<ATManagement> emp = (ArrayList)sqlSession.selectList("ATManagement.selectEmp", corpNo);
		
		if(emp == null) {
			throw new SelectVacationException("휴가 직원 조회 실패");
		}
		
		
		return emp;
	}

	@Override
	public ArrayList<ATManagement> selectVacationDate(SqlSessionTemplate sqlSession, ATManagement at) throws SelectVacationException {

		ArrayList<ATManagement> vacation = (ArrayList)sqlSession.selectList("ATManagement.selectVacationDate", at);
		
		if(vacation == null) {
			throw new SelectVacationException("휴가일 조회 실패");
		}
		
		
		return vacation;
	}

	@Override
	public List<Map<String, Object>> selectLateCount(SqlSessionTemplate sqlSession, ATManagement at) {

		
		List<Map<String, Object>> list = sqlSession.selectList("ATManagement.selectLateCount");
		
		return list;
	}

	@Override
	public ArrayList<ATManagement> selectSearchEmployee(SqlSessionTemplate sqlSession, SearchCondition sc) {

		
		ArrayList<ATManagement> emplist = (ArrayList)sqlSession.selectList("ATManagement.selectSearchEmployee", sc);
		
		
		return emplist;
	}

	@Override
	public ATManagement selectWorkInfo(SqlSessionTemplate sqlSession, ATManagement at) {

		ATManagement workInfo = sqlSession.selectOne("ATManagement.selectWorkInfo", at);
		
		return workInfo;
	}

	@Override
	public int insertObj(SqlSessionTemplate sqlSession, ATManagement at) {

		int insertObj = sqlSession.insert("ATManagement.insertObj", at);
		
		return insertObj;
	}

	



}
