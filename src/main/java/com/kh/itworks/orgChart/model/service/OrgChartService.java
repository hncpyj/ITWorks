package com.kh.itworks.orgChart.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.orgChart.model.vo.DeptVO;

public interface OrgChartService {
	
	public ArrayList<DeptVO> selectDeptList(DeptVO dept);
	
}
