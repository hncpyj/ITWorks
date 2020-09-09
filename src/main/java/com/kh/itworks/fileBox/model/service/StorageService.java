package com.kh.itworks.fileBox.model.service;

import java.util.ArrayList;

import com.kh.itworks.fileBox.model.vo.Storage;

public interface StorageService {

	int getStgSize();

	ArrayList<Storage> selectFolderList();

}
