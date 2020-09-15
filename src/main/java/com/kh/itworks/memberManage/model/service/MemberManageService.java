package com.kh.itworks.memberManage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.itworks.common.PageInfo;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;

public interface MemberManageService {

	int getListCount1(int corpNo);

	ArrayList<Member> selectMemberManageList(PageInfo pi, int corpNo);

	int getListCount2(int corpNo);
	
	ArrayList<Member> signUpApprovalList(PageInfo pi, int corpNo);

	ArrayList<HashMap<String, String>> selectAllDept(int corpNo);

	int uploadProfile(FileBox profile);

	int updateMember(Member modifyInfo);

	ArrayList<HashMap<String, String>> selectAllJob(int corpNo);

	int signUpApproval(String mno);

	
	

}
