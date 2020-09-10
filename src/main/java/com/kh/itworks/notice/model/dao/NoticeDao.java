package com.kh.itworks.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.notice.model.exception.NoticeSelectListException;
import com.kh.itworks.notice.model.vo.Notice;
import com.kh.itworks.notice.model.vo.PageInfo;

public interface NoticeDao {

	int insertNo(SqlSessionTemplate sqlSession, Notice notice);
	
	int getListCount(SqlSessionTemplate sqlSession);

	ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, int i) throws NoticeSelectListException;


}
