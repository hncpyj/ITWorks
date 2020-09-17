package com.kh.itworks.member.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.fileBox.model.vo.FileBox;
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

	//회사코드 DB등록여부 체크
	@Override
	public int corpNoCheck(int corpNo) {

		return md.corpNoCheck(sqlSession, corpNo);
	}

	@Override
	public boolean myPageCheckPwd(HashMap<String, String> info) {
		String dbPwd = md.myPageCheckPwd(sqlSession, info);
		
		boolean result = info.get("pwd").equals(dbPwd);
		
		return result;
	}

	@Override
	public int uploadProfile(FileBox profile) {
		return md.uploadProfile(sqlSession, profile);
	}

	@Override
	public FileBox getProfile(int mno) {
		
		FileBox profile = md.getProfile(sqlSession, mno);
		
		return profile;
	}

	@Override
	public int updateUserInfo(Member m) {
		return md.updateUserInfo(sqlSession, m);
	}

	@Override
	public Member selectUserInfo(int mno) {
		Member userInfo = md.selectUserInfo(sqlSession, mno);
		
		return userInfo;
	}

	
}
