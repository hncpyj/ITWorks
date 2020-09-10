package com.kh.itworks.notice.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.notice.model.vo.Notice;

public interface NoticeDao {

	int insertNo(SqlSessionTemplate sqlSession, Notice notice);

}
