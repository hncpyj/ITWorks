package com.kh.itworks.orgChart.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.orgChart.model.vo.DeptVO;

public interface OrgChartService {
	
	public ArrayList<DeptVO> selectDeptList(DeptVO dept);
	
	public ArrayList<DeptVO> selectCompanyDeptList(DeptVO dept);
	
	public int insertDept(DeptVO dept);
	
	public ArrayList<DeptVO> selectEmployees(DeptVO dept);
	
	public List<Map<String, Object>> selectDefaultList(DeptVO dept);
	
}
