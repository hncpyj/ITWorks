package com.kh.itworks.address.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;
import com.kh.itworks.address.model.vo.PageInfo;

public interface AddressService {

	//신규 주소록 등록
	int insertAddress(AddressVO address);
	
	//메인 주소록 리스트
	ArrayList<AddressVO> pageList(PageInfo pi);
	
	//메인 주소록 카운트
	public int countAddressList();
	
	//공유 주소록 리스트
	ArrayList<AddressVO> sharePageList(PageInfo pi);
	
	//공유 주소록 카운트
	public int countShareAddressList();
	
	//중요 주소록 리스트
	ArrayList<AddressVO> importPageList(PageInfo pi);
	
	//중요 주소록 카운트
	public int countImportantAddressList();
	
	//메인 주소록 삭제
	public void deleteMainAddress(int contactsNo);

	public int changeConImportStatus(AddressVO address);

	AddressVO changeConfirm(AddressVO address); 
	
	
//	public void delete(BoardDTO boardDTO);
//	
//	
//	public int edit(BoardDTO boardDTO);	
//	
//	public BoardDTO read(int num);
	

}
