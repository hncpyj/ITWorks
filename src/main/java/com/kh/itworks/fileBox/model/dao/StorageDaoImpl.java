package com.kh.itworks.fileBox.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.fileBox.model.vo.Storage;
@Repository
public class StorageDaoImpl implements StorageDao{

	@Override
	public double getStgSige(SqlSessionTemplate sqlSession) {
		System.out.println("storage dao 넘어오니..?");
		double result = sqlSession.selectOne("FileBox.countStorageSize");
		
		System.out.println("dao storage size : " + result);
		
		return result;
	}

	@Override
	public ArrayList<Storage> selectFolderList(SqlSessionTemplate sqlSession) {
		System.out.println("Have you arrived at Storage Dao?");
		ArrayList<Storage> list = (ArrayList) sqlSession.selectList("FileBox.selectFolderList");
		System.out.println("folder list : " + list);
		return list;
	}

	@Override
	public ArrayList<Storage> selectSearchFolderList(SqlSessionTemplate sqlSession) {
		System.out.println("Have you arrived at Storage Dao?");
		ArrayList<Storage> list = (ArrayList) sqlSession.selectList("FileBox.selectSearchFolderList");
		System.out.println("folder list : " + list);
		return list;
	}

	@Override
	public int folderDelete(SqlSessionTemplate sqlSession, String stgNo) {
		System.out.println("Dao folderDelete 넘어오니?");
		System.out.println("Dao folderDelete : " + stgNo);
		return sqlSession.update("FileBox.folderDelete", stgNo);
	}

	@Override
	public int folderRename(SqlSessionTemplate sqlSession, Storage stg) {
		System.out.println("Dao folderRename 넘어오니?");
		System.out.println("Dao folderRename Fileno : " + stg);
		return sqlSession.update("FileBox.folderRename", stg);
	}
	
	@Override
	public int addNewFolder(SqlSessionTemplate sqlSession, Storage stg) {
		System.out.println("Dao addNewFolder 넘어오니?");
		System.out.println("Dao addNewFolder Fileno : " + stg);
		return sqlSession.update("FileBox.addNewFolder", stg);
	}
}
