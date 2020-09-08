package com.kh.itworks.projectManage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.projectManage.model.exception.InsertProjectException;
import com.kh.itworks.projectManage.model.exception.InsertReplyException;
import com.kh.itworks.projectManage.model.vo.Project;
import com.kh.itworks.projectManage.model.vo.ProjectPageInfo;
import com.kh.itworks.projectManage.model.vo.ProjectSearchCondition;
import com.kh.itworks.projectManage.model.vo.ProjectTaskReply;

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

	HashMap<String, Object> selectSearchPerson(SqlSessionTemplate sqlSession, HashMap<String, Object> searchCondition);

	ArrayList<Object> searchAllMember(SqlSessionTemplate sqlSession, int corpNo);

	ArrayList<Object> searchAllDept(SqlSessionTemplate sqlSession, int corpNo);

	int insertProject(SqlSessionTemplate sqlSession, HashMap<String, Object> project) throws InsertProjectException;

	int selectNewProjectPno(SqlSessionTemplate sqlSession, int mno);

	int insertProjectMember(SqlSessionTemplate sqlSession, HashMap<String, Object> projectMember) throws InsertProjectException;

	int insertFile(SqlSessionTemplate sqlSession, ArrayList<FileBox> fileArr) throws InsertProjectException;

	HashMap<String, Object> selectOneFile(SqlSessionTemplate sqlSession, String fileNo);

	int insertTask(SqlSessionTemplate sqlSession, HashMap<String, Object> projectInfo) throws InsertProjectException;

	HashMap<String, Object> selectOntTask(SqlSessionTemplate sqlSession, String pno);

	int insertReply(SqlSessionTemplate sqlSession, ProjectTaskReply replyInfo) throws InsertReplyException;

	int deleteReply(SqlSessionTemplate sqlSession, String tno);

}
