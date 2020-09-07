package com.kh.itworks.electronicApproval.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.itworks.electronicApproval.model.dao.ApprovalDao;
import com.kh.itworks.electronicApproval.model.vo.Approval;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao ad;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Override
	public int insertApproval(Approval app) {
		
		return ad.insertApproval(sqlSession, app);
	}
	
}
