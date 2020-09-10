package com.kh.itworks.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.notice.model.exception.NoticeSelectListException;
import com.kh.itworks.notice.model.vo.Notice;
import com.kh.itworks.notice.model.vo.PageInfo;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Override
	public int insertNo(SqlSessionTemplate sqlSession, Notice notice) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Notice.insertNo", notice);
	}
	
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		
		int result = sqlSession.selectOne("Notice.selectListCount");
		
		if(result < 0) {
			sqlSession.close();
		}
		
		return result;
	}

	@Override
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, int i) throws NoticeSelectListException {

		ArrayList<Notice> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Notice.selectNoticeList", i, rowBounds);
		
		System.out.println("dao noticeList : " + list);
		
		if(list == null) {
			sqlSession.close();
			throw new NoticeSelectListException("공지사항 리스트 출력 실패"); 
		}
		
		return list;
	}

}
