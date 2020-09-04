package com.kh.itworks.fileBox.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.fileBox.model.vo.PageInfo;
import com.kh.itworks.member.model.vo.Member;

public interface FileBoxDao {

	int fileUpload(SqlSessionTemplate sqlSession, FileBox fb, Member loginUser);

	int getListCount(SqlSessionTemplate sqlSession);

	ArrayList<FileBox> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi);

}
