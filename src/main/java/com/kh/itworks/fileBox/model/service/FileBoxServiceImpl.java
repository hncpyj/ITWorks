package com.kh.itworks.fileBox.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.fileBox.model.dao.FileBoxDao;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.fileBox.model.vo.PageInfo;
import com.kh.itworks.member.model.vo.Member;

@Service
public class FileBoxServiceImpl implements FileBoxService {

	@Autowired
	private FileBoxDao fbd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int uploadFile(FileBox fb, Member loginUser) {
		int result = 0;
		result = fbd.fileUpload(sqlSession, fb, loginUser);
		System.out.println(result);
		return fbd.fileUpload(sqlSession, fb, loginUser);
	}

	@Override
	public int getListCount() {
		System.out.println("service 넘어오니..?");
		int listCount = fbd.getListCount(sqlSession);
		
		sqlSession.close();
		
		return listCount;
	}

	@Override
	public ArrayList<FileBox> selectFileList(PageInfo pi) {
		
		ArrayList<FileBox> list = fbd.selectBoardList(sqlSession, pi);
		
		sqlSession.close();
		
		return list;
	}


}
