package com.kh.itworks.memberManage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public ArrayList<Member> selectMemberManageList(MemberManagePageInfo pi, int corpNo) {

		return mmd.selectMemberManageList(pi, sqlSession, corpNo);
	}

	// 가입된 직원 리스트 게시물 갯수 조회용 메소드
	@Override
    public int getListCount2(int corpNo) {
			
		return mmd.getListCount2(sqlSession, corpNo);
	}
	
	
	// 가입된 직원 리스트 페이징 게시물 조회용 메소드
	@Override
	public ArrayList<Member> signUpApprovalList(MemberManagePageInfo pi, int corpNo) {

		return mmd.signUpApprovalList(pi, sqlSession, corpNo);
	}

	
	
	
	
	
	
	
	
	
}
