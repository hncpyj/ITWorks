package com.kh.itworks.orgChart.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.itworks.orgChart.model.dao.OrgChartDao;
import com.kh.itworks.orgChart.model.vo.DeptVO;

@Service
public class OrgChartServiceImpl implements OrgChartService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OrgChartDao ocd;

	@Override
	public ArrayList<DeptVO> selectDeptList(DeptVO dept) {

		return ocd.selectDeptList(sqlSession, dept);
	}

	@Override
	public ArrayList<DeptVO> selectCompanyDeptList(DeptVO dept) {
	
		return ocd.selectCompanyDeptList(sqlSession, dept);
	}

	@Override
	public int insertDept(DeptVO dept) {
		
		return ocd.insertDept(sqlSession, dept);
	}

	@Override
	public ArrayList<DeptVO> selectEmployees(DeptVO dept) {

		return ocd.selectMembersList(sqlSession, dept);
	}

	@Override
	public List<Map<String, Object>> selectDefaultList(DeptVO dept) {
		
		return ocd.selectDeptCount(sqlSession, dept);
	}

}
