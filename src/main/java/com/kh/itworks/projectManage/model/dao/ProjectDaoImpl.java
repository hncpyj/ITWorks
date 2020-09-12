package com.kh.itworks.projectManage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.dept.model.vo.Dept;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.projectManage.model.exception.InsertProjectException;
import com.kh.itworks.projectManage.model.exception.InsertReplyException;
import com.kh.itworks.projectManage.model.exception.PnoticeException;
import com.kh.itworks.projectManage.model.vo.Project;
import com.kh.itworks.projectManage.model.vo.ProjectMember;
import com.kh.itworks.projectManage.model.vo.ProjectNotice;
import com.kh.itworks.projectManage.model.vo.ProjectPageInfo;
import com.kh.itworks.projectManage.model.vo.ProjectSearchCondition;
import com.kh.itworks.projectManage.model.vo.ProjectTaskReply;

@Repository
public class ProjectDaoImpl implements ProjectDao{

	@Override
	public int getListCount(SqlSessionTemplate sqlSession, Member loginUser) {
		int result = 0;
		
		if(loginUser.getRid().equals("admin")) {
			result = sqlSession.selectOne("Project.selectAdminListCount");
		} else {
			result = sqlSession.selectOne("Project.selectListCount", loginUser.getMno());
		}
		
		return result;
	}

	@Override
	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, ProjectPageInfo pi, Member loginUser) {
		
		ArrayList<Project> allProjectList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
//		HashMap<String, Object> allProjectInfo = new HashMap<String, Object>();
		
		if(loginUser.getRid().equals("admin")) {
			allProjectList = (ArrayList) sqlSession.selectList("Project.selectAdminProjectList", null, rowBounds);
		} else {
			allProjectList = (ArrayList) sqlSession.selectList("Project.selectAllProjectList", loginUser.getMno(), rowBounds);
		}
		
		return allProjectList;
	}

	@Override
	public int getSearchListCount(SqlSessionTemplate sqlSession, ProjectSearchCondition searchCondition, @Param("loginUser") Member loginUser) {

		int result = 0;
		
		if(loginUser.getRid().equals("admin")) {
			result = sqlSession.selectOne("Project.selectAdminSearchListCount", searchCondition);
		} else {
			result = sqlSession.selectOne("Project.selectSearchListCount", searchCondition);
		}
		return result;
	}

	@Override
	public ArrayList<Project> selectSearchProjectList(SqlSessionTemplate sqlSession, ProjectPageInfo pi,
			Member loginUser, ProjectSearchCondition searchCondition) {
		
		searchCondition.setScMno(loginUser.getMno());
		
		ArrayList<Project> allProjectList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		if(loginUser.getRid().equals("admin")) {
			allProjectList = (ArrayList) sqlSession.selectList("Project.selectAdminSearchProjectList", searchCondition, rowBounds);
		} else {
			allProjectList = (ArrayList) sqlSession.selectList("Project.selectAllSearchProjectList", searchCondition, rowBounds);
		}

		return allProjectList;
	}

	@Override
	public int getOngoingListCount(SqlSessionTemplate sqlSession, Member loginUser) {
		int result = 0;
		
		if(loginUser.getRid().equals("admin")) {
			result = sqlSession.selectOne("Project.selectAdminOngoingListCount");
		} else {
			result = sqlSession.selectOne("Project.selectOngoingListCount", loginUser.getMno());
		}
		
		return result;
	}

	@Override
	public ArrayList<Project> getOngoingListcount(SqlSessionTemplate sqlSession, ProjectPageInfo pi, Member loginUser) {
		ArrayList<Project> projectList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());;
		
		if(loginUser.getRid().equals("admin")) {
			projectList = (ArrayList) sqlSession.selectList("Project.selectAdminOngoingProjectList", null, rowBounds);
		} else {
			projectList = (ArrayList) sqlSession.selectList("Project.selectOngoingProjectList", loginUser.getMno(), rowBounds);
		}
		return projectList;
	}

	@Override
	public int getSearchOngoingListCount(SqlSessionTemplate sqlSession, ProjectSearchCondition searchCondition,
			Member loginUser) {
		int result = 0;
		
		if(loginUser.getRid().equals("admin")) {
			result = sqlSession.selectOne("Project.selectAdminSearchOngoingListCount", searchCondition);
		} else {
			result = sqlSession.selectOne("Project.selectSearchOngoinListCount", searchCondition);
		}
		return result;
	}

	@Override
	public ArrayList<Project> selectSearchOngoingProjectList(SqlSessionTemplate sqlSession, ProjectPageInfo pi,
			Member loginUser, ProjectSearchCondition searchCondition) {
		searchCondition.setScMno(loginUser.getMno());
		
		ArrayList<Project> allProjectList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		if(loginUser.getRid().equals("admin")) {
			allProjectList = (ArrayList) sqlSession.selectList("Project.selectAdminSearchOngoingProjectList", searchCondition, rowBounds);
		} else {
			allProjectList = (ArrayList) sqlSession.selectList("Project.selectSearchOngoingProjectList", searchCondition, rowBounds);
		}

		return allProjectList;
	}
	
	@Override
	public int getFinishListCount(SqlSessionTemplate sqlSession, Member loginUser) {
		int result = 0;
		
		if(loginUser.getRid().equals("admin")) {
			result = sqlSession.selectOne("Project.selectAdminFinishListCount");
		} else {
			result = sqlSession.selectOne("Project.selectFinishListCount", loginUser.getMno());
		}
		
		return result;
	}

	@Override
	public ArrayList<Project> selectFinishProjectList(SqlSessionTemplate sqlSession, ProjectPageInfo pi, Member loginUser) {
		ArrayList<Project> projectList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());;
		
		if(loginUser.getRid().equals("admin")) {
			projectList = (ArrayList) sqlSession.selectList("Project.selectAdminFinishProjectList", null, rowBounds);
		} else {
			projectList = (ArrayList) sqlSession.selectList("Project.selectFinishProjectList", loginUser.getMno(), rowBounds);
		}
		return projectList;
	}
	
	@Override
	public int getSearchFinishListCount(SqlSessionTemplate sqlSession, ProjectSearchCondition searchCondition,
			Member loginUser) {
		int result = 0;
		
		if(loginUser.getRid().equals("admin")) {
			result = sqlSession.selectOne("Project.selectAdminSearchFinishListCount", searchCondition);
		} else {
			result = sqlSession.selectOne("Project.selectSearchFinishListCount", searchCondition);
		}
		return result;
	}

	@Override
	public ArrayList<Project> selectSearchFinishProjectList(SqlSessionTemplate sqlSession, ProjectPageInfo pi,
			Member loginUser, ProjectSearchCondition searchCondition) {
		searchCondition.setScMno(loginUser.getMno());
		
		ArrayList<Project> allProjectList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		if(loginUser.getRid().equals("admin")) {
			allProjectList = (ArrayList) sqlSession.selectList("Project.selectAdminSearchFinishProjectList", searchCondition, rowBounds);
		} else {
			allProjectList = (ArrayList) sqlSession.selectList("Project.selectSearchFinishProjectList", searchCondition, rowBounds);
		}

		return allProjectList;
	}

	@Override
	public HashMap<String, Object> selectOneProject(SqlSessionTemplate sqlSession, int pno) {

		HashMap<String, Object> projectInfo = new HashMap<String, Object>();
		HashMap<String,Object> project = sqlSession.selectOne("Project.selectOneProject", pno);
		ArrayList<ProjectMember> member = (ArrayList) sqlSession.selectList("Project.selectMemberList", pno);
		ArrayList<FileBox> files = (ArrayList) sqlSession.selectList("Project.selectFiles", pno);
		ArrayList<Project> task = (ArrayList) sqlSession.selectList("Project.selectTaskList", pno);
		ArrayList<Project> subTask = (ArrayList) sqlSession.selectList("Project.selectSubTaskList", pno);
		System.out.println("subtask : " + subTask);
		
		projectInfo.put("project", project);
		projectInfo.put("member", member);
		projectInfo.put("files", files);
		projectInfo.put("task", task);
		projectInfo.put("subTask", subTask);
		
		return projectInfo;
	}

	@Override
	public HashMap<String, Object> selectAllMemberDept(SqlSessionTemplate sqlSession, int corpNo) {

		HashMap<String, Object> allMemberDept = new HashMap<String, Object>();
		
		ArrayList<Object> allMember =  (ArrayList) sqlSession.selectList("Project.selectAllMember", corpNo);
		
		ArrayList<Dept> allDept = (ArrayList) sqlSession.selectList("Project.selectAllDept", corpNo);
		
		allMemberDept.put("allMember", allMember);
		allMemberDept.put("allDept", allDept);
		
		return allMemberDept;
	}

	@Override
	public HashMap<String, Object> selectSearchPerson(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchCondition) {

		HashMap<String, Object> searchMemberDept = new HashMap<String, Object>();
		
		ArrayList<Object> allMember = (ArrayList) sqlSession.selectList("Project.selectSearchPerson", searchCondition);
		
		searchMemberDept.put("allMember", allMember);
		
		return searchMemberDept;
	}

	@Override
	public ArrayList<Object> searchAllMember(SqlSessionTemplate sqlSession, int corpNo) {
		
		ArrayList<Object> allMember =  (ArrayList) sqlSession.selectList("Project.selectAllMember", corpNo);
		
		return allMember;
	}

	@Override
	public ArrayList<Object> searchAllDept(SqlSessionTemplate sqlSession, int corpNo) {
		ArrayList<Object> allDept = (ArrayList) sqlSession.selectList("Project.selectAllDept", corpNo);
		
		return allDept;
	}

	@Override
	public int insertProject(SqlSessionTemplate sqlSession, HashMap<String, Object> project) throws InsertProjectException {
		int insertProjectResult = sqlSession.insert("Project.insertProject", project);
		
		if(insertProjectResult == 0) {
			throw new InsertProjectException("프로젝트 등록 실패");
		}
		
		return insertProjectResult;
	}

	@Override
	public int selectNewProjectPno(SqlSessionTemplate sqlSession, int mno) {
		int newProjectPno = sqlSession.selectOne("Project.selectNewProjectPno", mno);
		
		return newProjectPno;
	}

	@Override
	public int insertProjectMember(SqlSessionTemplate sqlSession, HashMap<String, Object> projectMember) throws InsertProjectException {
		int insertProjectMemberResult = sqlSession.insert("Project.insertProjectMember", projectMember);
		
		System.out.println("result : " + insertProjectMemberResult);
		
		if(insertProjectMemberResult == 0) {
			throw new InsertProjectException("프로젝트 멤버 등록 실패");
		}
		
		return insertProjectMemberResult;
	}

	@Override
	public int insertFile(SqlSessionTemplate sqlSession, ArrayList<FileBox> fileArr) throws InsertProjectException {
		int insertFileResult = sqlSession.insert("Project.insertFile", fileArr);
		
		if(insertFileResult == 0) {
			throw new InsertProjectException("파일등록실패");
		}
		
		return insertFileResult;
	}

	@Override
	public HashMap<String, Object> selectOneFile(SqlSessionTemplate sqlSession, String fileNo) {
		HashMap<String, Object> file = sqlSession.selectOne("Project.selectOneFile", fileNo);
		return file;
	}

	@Override
	public int insertTask(SqlSessionTemplate sqlSession, HashMap<String, Object> projectInfo) throws InsertProjectException {
		
		int insertTaskResult = sqlSession.insert("Project.insertTask", projectInfo);
		
		if(insertTaskResult == 0) {
			throw new InsertProjectException("파일등록실패");
		}
		
		return insertTaskResult;
	}

	@Override
	public HashMap<String, Object> selectOntTask(SqlSessionTemplate sqlSession, String pno) {
		
		HashMap<String, Object> taskInfo = new HashMap<String, Object>();
		
		HashMap<String, Object> task = sqlSession.selectOne("Project.selectOneTask", pno);
		ArrayList<ProjectMember> taskMember = (ArrayList) sqlSession.selectList("Project.selectMemberList", pno);
		ArrayList<ProjectTaskReply> reply = (ArrayList) sqlSession.selectList("Project.selectReply", pno);
		ArrayList<Project> subTask = (ArrayList) sqlSession.selectList("Project.selectSubTaskList2", pno);
		ArrayList<FileBox> files = (ArrayList) sqlSession.selectList("Project.selectFiles", pno);
		
		taskInfo.put("task", task);
		taskInfo.put("member", taskMember);
		taskInfo.put("reply", reply);
		taskInfo.put("subTask", subTask);
		taskInfo.put("files", files);
		
		return taskInfo;
	}

	@Override
	public int insertReply(SqlSessionTemplate sqlSession, ProjectTaskReply replyInfo) throws InsertReplyException {
		
		ArrayList<Integer> pmemberId = (ArrayList) sqlSession.selectList("Project.selectPmemberId", replyInfo);
		
		replyInfo.setPmemberId(Integer.toString(pmemberId.get(0)));

		int insertReplyResult = sqlSession.insert("Project.insertReply", replyInfo);

		if(insertReplyResult == 0) {
			throw new InsertReplyException("댓글 입력 실패");
		}
		
		return insertReplyResult;
	}

	@Override
	public int deleteReply(SqlSessionTemplate sqlSession, String tno) {
		int deleteResult = sqlSession.update("Project.deleteReply", tno);
		return deleteResult;
	}

	@Override
	public int updateProject(SqlSessionTemplate sqlSession, HashMap<String, Object> updateInfo) {
		
		int updateProject = sqlSession.update("Project.updateProject", updateInfo.get("project"));
		int updatePmember = sqlSession.update("Project.updateSetStatusN", updateInfo.get("projectMember"));
		int updatePmember2 = sqlSession.insert("Project.insertProjectMember", updateInfo.get("projectMember"));
		
		System.out.println("파일 : " + updateInfo.get("files"));
		
		if(updateInfo.get("files").toString().length() > 2) {
			int fileUpdate = sqlSession.update("Project.updateSetStatusNFile", updateInfo.get("pno"));
			int fileUpdate2 = sqlSession.insert("Project.insertFile", updateInfo.get("files"));
		}
		
		return 0;
	}

	@Override
	public int deleteTask(SqlSessionTemplate sqlSession, String pno) {
		int result = sqlSession.update("Project.deleteTask", pno);
		return result;
	}

	@Override
	public ArrayList<ProjectMember> selectWriterChargeMno(SqlSessionTemplate sqlSession, String pno) {
		ArrayList<ProjectMember> member = (ArrayList) sqlSession.selectList("Project.selectMemberList", pno);
		
		for(int i = 0; i < member.size(); i++) {
			if(member.get(i).getProle().equals("열람권한") || member.get(i).getProle().equals("참여자")) {
				member.remove(i);
			}
		}
		
		System.out.println(member);
		
		return member;
	}

	@Override
	public ArrayList<ProjectNotice> selectNoticeList(SqlSessionTemplate sqlSession, String pno) {
		
		ArrayList<ProjectNotice> notice = (ArrayList) sqlSession.selectList("Project.selectNoticeList", pno);
		return notice;
	}

	@Override
	public int getPnoticeListCount(SqlSessionTemplate sqlSession, String pno) {
		int result = sqlSession.selectOne("Project.getPnoticeListCount", pno);
		return result;
	}

	@Override
	public ProjectNotice selectOneNotice(SqlSessionTemplate sqlSession, String nno) {
		ProjectNotice notice = sqlSession.selectOne("Project.selectOneNotice", nno);
		System.out.println("selectOneNotice : " + notice);
		return notice;
	}

	@Override
	public int updateCount(SqlSessionTemplate sqlSession, String nno) throws PnoticeException {

		int updateCountResult = sqlSession.update("Project.updateCount", nno);
		
		if(updateCountResult <= 0) {
			throw new PnoticeException("게시물 조회수 증가 실패");
		}
		return updateCountResult;
	}

	@Override
	public ArrayList<FileBox> selectPnoticeFiles(SqlSessionTemplate sqlSession, String nno) {
		ArrayList<FileBox> files = (ArrayList)sqlSession.selectList("Project.selectPnoticeFiles", nno);
		return files;
	}

	@Override
	public String selectPmemberId(SqlSessionTemplate sqlSession, ProjectNotice notice) {
		String pmemberId = sqlSession.selectOne("Project.selectNoticePmemberId", notice);
		return pmemberId;
	}

	@Override
	public int insertNotice(SqlSessionTemplate sqlSession, ProjectNotice notice) {
		int result = sqlSession.insert("Project.insertProjectNotice", notice);
		return result;
	}

	@Override
	public String selectnewNno(SqlSessionTemplate sqlSession) {
		String nno = sqlSession.selectOne("Project.selectNewNno");
		return nno;
	}

	@Override
	public int updateNotice(SqlSessionTemplate sqlSession, ProjectNotice notice, ArrayList<FileBox> fileArr) {
		int updateNotice = sqlSession.update("Project.updateNotice", notice);
		
		if(!fileArr.isEmpty()) {
			int fileUpdate = sqlSession.update("Project.updateNoticeSetStatusNFile", fileArr.get(0).getpNoticeNo());
			int fileUpdate2 = sqlSession.insert("Project.insertFile", fileArr);
		}
		return 0;
	}

	@Override
	public int deleteNotice(SqlSessionTemplate sqlSession, String nno) {
		int deleteNotice = sqlSession.update("Project.deleteNotice", nno);
		return deleteNotice;
	}

}
