package com.kh.itworks.fileBox.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.fileBox.model.vo.Storage;
@Repository
public class StorageDaoImpl implements StorageDao{

	@Override
	public int getStgSige(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Storage> selectFolderList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return null;
	}

}
