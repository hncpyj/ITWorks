package com.kh.itworks.member.model.service;

import com.kh.itworks.member.model.exception.LoginFailedException;
import com.kh.itworks.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginFailedException ;
	Member duplicationCheck(String userId);
	int insertMember(Member m);
	int corpNoCheck(int corpNo);
	
	
	
}
