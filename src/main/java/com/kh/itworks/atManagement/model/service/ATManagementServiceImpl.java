package com.kh.itworks.atManagement.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.atManagement.model.dao.ATManagementDao;
import com.kh.itworks.atManagement.model.exception.DeleteUpdateInsertException;
import com.kh.itworks.atManagement.model.exception.SelectATManagementFailedException;
import com.kh.itworks.atManagement.model.vo.ATManagement;

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

}
