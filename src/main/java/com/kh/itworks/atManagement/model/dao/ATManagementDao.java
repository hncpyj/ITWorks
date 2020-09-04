package com.kh.itworks.atManagement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.atManagement.model.exception.DeleteUpdateInsertException;
import com.kh.itworks.atManagement.model.exception.SelectATManagementFailedException;
import com.kh.itworks.atManagement.model.vo.ATManagement;

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

	

}
