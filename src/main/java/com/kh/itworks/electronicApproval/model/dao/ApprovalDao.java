package com.kh.itworks.electronicApproval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.electronicApproval.model.vo.Approval;

public interface ApprovalDao {

	int insertApproval(SqlSessionTemplate sqlSession, Approval app);

}
