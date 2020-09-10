package com.kh.itworks.notice.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.itworks.notice.model.dao.NoticeDao;
import com.kh.itworks.notice.model.vo.Notice;

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
		// TODO Auto-generated method stub
		return nd.insertNo(sqlSession, notice);
	}
	
}
