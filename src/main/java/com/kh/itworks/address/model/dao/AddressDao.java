package com.kh.itworks.address.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;

public interface AddressDao {

	//주소록 신규 등록 (모든 페이지)
	int insertAddress(SqlSessionTemplate sqlSession, AddressVO address);

	//메인 주소록 리스트 
	public List<Map<String, Object>> pageList(Criteria cri);
	
	//메인 주소록 개수
	public int countAddressList();
	
	//공유 주소록 리스트
	public List<Map<String, Object>> sharePageList(Criteria cri);
	
	//공유 주소록 개수
	public int countShareAddressList();
	
	//중요 주소록 리스트
	public List<Map<String, Object>> importantPageList(Criteria cri);
	
	//중요 주소록 개수
	public int countImportantAddressList();
	
//	//주소록 삭제
//	public void delete(AddressVO address);
//	
//	//주소록 수정
//	public int update(AddressVO address);
//	
//	//주소록 조회하기
//	public AddressVO select(int num);
	
	
}
