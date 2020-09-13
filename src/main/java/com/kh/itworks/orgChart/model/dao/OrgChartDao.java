package com.kh.itworks.orgChart.model.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.orgChart.model.vo.DeptVO;

public interface OrgChartDao {
	
	public ArrayList<DeptVO> selectDeptList(SqlSessionTemplate sqlSession, DeptVO dept);
	
	public ArrayList<DeptVO> selectCompanyDeptList(SqlSessionTemplate sqlSession, DeptVO dept);
	
	public int insertDept(SqlSessionTemplate sqlSession, DeptVO dept);
	
}
