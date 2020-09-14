package com.kh.itworks.notice.model.service;

import java.util.ArrayList;

import com.kh.itworks.notice.model.exception.NoticeSelectListException;
import com.kh.itworks.notice.model.vo.Notice;
import com.kh.itworks.notice.model.vo.NoticePageInfo;

public interface NoticeService {

	//공지사항 등록
	int insertNo(Notice notice);

	//공지사항 글 개수 불러오기
	int getListCount();
	
	//공지사항 목록 불러오기
	ArrayList<Notice> selectNoticeList(NoticePageInfo pi, int i) throws NoticeSelectListException;

	//공지사항 디테일
	Notice selectOneBoard(String noticeNo);

	//공지사항 삭제
	int deleteNo(Notice notice);
	
}
