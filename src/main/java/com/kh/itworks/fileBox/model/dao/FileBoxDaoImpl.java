package com.kh.itworks.fileBox.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.fileBox.model.vo.PageInfo;
import com.kh.itworks.member.model.vo.Member;

@Repository
public class FileBoxDaoImpl implements FileBoxDao{


	@Override
	public int fileUpload(SqlSessionTemplate sqlSession, FileBox fb, Member loginUser) {
		System.out.println("dao : " + fb);
		return sqlSession.insert("FileBox.uploadFiles", fb);
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		System.out.println("dao 넘어오니..?");
		int result = sqlSession.selectOne("FileBox.selectListCount");
		
		System.out.println("dao fileBoxListCount : " + result);
		
//		if(result < 0) {
//			sqlSession.close();
//			
//		}
		return result;
	}

	@Override
	public ArrayList<FileBox> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<FileBox> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Board.selectBoardList", null, rowBounds);
		
		System.out.println("dao boardList : " + list);
		
//		if(list == null) {
//			sqlSession.close();
//		}
		
		return list;
	}

}
