package com.kh.itworks.notice.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.notice.model.vo.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Override
	public int insertNo(SqlSessionTemplate sqlSession, Notice notice) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Notice.insertNo", notice);
	}

}
