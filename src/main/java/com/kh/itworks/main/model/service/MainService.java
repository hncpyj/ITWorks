package com.kh.itworks.main.model.service;

import java.util.ArrayList;

import com.kh.itworks.main.model.vo.Main;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.notice.model.vo.Notice;

public interface MainService {

	ArrayList<Main> selectNoticeMainList(Member m);

	ArrayList<Main> selectProjectMainList(Member m);

	ArrayList<Main> selectAtStatus(Member m);

}
