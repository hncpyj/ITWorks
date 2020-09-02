package com.kh.itworks.address.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.address.model.dao.AddressDao;
import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;

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
	public List<Map<String, Object>> pageList(Criteria cri) {
		
		return ad.pageList(cri);
	}

	@Override
	public int countBoardList() {
		
		return ad.countBoardList();
	}

	
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
