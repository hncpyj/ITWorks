package com.kh.itworks.electronicApproval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.electronicApproval.model.vo.Approval;

@Repository
public class ApprovalDaoImpl implements ApprovalDao {

	@Override
	public int insertApproval(SqlSessionTemplate sqlSession, Approval app) {
		
		return sqlSession.insert("Approval.insertApproval", app);
	}

}
