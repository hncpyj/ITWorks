package com.kh.itworks.address.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.address.model.vo.Address;

public interface AddressDao {

	int insertAddress(SqlSessionTemplate sqlSession, Address address);

}
