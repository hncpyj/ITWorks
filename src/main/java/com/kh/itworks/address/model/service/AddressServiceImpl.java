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
	public ArrayList<AddressVO> pageList(PageInfo pi, AddressVO address) {
		
		return ad.pageList(sqlSession, pi, address);
	}

	@Override
	public int countAddressList(AddressVO address) {
		
		return ad.countAddressList(sqlSession, address);
	}

	@Override
	public ArrayList<AddressVO> sharePageList(PageInfo pi,AddressVO address) {
		
		return ad.sharePageList(sqlSession, pi, address);
	}

	@Override
	public int countShareAddressList(AddressVO address) {
		
		return ad.countShareAddressList(sqlSession, address);
	}

	@Override
	public ArrayList<AddressVO> importPageList(PageInfo pi,AddressVO address) {
		
		return ad.importantPageList(sqlSession, pi, address);
	}

	@Override
	public int countImportantAddressList(AddressVO address) {
		
		return ad.countImportantAddressList(sqlSession, address);
	}

	@Override
	public void deleteMainAddress(int contactsNo) {
		
		ad.deleteMainAddress(contactsNo);
	}

	@Override
	public int changeConImportStatus(AddressVO address) {
		
		return ad.changeImportStatus(sqlSession, address);
	}

	@Override
	public AddressVO changeConfirm(AddressVO address) {
		
		return ad.confirmChange(sqlSession, address);
	}

	@Override
	public int updateAddress(AddressVO address) {
		
		return ad.updateAddress(sqlSession, address);
	}

}
