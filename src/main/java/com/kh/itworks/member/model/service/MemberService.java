package com.kh.itworks.member.model.service;

import java.util.HashMap;

import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.exception.LoginFailedException;
import com.kh.itworks.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginFailedException ;
	Member duplicationCheck(String userId);
	int insertMember(Member m);
	int corpNoCheck(int corpNo);
	boolean myPageCheckPwd(HashMap<String, String> info);
	int uploadProfile(FileBox profile);
	FileBox getProfile(int mno);
	int updateUserInfo(Member m);
	Member selectUserInfo(int mno);
	
	
}
