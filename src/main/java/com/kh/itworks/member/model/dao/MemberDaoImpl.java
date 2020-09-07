package com.kh.itworks.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.member.model.exception.LoginFailedException;
import com.kh.itworks.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginFailedException {
		
		Member loginUser = sqlSession.selectOne("Member.loginCheck", m);
		
		System.out.println("dao loginUser : " + loginUser);
		
		if(loginUser == null) {
			throw new LoginFailedException("로그인 실패");
		}
		
		return loginUser;
	}

	//중복체크
	@Override
	public Member duplicationCheck(SqlSessionTemplate sqlSession, String userId) {

		return sqlSession.selectOne("Member.duplicationCheck", userId);
	}

	//회원가입
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("Member.insertMember", m);
	}

}
