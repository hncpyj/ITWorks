package com.kh.itworks.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.itworks.notice.model.dao.NoticeDao;
import com.kh.itworks.notice.model.exception.NoticeSelectListException;
import com.kh.itworks.notice.model.vo.Notice;
import com.kh.itworks.notice.model.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao nd;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Override
	public int insertNo(Notice notice) {
		
		return nd.insertNo(sqlSession, notice);
	}

	@Override
	public int getListCount() {

		int listCount = nd.getListCount(sqlSession);
		
		return listCount;
	}


	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi, int i) throws NoticeSelectListException {
		
		ArrayList<Notice> list = nd.selectNoticeList(sqlSession, pi, i);
		
		return list;
	}
	
}
