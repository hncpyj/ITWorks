package com.kh.itworks.address.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;
import com.kh.itworks.address.model.vo.PageInfo;

@Repository
public class AddressDaoImpl implements AddressDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//신규 주소록 등록
	@Override
	public int insertAddress(SqlSessionTemplate sqlSession, AddressVO address) {

		return sqlSession.insert("Address.insertAddress", address);
	}
	
	//메인리스트 카운트
	@Override
	public int countAddressList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Address.listCountMain");
	}

	//메인리스트 리스트
	@Override
	public ArrayList<AddressVO> pageList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		ArrayList<AddressVO> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		list = (ArrayList) sqlSession.selectList("Address.selectMainAddressList", null, rowBounds);
		
		return list;
	}

	//공유 주소록 카운트
	@Override
	public int countShareAddressList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Address.listCountShare");
	}
	
	//공유 주소록 리스트
	@Override
	public ArrayList<AddressVO> sharePageList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		ArrayList<AddressVO> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		list = (ArrayList) sqlSession.selectList("Address.selectShareAddressList", null, rowBounds);
		
		return list;
	}
	
	//중요 주소록 카운트
	@Override
	public int countImportantAddressList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Address.importantListCount");
	}

	//중요 주소록 카운트
	@Override
	public ArrayList<AddressVO> importantPageList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		ArrayList<AddressVO> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		list = (ArrayList) sqlSession.selectList("Address.selectImportantAddressList", null, rowBounds);
		
		return list;
	}

	@Override
	public void deleteMainAddress(int contactsNo) {
		
		System.out.println(contactsNo);
		
		sqlSession.delete("Address.deleteMainAddress", contactsNo);
	}

//	@Override
//	public AddressVO selectOneMainAddress(SqlSessionTemplate sqlSession, int contactsNo) {
//
//		//List<AddressVO> address = sqlSession.selectList("Address.selectImportantAddressList", contactsNo);
//		AddressVO address = sqlSession.selectOne("Address.selectOneMainAddress", contactsNo);
//	//	AddressVO address = sqlSession.selectOne("Address.selectImportantAddressList", contactsNo);
//		
//		return address;
//	}

	


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
