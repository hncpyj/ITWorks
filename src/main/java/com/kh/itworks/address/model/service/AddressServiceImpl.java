package com.kh.itworks.address.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.address.model.dao.AddressDao;
import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;
import com.kh.itworks.address.model.vo.PageInfo;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressDao ad;
	 
	@Override
	public int insertAddress(AddressVO address) {

		return ad.insertAddress(sqlSession, address);
	}

	@Override
	public ArrayList<AddressVO> pageList(PageInfo pi) {
		
		return ad.pageList(sqlSession, pi);
	}

	@Override
	public int countAddressList() {
		
		return ad.countAddressList(sqlSession);
	}

	@Override
	public ArrayList<AddressVO> sharePageList(PageInfo pi) {
		
		return ad.sharePageList(sqlSession, pi);
	}

	@Override
	public int countShareAddressList() {
		
		return ad.countShareAddressList(sqlSession);
	}

	@Override
	public ArrayList<AddressVO> importPageList(PageInfo pi) {
		
		return ad.importantPageList(sqlSession, pi);
	}

	@Override
	public int countImportantAddressList() {
		
		return ad.countImportantAddressList(sqlSession);
	}

	@Override
	public void deleteMainAddress(int contactsNo) {
		
		ad.deleteMainAddress(contactsNo);
	}

//	@Override
//	public AddressVO selectOneMainAddress(int contactsNo) {
//
//		return ad.selectOneMainAddress(sqlSession, contactsNo);
//	}

//	@Override
//	public List<BoardDTO> list() {
//		return boardDAO.list();
//	}
//
//	@Override
//	public void delete(BoardDTO boardDTO) {
//		boardDAO.delete(boardDTO);
//	}
//
//	@Override
//	public int edit(BoardDTO boardDTO) {
//		return boardDAO.update(boardDTO);
//	}
//
//	@Override
//	public void write(BoardDTO boardDTO) {
//		boardDAO.insert(boardDTO);
//	}
//
//	@Override
//	public BoardDTO read(int num) {
//		boardDAO.updateReadCount(num);
//		return boardDAO.select(num);
//	}

}
