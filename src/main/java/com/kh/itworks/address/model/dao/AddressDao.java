package com.kh.itworks.address.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;
import com.kh.itworks.address.model.vo.PageInfo;

public interface AddressDao {

	//주소록 신규 등록 (모든 페이지)
	int insertAddress(SqlSessionTemplate sqlSession, AddressVO address);

	//메인 주소록 리스트 
	public ArrayList<AddressVO>pageList(SqlSessionTemplate sqlSession, PageInfo pi, AddressVO address);
	
	//메인 주소록 개수
	public int countAddressList(SqlSessionTemplate sqlSession, AddressVO address);
	
	//공유 주소록 리스트
	public ArrayList<AddressVO>sharePageList(SqlSessionTemplate sqlSession, PageInfo pi, AddressVO address);
	
	//공유 주소록 개수
	public int countShareAddressList(SqlSessionTemplate sqlSession, AddressVO address);
	
	//중요 주소록 리스트
	public ArrayList<AddressVO>importantPageList(SqlSessionTemplate sqlSession, PageInfo pi, AddressVO address);
	
	//중요 주소록 개수
	public int countImportantAddressList(SqlSessionTemplate sqlSession, AddressVO address);
	
	//주소록 삭제
	public void deleteMainAddress(int contactsNo);
	
	//주소록 즐겨찾기 상태 변경
	int changeImportStatus(SqlSessionTemplate sqlSession ,AddressVO address);
	
	//주소록 즐겨찾기 상태 변경 확인
	AddressVO confirmChange(SqlSessionTemplate sqlSession, AddressVO address);
	
	//주소록 업데이트
	public int updateAddress(SqlSessionTemplate sqlSession, AddressVO address);
	
}
