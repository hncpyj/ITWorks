package com.kh.itworks.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.main.model.vo.Main;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.notice.model.vo.Notice;

public interface MainDao {

	ArrayList<Main> selectNoticeMainList(SqlSessionTemplate sqlSession, Member m);

	ArrayList<Main> selectProjectMainList(SqlSessionTemplate sqlSession, Member m);

	ArrayList<Main> seletAtStatus(SqlSessionTemplate sqlSession, Member m);

}
