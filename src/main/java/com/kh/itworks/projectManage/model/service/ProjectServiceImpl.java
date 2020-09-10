package com.kh.itworks.projectManage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.projectManage.model.dao.ProjectDao;
import com.kh.itworks.projectManage.model.exception.InsertProjectException;
import com.kh.itworks.projectManage.model.exception.InsertReplyException;
import com.kh.itworks.projectManage.model.exception.PnoticeException;
import com.kh.itworks.projectManage.model.vo.Project;
import com.kh.itworks.projectManage.model.vo.ProjectMember;
import com.kh.itworks.projectManage.model.vo.ProjectNotice;
import com.kh.itworks.projectManage.model.vo.ProjectPageInfo;
import com.kh.itworks.projectManage.model.vo.ProjectSearchCondition;
import com.kh.itworks.projectManage.model.vo.ProjectTaskReply;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Override
	public int getListCount(Member loginUser) {
		return projectDao.getListCount(sqlSession, loginUser);
	}

	@Override
	public ArrayList<Project> selectProjectList(ProjectPageInfo pi, Member loginUser) {
		return projectDao.selectProjectList(sqlSession, pi, loginUser);
	}

	@Override
	public int getSearchListCount(ProjectSearchCondition searchCondition, Member loginUser) {
		return projectDao.getSearchListCount(sqlSession, searchCondition, loginUser);
	}

	@Override
	public ArrayList<Project> selectSearchProjectList(ProjectPageInfo pi, Member loginUser, ProjectSearchCondition searchCondition) {
		return projectDao.selectSearchProjectList(sqlSession, pi, loginUser, searchCondition);
	}

	@Override
	public int getOngoingListCount(Member loginUser) {
		return projectDao.getOngoingListCount(sqlSession, loginUser);
	}

	@Override
	public ArrayList<Project> selectOngoingProjectList(ProjectPageInfo pi, Member loginUser) {
		return projectDao.getOngoingListcount(sqlSession, pi, loginUser);
	}

	@Override
	public int getSearchOngoingListCount(ProjectSearchCondition searchCondition, Member loginUser) {
		return projectDao.getSearchOngoingListCount(sqlSession, searchCondition, loginUser);
	}

	@Override
	public ArrayList<Project> selectSearchOngoingProjectList(ProjectPageInfo pi, Member loginUser,
			ProjectSearchCondition searchCondition) {
		return projectDao.selectSearchOngoingProjectList(sqlSession, pi, loginUser, searchCondition);
	}

	@Override
	public int getFinishListCount(Member loginUser) {
		return projectDao.getFinishListCount(sqlSession, loginUser);
	}

	@Override
	public ArrayList<Project> selectFinishProjectList(ProjectPageInfo pi, Member loginUser) {
		return projectDao.selectFinishProjectList(sqlSession, pi, loginUser);
	}
	
	@Override
	public int getSearchFinishListCount(ProjectSearchCondition searchCondition, Member loginUser) {
		return projectDao.getSearchFinishListCount(sqlSession, searchCondition, loginUser);
	}

	@Override
	public ArrayList<Project> selectSearchFinishProjectList(ProjectPageInfo pi, Member loginUser, ProjectSearchCondition searchCondition) {
		return projectDao.selectSearchFinishProjectList(sqlSession, pi, loginUser, searchCondition);
	}

	@Override
	public HashMap<String, Object> selectOneProject(int pno) {
		return projectDao.selectOneProject(sqlSession, pno);
	}

	@Override
	public HashMap<String, Object> selectAllMemberDept(int corpNo) {
		return projectDao.selectAllMemberDept(sqlSession, corpNo);
	}

	@Override
	public HashMap<String, Object> selectSearchPerson(HashMap<String, Object> searchCondition) {
		return projectDao.selectSearchPerson(sqlSession, searchCondition);
	}

	@Override
	public ArrayList<Object> searchAllMember(int corpNo) {
		return projectDao.searchAllMember(sqlSession, corpNo);
	}

	@Override
	public ArrayList<Object> searchAllDept(int corpNo) {
		return projectDao.searchAllDept(sqlSession, corpNo);
	}

	@Override
	public int insertProject(HashMap<String, Object> project) throws InsertProjectException {
		return projectDao.insertProject(sqlSession, project);
	}

	@Override
	public int selectNewProjectPno(int mno) {
		return projectDao.selectNewProjectPno(sqlSession, mno);
	}

	@Override
	public int insertProjectMember(HashMap<String, Object> projectMember) throws InsertProjectException {
		return projectDao.insertProjectMember(sqlSession, projectMember);
	}

	@Override
	public int insertFile(ArrayList<FileBox> fileArr) throws InsertProjectException {
		return projectDao.insertFile(sqlSession, fileArr);
	}

	@Override
	public HashMap<String, Object> selectOneFile(String fileNo) {
		return projectDao.selectOneFile(sqlSession, fileNo);
	}

	@Override
	public int insertTask(HashMap<String, Object> projectInfo) throws InsertProjectException {
		return projectDao.insertTask(sqlSession, projectInfo);
	}

	@Override
	public HashMap<String, Object> selectOneTask(String pno) {
		return projectDao.selectOntTask(sqlSession, pno);
	}

	@Override
	public int insertReply(ProjectTaskReply replyInfo) throws InsertReplyException {
		return projectDao.insertReply(sqlSession, replyInfo);
	}

	@Override
	public int deleteReply(String tno) {
		return projectDao.deleteReply(sqlSession, tno);
	}

	@Override
	public int updateProject(HashMap<String, Object> updateInfo) {
		return projectDao.updateProject(sqlSession, updateInfo);
	}

	@Override
	public int deleteTask(String pno) {
		int result = projectDao.deleteTask(sqlSession, pno);
		
		return result;
	}

	@Override
	public ArrayList<ProjectMember> selectWriterChargeMno(String pno) {
		return projectDao.selectWriterChargeMno(sqlSession, pno);
	}

	@Override
	public ArrayList<ProjectNotice> selectNoticeList(String pno) {
		return projectDao.selectNoticeList(sqlSession, pno);
	}

	@Override
	public int getPnoticeListCount(String pno) {
		return projectDao.getPnoticeListCount(sqlSession, pno);
	}

	@Override
	public HashMap<String, Object> selectOneNotice(String nno) throws PnoticeException {
		HashMap<String, Object> noticeInfo = new HashMap<String, Object>();
		
		int updateCountResult = projectDao.updateCount(sqlSession, nno);
		
		ProjectNotice notice = projectDao.selectOneNotice(sqlSession, nno);
		ArrayList<FileBox> files = projectDao.selectPnoticeFiles(sqlSession, nno);
		
		noticeInfo.put("notice", notice);
		noticeInfo.put("files", files);
		
		return noticeInfo;
	}

	@Override
	public int insertNotice(ProjectNotice notice){
		
		String pmemberId = projectDao.selectPmemberId(sqlSession, notice);
		
		notice.setPmemberId(pmemberId);
		
		int insertNotice = projectDao.insertNotice(sqlSession, notice);
		
		return 0;
	}

	@Override
	public String selectNewNoticeNno() {
		String nno = projectDao.selectnewNno(sqlSession);
		return nno;
	}

	@Override
	public int updateNotice(ProjectNotice notice, ArrayList<FileBox> fileArr) {
		return projectDao.updateNotice(sqlSession, notice, fileArr);
	}

	@Override
	public int deleteNotice(String nno) {
		return projectDao.deleteNotice(sqlSession, nno);
	}


}
