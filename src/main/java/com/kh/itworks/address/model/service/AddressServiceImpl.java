package com.kh.itworks.address.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.address.model.dao.AddressDao;
import com.kh.itworks.address.model.vo.Address;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressDao ad;

	@Override
	public int insertAddress(Address address) {

		return ad.insertAddress(sqlSession, address);
	}
	
}
