package com.kh.itworks.projectManage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.itworks.common.PageInfo;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.projectManage.model.exception.InsertProjectException;
import com.kh.itworks.projectManage.model.exception.InsertReplyException;
import com.kh.itworks.projectManage.model.exception.PnoticeException;
import com.kh.itworks.projectManage.model.vo.Project;
import com.kh.itworks.projectManage.model.vo.ProjectMember;
import com.kh.itworks.projectManage.model.vo.ProjectNotice;
import com.kh.itworks.projectManage.model.vo.ProjectSearchCondition;
import com.kh.itworks.projectManage.model.vo.ProjectTaskReply;

public interface ProjectDao {

	int getListCount(SqlSessionTemplate sqlSession, Member loginUser);

	ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, PageInfo pi, Member loginUser);

	int getSearchListCount(SqlSessionTemplate sqlSession, ProjectSearchCondition searchCondition, Member loginUser);

	ArrayList<Project> selectSearchProjectList(SqlSessionTemplate sqlSession, PageInfo pi, Member loginUser,
			ProjectSearchCondition searchCondition);

	int getOngoingListCount(SqlSessionTemplate sqlSession, Member loginUser);

	ArrayList<Project> getOngoingListcount(SqlSessionTemplate sqlSession, PageInfo pi, Member loginUser);

	int getSearchOngoingListCount(SqlSessionTemplate sqlSession, ProjectSearchCondition searchCondition,
			Member loginUser);

	ArrayList<Project> selectSearchOngoingProjectList(SqlSessionTemplate sqlSession, PageInfo pi,
			Member loginUser, ProjectSearchCondition searchCondition);

	int getFinishListCount(SqlSessionTemplate sqlSession, Member loginUser);

	ArrayList<Project> selectFinishProjectList(SqlSessionTemplate sqlSession, PageInfo pi, Member loginUser);

	int getSearchFinishListCount(SqlSessionTemplate sqlSession, ProjectSearchCondition searchCondition,
			Member loginUser);

	ArrayList<Project> selectSearchFinishProjectList(SqlSessionTemplate sqlSession, PageInfo pi,
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

	int updateProject(SqlSessionTemplate sqlSession, HashMap<String, Object> updateInfo);

	int deleteTask(SqlSessionTemplate sqlSession, String pno);

	ArrayList<ProjectMember> selectWriterChargeMno(SqlSessionTemplate sqlSession, String pno);

	ArrayList<ProjectNotice> selectNoticeList(SqlSessionTemplate sqlSession, String pno);

	int getPnoticeListCount(SqlSessionTemplate sqlSession, String pno);

	ProjectNotice selectOneNotice(SqlSessionTemplate sqlSession, String nno);

	int updateCount(SqlSessionTemplate sqlSession, String nno) throws PnoticeException;

	ArrayList<FileBox> selectPnoticeFiles(SqlSessionTemplate sqlSession, String nno);

	String selectPmemberId(SqlSessionTemplate sqlSession, ProjectNotice notice);

	int insertNotice(SqlSessionTemplate sqlSession, ProjectNotice notice);

	String selectnewNno(SqlSessionTemplate sqlSession);

	int updateNotice(SqlSessionTemplate sqlSession, ProjectNotice notice, ArrayList<FileBox> fileArr);

	int deleteNotice(SqlSessionTemplate sqlSession, String nno);

}
