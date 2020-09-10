package com.kh.itworks.notice.model.service;

import java.util.ArrayList;

import com.kh.itworks.notice.model.exception.NoticeSelectListException;
import com.kh.itworks.notice.model.vo.Notice;
import com.kh.itworks.notice.model.vo.PageInfo;

public interface NoticeService {

	int insertNo(Notice notice);

	int getListCount();

	ArrayList<Notice> selectNoticeList(PageInfo pi, int i) throws NoticeSelectListException;

	
}
