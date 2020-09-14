package com.kh.itworks.notice.model.service;

import java.util.ArrayList;

import com.kh.itworks.notice.model.exception.NoticeSelectListException;
import com.kh.itworks.notice.model.vo.Notice;
import com.kh.itworks.notice.model.vo.NoticePageInfo;

public interface NoticeService {

	int insertNo(Notice notice);

	int getListCount();

	ArrayList<Notice> selectNoticeList(NoticePageInfo pi, int i) throws NoticeSelectListException;

	Notice selectOneBoard(String noticeNo);

	int deleteNo(Notice notice);
	
}
