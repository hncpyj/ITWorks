package com.kh.itworks.projectManage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.projectManage.model.exception.SelectAllProjectListException;
import com.kh.itworks.projectManage.model.vo.Project;
import com.kh.itworks.projectManage.model.vo.ProjectPageInfo;
import com.kh.itworks.projectManage.model.vo.ProjectSearchCondition;

public interface ProjectService {

	int getListCount(Member loginUser);

	ArrayList<Project> selectProjectList(ProjectPageInfo pi, Member loginUser);

	int getSearchListCount(ProjectSearchCondition searchCondition, Member loginUser);

	ArrayList<Project> selectSearchProjectList(ProjectPageInfo pi, Member loginUser, ProjectSearchCondition searchCondition);

	int getOngoingListCount(Member loginUser);

	ArrayList<Project> selectOngoingProjectList(ProjectPageInfo pi, Member loginUser);

	int getSearchOngoingListCount(ProjectSearchCondition searchCondition, Member loginUser);

	ArrayList<Project> selectSearchOngoingProjectList(ProjectPageInfo pi, Member loginUser,
			ProjectSearchCondition searchCondition);

	int getFinishListCount(Member loginUser);

	ArrayList<Project> selectFinishProjectList(ProjectPageInfo pi, Member loginUser);

	int getSearchFinishListCount(ProjectSearchCondition searchCondition, Member loginUser);

	ArrayList<Project> selectSearchFinishProjectList(ProjectPageInfo pi, Member loginUser,
			ProjectSearchCondition searchCondition);

	HashMap<String, Object> selectOneProject(int pno);

	HashMap<String, Object> selectAllMemberDept(int corpNo);
}
