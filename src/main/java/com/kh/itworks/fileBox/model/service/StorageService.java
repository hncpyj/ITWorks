package com.kh.itworks.fileBox.model.service;

import java.util.ArrayList;

import com.kh.itworks.fileBox.model.vo.Storage;

public interface StorageService {

	double getStgSize();

	ArrayList<Storage> selectFolderList();

	ArrayList<Storage> selectSearchFolderList();

	int folderDelete(String stgNo);

	int folderRename(Storage stg);

	int addNewFolder(Storage stg);

}
