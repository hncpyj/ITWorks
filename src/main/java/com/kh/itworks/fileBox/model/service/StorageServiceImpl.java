package com.kh.itworks.fileBox.model.service;

import java.util.ArrayList;


import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.fileBox.model.dao.StorageDao;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.fileBox.model.vo.Storage;

@Service
public class StorageServiceImpl implements StorageService{

	@Autowired
	private StorageDao stgd;

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public double getStgSize() {
		System.out.println("service 넘어오니..?");
		double stgSize = stgd.getStgSige(sqlSession);
		System.out.println("service : " + stgSize);
		
		return stgSize;
	}

	@Override
	public ArrayList<Storage> selectFolderList() {
		System.out.println("service select list 넘어오니..?");
		
		ArrayList<Storage> list = stgd.selectFolderList(sqlSession);
		System.out.println("service : " + list);
		return list;
	}

	@Override
	public ArrayList<Storage> selectSearchFolderList() {
		System.out.println("***Search service select list 넘어오니..?");
		
		ArrayList<Storage> list = stgd.selectSearchFolderList(sqlSession);
		System.out.println("***Search service : " + list);
		return list;
	}

	@Override
	public int folderDelete(String stgNo) {
		System.out.println("service folderDelete : " + stgNo);
		int result = 0;
		result = stgd.folderDelete(sqlSession, stgNo);
		System.out.println("folder delete impl result : " + result);
		return result;
	}

	@Override
	public int folderRename(Storage stg) {
		System.out.println("service folderRename fileNo : " + stg);
		int result = 0;
		result = stgd.folderRename(sqlSession, stg);
		return result;
	}
	
	@Override
	public int addNewFolder(Storage stg) {
		System.out.println("service addNewFolder fileNo : " + stg);
		int result = 0;
		result = stgd.addNewFolder(sqlSession, stg);
		return result;
	}

}
