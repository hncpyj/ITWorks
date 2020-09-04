package com.kh.itworks.fileBox.model.service;

import java.util.ArrayList;

import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.fileBox.model.vo.PageInfo;
import com.kh.itworks.member.model.vo.Member;

public interface FileBoxService {

	int uploadFile(FileBox fb, Member loginUser);

	int getListCount();

	ArrayList<FileBox> selectFileList(PageInfo pi);

}
