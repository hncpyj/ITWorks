package com.kh.itworks.memberManage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.memberManage.model.vo.MemberManagePageInfo;

public interface MemberManageDao {

	int getListCount1(SqlSessionTemplate sqlSession, int corpNo);

	ArrayList<Member> selectMemberManageList(MemberManagePageInfo pi, SqlSessionTemplate sqlSession, int corpNo);

	int getListCount2(SqlSessionTemplate sqlSession, int corpNo);
	
	ArrayList<Member> signUpApprovalList(MemberManagePageInfo pi, SqlSessionTemplate sqlSession, int corpNo);
	
	
	

}
