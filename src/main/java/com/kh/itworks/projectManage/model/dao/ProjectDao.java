package com.kh.itworks.projectManage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.projectManage.model.vo.Project;
import com.kh.itworks.projectManage.model.vo.ProjectPageInfo;
import com.kh.itworks.projectManage.model.vo.ProjectSearchCondition;

public interface ProjectDao {

	int getListCount(SqlSessionTemplate sqlSession, Member loginUser);

	ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, ProjectPageInfo pi, Member loginUser);

	int getSearchListCount(SqlSessionTemplate sqlSession, ProjectSearchCondition searchCondition, Member loginUser);

	ArrayList<Project> selectSearchProjectList(SqlSessionTemplate sqlSession, ProjectPageInfo pi, Member loginUser,
			ProjectSearchCondition searchCondition);

	int getOngoingListCount(SqlSessionTemplate sqlSession, Member loginUser);

	ArrayList<Project> getOngoingListcount(SqlSessionTemplate sqlSession, ProjectPageInfo pi, Member loginUser);

	int getSearchOngoingListCount(SqlSessionTemplate sqlSession, ProjectSearchCondition searchCondition,
			Member loginUser);

	ArrayList<Project> selectSearchOngoingProjectList(SqlSessionTemplate sqlSession, ProjectPageInfo pi,
			Member loginUser, ProjectSearchCondition searchCondition);

	int getFinishListCount(SqlSessionTemplate sqlSession, Member loginUser);

	ArrayList<Project> selectFinishProjectList(SqlSessionTemplate sqlSession, ProjectPageInfo pi, Member loginUser);

	int getSearchFinishListCount(SqlSessionTemplate sqlSession, ProjectSearchCondition searchCondition,
			Member loginUser);

	ArrayList<Project> selectSearchFinishProjectList(SqlSessionTemplate sqlSession, ProjectPageInfo pi,
			Member loginUser, ProjectSearchCondition searchCondition);

	HashMap<String, Object> selectOneProject(SqlSessionTemplate sqlSession, int pno);

	HashMap<String, Object> selectAllMemberDept(SqlSessionTemplate sqlSession, int corpNo);

}
