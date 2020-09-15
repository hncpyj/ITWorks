package com.kh.itworks.fileBox.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.itworks.common.PageInfo;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;

public interface FileBoxService {

	int uploadFile(ArrayList<FileBox> fileArr, Member loginUser);

	int getListCount();

	ArrayList<FileBox> selectFileList(PageInfo pi);

	HashMap<String, Object> selectOneFile(String fileNo);

	int fileDelete(FileBox fb);

	ArrayList<FileBox> selectTrashList(PageInfo pi);


	int fileRestore(FileBox fb);

	int fileDeleteForever(FileBox fb);

	int getSearchListCount(FileBox fb);

	ArrayList<FileBox> searchFileList(PageInfo pi, FileBox fb);

//	int uploadFile(FileBox fb, Member loginUser);

}
