package com.kh.itworks.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.main.model.dao.MainDao;
import com.kh.itworks.main.model.vo.Main;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.notice.model.vo.Notice;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDao md;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Main> selectNoticeMainList(Member m) {
		
		return md.selectNoticeMainList(sqlSession, m);
	}

	@Override
	public ArrayList<Main> selectProjectMainList(Member m) {

		return md.selectProjectMainList(sqlSession, m);
	}

	@Override
	public ArrayList<Main> selectAtStatus(Member m) {

		return md.seletAtStatus(sqlSession, m);
	}
}
