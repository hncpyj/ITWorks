package com.kh.itworks.address.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.address.model.vo.Address;

@Repository
public class AddressDaoImpl implements AddressDao{

	@Override
	public int insertAddress(SqlSessionTemplate sqlSession, Address address) {

		return sqlSession.insert("Address.insertAddress", address);
	}

}
