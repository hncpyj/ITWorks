package com.kh.itworks.address.model.service;

import java.util.List;
import java.util.Map;

import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;

public interface AddressService {

	//신규 주소록 등록
	int insertAddress(AddressVO address);
	
	
	List<Map<String, Object>> pageList(Criteria cri);
	
	
	public int countBoardList();
	
	
//	public void delete(BoardDTO boardDTO);
//	
//	
//	public int edit(BoardDTO boardDTO);	
//	
//	public BoardDTO read(int num);
	

}
