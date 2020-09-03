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
import com.kh.itworks.projectManage.model.vo.Project;
import com.kh.itworks.projectManage.model.vo.ProjectMember;
import com.kh.itworks.projectManage.model.vo.ProjectPageInfo;
import com.kh.itworks.projectManage.model.vo.ProjectSearchCondition;

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
		
		HashMap<String, Object> allProjectInfo = new HashMap<String, Object>();
		
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
		Project project = sqlSession.selectOne("Project.selectOneProject", pno);
		ArrayList<ProjectMember> member = (ArrayList) sqlSession.selectList("Project.selectMemberList", pno);
		
		projectInfo.put("project", project);
		projectInfo.put("member", member);
		
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

}
