package com.kh.itworks.fileBox.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.common.PageInfo;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;

public interface FileBoxDao {

	int fileUpload(SqlSessionTemplate sqlSession, ArrayList<FileBox> fileArr, Member loginUser);

	int getListCount(SqlSessionTemplate sqlSession);

	ArrayList<FileBox> selectFileList(SqlSessionTemplate sqlSession, PageInfo pi);

	HashMap<String, Object> selectOneFile(SqlSessionTemplate sqlSession, String fileNo);

	int fileDelete(SqlSessionTemplate sqlSession, FileBox fb);

	ArrayList<FileBox> selectTrashList(SqlSessionTemplate sqlSession, PageInfo pi);

	int fileRestore(SqlSessionTemplate sqlSession, FileBox fb);

	int fileDeleteForever(SqlSessionTemplate sqlSession, FileBox fb);

	int getSearchListCount(SqlSessionTemplate sqlSession, FileBox fb);

	ArrayList<FileBox> searchFileList(SqlSessionTemplate sqlSession, PageInfo pi, FileBox fb);

}
