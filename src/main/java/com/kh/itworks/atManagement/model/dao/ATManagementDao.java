package com.kh.itworks.atManagement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.atManagement.model.exception.SelectATManagementFailedException;
import com.kh.itworks.atManagement.model.vo.ATManagement;

public interface ATManagementDao {

	ATManagement selectAtBt(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException ;

	ArrayList<ATManagement> selectWorkingStatus(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException ;

	ArrayList<ATManagement> selectWorkTimeSet(SqlSessionTemplate sqlSession, ATManagement at) throws SelectATManagementFailedException ;

}
