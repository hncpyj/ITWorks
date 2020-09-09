package com.kh.itworks.fileBox.model.service;

import java.util.ArrayList;

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
	public int getStgSize() {
		System.out.println("service 넘어오니..?");
		int stgSize = stgd.getStgSige(sqlSession);
		System.out.println("service : " + stgSize);
		
		return stgSize;
	}

	@Override
	public ArrayList<Storage> selectFolderList() {
		System.out.println("service select list 넘어오니..?");
		
		ArrayList<Storage> list = stgd.selectFolderList(sqlSession);
		System.out.println("service : " + list);
		return null;
	}

}
