package com.kh.itworks.fileBox.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.fileBox.model.vo.PageInfo;
import com.kh.itworks.member.model.vo.Member;

public interface FileBoxDao {

	int fileUpload(SqlSessionTemplate sqlSession, ArrayList<FileBox> fileArr, Member loginUser);

	int getListCount(SqlSessionTemplate sqlSession);

	ArrayList<FileBox> selectFileList(SqlSessionTemplate sqlSession, PageInfo pi);

	HashMap<String, Object> selectOneFile(SqlSessionTemplate sqlSession, String fileNo);

	int fileDelete(SqlSessionTemplate sqlSession, String fileNo);

}
