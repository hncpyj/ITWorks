package com.kh.itworks.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.fileBox.model.vo.FileBox;
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

	//회사코드 DB등록여부 체크
	@Override
	public int corpNoCheck(SqlSessionTemplate sqlSession, int corpNo) {

		return sqlSession.selectOne("Member.corpNoCheck", corpNo);
	}

	@Override
	public String myPageCheckPwd(SqlSessionTemplate sqlSession, HashMap<String, String> info) {
		
		String pwd = sqlSession.selectOne("Member.myPageCheckPwd", info);
		
		return pwd;
	}
	
	@Override
	public int uploadProfile(SqlSessionTemplate sqlSession, FileBox profile) {
		return sqlSession.insert("Member.uploadProfile", profile);
	}

	@Override
	public FileBox getProfile(SqlSessionTemplate sqlSession, int mno) {
		FileBox profile = sqlSession.selectOne("Member.getProfile", mno);
		return profile;
	}

	@Override
	public int updateUserInfo(SqlSessionTemplate sqlSession, Member m) {
		int result = sqlSession.update("Member.updateUserInfo", m);
		return result;
	}

	@Override
	public Member selectUserInfo(SqlSessionTemplate sqlSession, int mno) {
		Member userInfo = sqlSession.selectOne("Member.selectUserInfo", mno);
		return userInfo;
	}

	

}
