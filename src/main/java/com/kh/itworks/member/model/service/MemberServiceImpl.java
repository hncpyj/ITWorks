package com.kh.itworks.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.member.model.dao.MemberDao;
import com.kh.itworks.member.model.exception.LoginFailedException;
import com.kh.itworks.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
	
	@Override
	public Member loginMember(Member m) throws LoginFailedException {

		return md.loginCheck(sqlSession, m);
	}

	//중복체크
	@Override
	public Member duplicationCheck(String userId) {

		return md.duplicationCheck(sqlSession, userId);
	}

	//회원가입
	@Override
	public int insertMember(Member m) {
		
		return md.insertMember(sqlSession, m);
	}

	
}
