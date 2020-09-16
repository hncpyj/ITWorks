package com.kh.itworks.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.main.model.vo.Main;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.notice.model.vo.Notice;

@Repository
public class MainDaoImpl implements MainDao {

	@Override
	public ArrayList<Main> selectNoticeMainList(SqlSessionTemplate sqlSession, Member m) {
		
		
		ArrayList<Main> list = (ArrayList)sqlSession.selectList("Main.selectNoticeMainList", m);
		
		
		return list;
	}

	@Override
	public ArrayList<Main> selectProjectMainList(SqlSessionTemplate sqlSession, Member m) {

		
		ArrayList<Main> list = (ArrayList)sqlSession.selectList("Main.selectProjectMainList", m);
		
		return list;
	}

	@Override
	public ArrayList<Main> seletAtStatus(SqlSessionTemplate sqlSession, Member m) {

		ArrayList<Main> list = (ArrayList)sqlSession.selectList("Main.selectAtStatus", m);
		
		return list;
	}

}
