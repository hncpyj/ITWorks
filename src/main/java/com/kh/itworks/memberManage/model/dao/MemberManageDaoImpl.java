package com.kh.itworks.memberManage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.memberManage.model.vo.MemberManagePageInfo;

@Repository
public class MemberManageDaoImpl implements MemberManageDao {

	
	// 가입대기 직원 리스트 게시물 갯수 조회용 메소드
	@Override
	public int getListCount1(SqlSessionTemplate sqlSession, int corpNo) {

		return sqlSession.selectOne("MemberManage.getListCount1", corpNo);
	}

	// 가입대기 직원 리스트 페이징 게시물 조회용 메소드
	@Override
	public ArrayList<Member> selectMemberManageList(MemberManagePageInfo pi, SqlSessionTemplate sqlSession, int corpNo) {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
	      
	    RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
	    ArrayList<Member> list = (ArrayList) sqlSession.selectList("MemberManage.selectMemeberManageList", corpNo, rowBounds);
	    
	    System.out.println("list : " + list);
	    
		return list;
	}

	
	// 가입된 직원 리스트 게시물 갯수 조회용 메소드
	@Override
	public int getListCount2(SqlSessionTemplate sqlSession, int corpNo) {

		return sqlSession.selectOne("MemberManage.getListCount2", corpNo);
	}
	
	// 가입된 직원 리스트 페이징 게시물 조회용 메소드
	@Override
	public ArrayList<Member> signUpApprovalList(MemberManagePageInfo pi, SqlSessionTemplate sqlSession, int corpNo) {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
	      
	    RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
	    ArrayList<Member> list = (ArrayList) sqlSession.selectList("MemberManage.signUpApprovalList", corpNo, rowBounds);
	    
	    System.out.println("list : " + list);
	    
		return list;
		
	}

}
