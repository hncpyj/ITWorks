package com.kh.itworks.memberManage.model.service;

import java.util.ArrayList;

import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.memberManage.model.vo.MemberManagePageInfo;

public interface MemberManageService {

	int getListCount1(int corpNo);

	ArrayList<Member> selectMemberManageList(MemberManagePageInfo pi, int corpNo);

	int getListCount2(int corpNo);
	
	ArrayList<Member> signUpApprovalList(MemberManagePageInfo pi, int corpNo);

	
	

}
