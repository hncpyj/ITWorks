package com.kh.itworks.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.member.model.exception.LoginFailedException;
import com.kh.itworks.member.model.vo.Member;

public interface MemberDao {

	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginFailedException ;

	Member duplicationCheck(SqlSessionTemplate sqlSession, String userId);

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	int corpNoCheck(SqlSessionTemplate sqlSession, int corpNo);

}
