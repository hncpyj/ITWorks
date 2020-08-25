package com.kh.itworks.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.member.model.exception.LoginFailedException;
import com.kh.itworks.member.model.vo.Member;

public interface MemberDao {

	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginFailedException ;

}
