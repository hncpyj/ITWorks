package com.kh.itworks.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.notice.model.exception.NoticeSelectListException;
import com.kh.itworks.notice.model.vo.Notice;
import com.kh.itworks.notice.model.vo.NoticePageInfo;

public interface NoticeDao {

	int insertNo(SqlSessionTemplate sqlSession, Notice notice);
	
	int getListCount(SqlSessionTemplate sqlSession);

	ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, NoticePageInfo pi, int i) throws NoticeSelectListException;

	Notice selectOneBoard(SqlSessionTemplate sqlSession, String noticeNo);

	int deleteNo(SqlSessionTemplate sqlSession, Notice notice);

	int updateNo(SqlSessionTemplate sqlSession, Notice notice);


}
