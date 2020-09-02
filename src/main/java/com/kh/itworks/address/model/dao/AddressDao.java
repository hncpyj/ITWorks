package com.kh.itworks.address.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;

public interface AddressDao {

	//주소록 신규 등록 (모든 페이지)
	int insertAddress(SqlSessionTemplate sqlSession, AddressVO address);

//	//주소록 삭제
//	public void delete(AddressVO address);
//	
//	//주소록 수정
//	public int update(AddressVO address);
//	
//	//주소록 조회하기
//	public AddressVO select(int num);
	
	//페이징
	public List<Map<String, Object>> pageList(Criteria cri);
	
	//페이징
	public int countBoardList();
	
}
