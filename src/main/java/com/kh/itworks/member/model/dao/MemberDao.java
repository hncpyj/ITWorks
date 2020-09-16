package com.kh.itworks.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.exception.LoginFailedException;
import com.kh.itworks.member.model.vo.Member;

public interface MemberDao {

	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginFailedException ;

	Member duplicationCheck(SqlSessionTemplate sqlSession, String userId);

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	int corpNoCheck(SqlSessionTemplate sqlSession, int corpNo);

	String myPageCheckPwd(SqlSessionTemplate sqlSession, HashMap<String, String> info);

	int uploadProfile(SqlSessionTemplate sqlSession, FileBox profile);

	FileBox getProfile(SqlSessionTemplate sqlSession, int mno);

	int updateUserInfo(SqlSessionTemplate sqlSession, Member m);

	Member selectUserInfo(SqlSessionTemplate sqlSession, int mno);

}
