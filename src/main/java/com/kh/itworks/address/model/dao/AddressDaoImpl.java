package com.kh.itworks.address.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;

@Repository
public class AddressDaoImpl implements AddressDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//신규 주소록 등록
	@Override
	public int insertAddress(SqlSessionTemplate sqlSession, AddressVO address) {

		return sqlSession.insert("Address.insertAddress", address);
	}
	
	// Criteria 객체에 담아서 SQL 매핑에 보낼 파라미터
	// 특정 페이지 게시글의 행(pageStart)과 페이지당 보여줄 게시글의 갯수(perPageNum)
	@Override
	public List<Map<String, Object>> pageList(Criteria cri) {
		
		return sqlSession.selectList("Address.selectMainAddressList", cri);
	}

	@Override
	public int countBoardList() {
		
		return sqlSession.selectOne("Address.listCountMain");
	}

//	@Override
//	public void delete(BoardDTO boardDTO) {
//		sqlSessionTemplate.delete("boardDAO.delete", boardDTO);
//	}
//
//	@Override
//	public int update(BoardDTO boardDTO) {
//		return sqlSessionTemplate.update("boardDAO.update", boardDTO);
//	}
//
//	@Override
//	public BoardDTO select(int num) {
//		BoardDTO dto = (BoardDTO)sqlSessionTemplate.selectOne("boardDAO.select", num);
//		return dto;
//	}

}
