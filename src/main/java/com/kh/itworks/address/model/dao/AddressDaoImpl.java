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
	public int countAddressList() {
		
		return sqlSession.selectOne("Address.listCountMain");
	}

	//공유주소록 리스트
	@Override
	public List<Map<String, Object>> sharePageList(Criteria cri) {
		
		return sqlSession.selectList("Address.selectShareAddressList", cri);
	}
	
	//공유주소록 카운트
	@Override
	public int countShareAddressList() {
		
		return sqlSession.selectOne("Address.listCountShare");
	}

	//중요주소록 페이징 리스트
	@Override
	public List<Map<String, Object>> importantPageList(Criteria cri) {

		return sqlSession.selectList("Address.selectImportantAddressList", cri);
	}

	//중요주소록 카운트
	@Override
	public int countImportantAddressList() {

		return sqlSession.selectOne("Address.importantListCount");
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
