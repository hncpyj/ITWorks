package com.kh.itworks.orgChart.model.service;

import java.util.ArrayList;
import java.util.List;

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

}
