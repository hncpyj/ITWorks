package com.kh.itworks.fileBox.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.fileBox.model.vo.Storage;

public interface StorageDao {

	double getStgSige(SqlSessionTemplate sqlSession);

	ArrayList<Storage> selectFolderList(SqlSessionTemplate sqlSession);

	ArrayList<Storage> selectSearchFolderList(SqlSessionTemplate sqlSession);

	int folderDelete(SqlSessionTemplate sqlSession, String stgNo);

	int folderRename(SqlSessionTemplate sqlSession, Storage stg);

	int addNewFolder(SqlSessionTemplate sqlSession, Storage stg);

}
