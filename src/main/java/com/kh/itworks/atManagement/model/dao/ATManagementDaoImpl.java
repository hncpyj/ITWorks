package com.kh.itworks.atManagement.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.atManagement.model.exception.DeleteUpdateInsertException;
import com.kh.itworks.atManagement.model.exception.InsertWorkInfoException;
import com.kh.itworks.atManagement.model.exception.SelectATManagementFailedException;
import com.kh.itworks.atManagement.model.exception.SelectWorkTimeListException;
import com.kh.itworks.atManagement.model.vo.ATManagement;

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



}
