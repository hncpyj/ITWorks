package com.kh.itworks.fileBox.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.fileBox.model.vo.Storage;

public interface StorageDao {

	int getStgSige(SqlSessionTemplate sqlSession);

	ArrayList<Storage> selectFolderList(SqlSessionTemplate sqlSession);

}
