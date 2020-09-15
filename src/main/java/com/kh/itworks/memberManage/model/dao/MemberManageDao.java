package com.kh.itworks.memberManage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.common.PageInfo;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;

public interface MemberManageDao {

	int getListCount1(SqlSessionTemplate sqlSession, int corpNo);

	ArrayList<Member> selectMemberManageList(PageInfo pi, SqlSessionTemplate sqlSession, int corpNo);

	int getListCount2(SqlSessionTemplate sqlSession, int corpNo);
	
	ArrayList<Member> signUpApprovalList(PageInfo pi, SqlSessionTemplate sqlSession, int corpNo);

	ArrayList<HashMap<String, String>> selectAllDept(SqlSessionTemplate sqlSession, int corpNo);

	int uploadProfile(SqlSessionTemplate sqlSession, FileBox profile);

	int updateMember(SqlSessionTemplate sqlSession, Member modifyInfo);

	ArrayList<HashMap<String, String>> selectAllJob(SqlSessionTemplate sqlSession, int corpNo);

	int signUpApproval(SqlSessionTemplate sqlSession, String mno);
	
	
	

}
