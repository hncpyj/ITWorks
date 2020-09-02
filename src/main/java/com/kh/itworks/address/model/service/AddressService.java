package com.kh.itworks.address.model.service;

import java.util.List;
import java.util.Map;

import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;

public interface AddressService {

	//신규 주소록 등록
	int insertAddress(AddressVO address);
	
	//메인 주소록 리스트
	List<Map<String, Object>> pageList(Criteria cri);
	
	//메인 주소록 카운트
	public int countAddressList();
	
	//공유 주소록 리스트
	List<Map<String, Object>> sharePageList(Criteria cri);
	
	//공유 주소록 카운트
	public int countShareAddressList();
	
	//중요 주소록 리스트
	List<Map<String, Object>> importPageList(Criteria cri);
	
	//중요 주소록 카운트
	public int countImportantAddressList();
	
	
//	public void delete(BoardDTO boardDTO);
//	
//	
//	public int edit(BoardDTO boardDTO);	
//	
//	public BoardDTO read(int num);
	

}
