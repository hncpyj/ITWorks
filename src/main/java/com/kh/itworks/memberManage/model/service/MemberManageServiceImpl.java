package com.kh.itworks.memberManage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.common.PageInfo;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.memberManage.model.dao.MemberManageDao;
import com.kh.itworks.memberManage.model.vo.MemberManagePageInfo;

@Service
public class MemberManageServiceImpl implements MemberManageService {

	@Autowired
	private MemberManageDao mmd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 가입대기 직원 리스트 게시물 갯수 조회용 메소드
	@Override
	public int getListCount1(int corpNo) {
		
		return mmd.getListCount1(sqlSession, corpNo);
	}

	// 가입대기 직원 리스트 페이징 게시물 조회용 메소드
	@Override
	public ArrayList<Member> selectMemberManageList(PageInfo pi, int corpNo) {

		return mmd.selectMemberManageList(pi, sqlSession, corpNo);
	}

	// 가입된 직원 리스트 게시물 갯수 조회용 메소드
	@Override
    public int getListCount2(int corpNo) {
			
		return mmd.getListCount2(sqlSession, corpNo);
	}
	
	
	// 가입된 직원 리스트 페이징 게시물 조회용 메소드
	@Override
	public ArrayList<Member> signUpApprovalList(PageInfo pi, int corpNo) {

		return mmd.signUpApprovalList(pi, sqlSession, corpNo);
	}

	@Override
	public ArrayList<HashMap<String, String>> selectAllDept(int corpNo) {
		return mmd.selectAllDept(sqlSession, corpNo);
	}

	@Override
	public int uploadProfile(FileBox profile) {
		return mmd.uploadProfile(sqlSession, profile);
	}

	@Override
	public int updateMember(Member modifyInfo) {
		return mmd.updateMember(sqlSession, modifyInfo);
	}

	@Override
	public ArrayList<HashMap<String, String>> selectAllJob(int corpNo) {
		return mmd.selectAllJob(sqlSession, corpNo);
	}

	@Override
	public int signUpApproval(String mno) {
		return mmd.signUpApproval(sqlSession, mno);
	}

	
	
	
	
	
	
	
	
	
}
