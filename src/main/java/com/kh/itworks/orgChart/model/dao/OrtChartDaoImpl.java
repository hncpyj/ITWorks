package com.kh.itworks.orgChart.model.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.orgChart.model.vo.DeptVO;

@Repository
public class OrtChartDaoImpl implements OrgChartDao{

	@Override
	public ArrayList<DeptVO> selectDeptList(SqlSessionTemplate sqlSession, DeptVO dept) {
				
		return (ArrayList) sqlSession.selectList("OrgChart.selectOrg", dept);
	}

}
