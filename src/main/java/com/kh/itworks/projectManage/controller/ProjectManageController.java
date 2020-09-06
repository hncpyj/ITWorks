package com.kh.itworks.projectManage.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.itworks.common.CommonUtils;
import com.kh.itworks.common.Pagination;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.projectManage.model.exception.InsertProjectException;
import com.kh.itworks.projectManage.model.service.ProjectService;
import com.kh.itworks.projectManage.model.vo.Project;
import com.kh.itworks.projectManage.model.vo.ProjectPageInfo;
import com.kh.itworks.projectManage.model.vo.ProjectSearchCondition;


@Controller
@SessionAttributes("loginUser")
public class ProjectManageController {
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("selectAllProjectList.pm")
	public String selectAllProjectList(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		//int loginMno = loginUser.getMno();
		
		int listCount = projectService.getListCount(loginUser);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectProjectList(pi, loginUser);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/allProjectList";
		
	}
	
	@RequestMapping("searchAll.pm")
	public String searchAllProject(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		
		ProjectSearchCondition searchCondition = new ProjectSearchCondition();
		
		if(!request.getParameter("startDate").isEmpty()) {
			searchCondition.setStartDate(request.getParameter("startDate"));
		}
		if(!request.getParameter("endDate").isEmpty()) {
			searchCondition.setEndDate(request.getParameter("endDate"));
		}
		if(!request.getParameter("projectName").isEmpty()) {
			searchCondition.setProjectName(request.getParameter("projectName"));
		}
		if(!request.getParameter("progress").isEmpty()) {
			switch(request.getParameter("progress")) {
				case "schedule": searchCondition.setProgress("예정"); break;
				case "progress": searchCondition.setProgress("진행"); break;
				case "finish": searchCondition.setProgress("완료"); break;
				case "hold": searchCondition.setProgress("보류"); break;
				case "discard": searchCondition.setProgress("폐기"); break;
			}
		}
		if(!request.getParameter("writer").isEmpty()) {
			searchCondition.setWriter(request.getParameter("writer"));
		}
		if(!request.getParameter("charge").isEmpty()) {
			searchCondition.setCharge(request.getParameter("charge"));
		}
		if(!request.getParameter("join").isEmpty()) {
			searchCondition.setJoin(request.getParameter("join"));
		}
		
		searchCondition.setScMno(loginUser.getMno());

		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = projectService.getSearchListCount(searchCondition, loginUser);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectSearchProjectList(pi, loginUser, searchCondition);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/allProjectList";
	}

	@RequestMapping("ongoingProjectList.pm")
	public String ongoingProjectList(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = projectService.getOngoingListCount(loginUser);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectOngoingProjectList(pi, loginUser);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/ongoingProjectList";
	}
	
	@RequestMapping("searchOngoing.pm")
	public String searchOngoing(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		ProjectSearchCondition searchCondition = new ProjectSearchCondition();
		
		if(!request.getParameter("startDate").isEmpty()) {
			searchCondition.setStartDate(request.getParameter("startDate"));
		}
		if(!request.getParameter("endDate").isEmpty()) {
			searchCondition.setEndDate(request.getParameter("endDate"));
		}
		if(!request.getParameter("projectName").isEmpty()) {
			searchCondition.setProjectName(request.getParameter("projectName"));
		}
		if(!request.getParameter("writer").isEmpty()) {
			searchCondition.setWriter(request.getParameter("writer"));
		}
		if(!request.getParameter("charge").isEmpty()) {
			searchCondition.setCharge(request.getParameter("charge"));
		}
		if(!request.getParameter("join").isEmpty()) {
			searchCondition.setJoin(request.getParameter("join"));
		}
		
		searchCondition.setScMno(loginUser.getMno());

		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = projectService.getSearchOngoingListCount(searchCondition, loginUser);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectSearchOngoingProjectList(pi, loginUser, searchCondition);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/ongoingProjectList";
	}
	
	@RequestMapping("finishProjectList.pm")
	public String finishProjectList(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = projectService.getFinishListCount(loginUser);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectFinishProjectList(pi, loginUser);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/finishProjectList";
	}
	
	@RequestMapping("searchFinish.pm")
	public String searchFinish(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		ProjectSearchCondition searchCondition = new ProjectSearchCondition();
		
		if(!request.getParameter("startDate").isEmpty()) {
			searchCondition.setStartDate(request.getParameter("startDate"));
		}
		if(!request.getParameter("endDate").isEmpty()) {
			searchCondition.setEndDate(request.getParameter("endDate"));
		}
		if(!request.getParameter("projectName").isEmpty()) {
			searchCondition.setProjectName(request.getParameter("projectName"));
		}
		if(!request.getParameter("writer").isEmpty()) {
			searchCondition.setWriter(request.getParameter("writer"));
		}
		if(!request.getParameter("charge").isEmpty()) {
			searchCondition.setCharge(request.getParameter("charge"));
		}
		if(!request.getParameter("join").isEmpty()) {
			searchCondition.setJoin(request.getParameter("join"));
		}
		
		searchCondition.setScMno(loginUser.getMno());

		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = projectService.getSearchFinishListCount(searchCondition, loginUser);
		
		ProjectPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> projectList = projectService.selectSearchFinishProjectList(pi, loginUser, searchCondition);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pi", pi);
		
		return "projectManage/finishProjectList";
	}
	
	@RequestMapping("insertProjectForm.pm")
	public String showInsertProjectForm(Model model, @SessionAttribute("loginUser") Member loginUser) {
		
		HashMap<String, Object> allMemberDept = projectService.selectAllMemberDept(loginUser.getCorpNo());
		
		model.addAttribute("allMemberDept", allMemberDept);
		
		return "projectManage/insertProjectForm";
	}
	
	@RequestMapping("searchAllMember.pm")
	public void searchAllMember(Model model, @SessionAttribute("loginUser") Member loginUser) {
		
		ArrayList<Object> searchAllMember = projectService.searchAllMember(loginUser.getCorpNo());
		
		model.addAttribute("searchMember", searchAllMember);
	}
	
	@RequestMapping("searchAllDept.pm")
	public void searchAllDept(Model model, @SessionAttribute("loginUser") Member loginUser) {
		
		ArrayList<Object> searchAllDept = projectService.searchAllDept(loginUser.getCorpNo());
		System.out.println("searchAllDept : " + searchAllDept);
		
		model.addAttribute("searchAllDept", searchAllDept);
	}
	
	@RequestMapping("insertProject.pm")
	public String insertProject(Model model, Project project, MultipartHttpServletRequest request, HttpServletResponse response
						, MultipartFile[] files, @SessionAttribute("loginUser") Member loginUser) throws InsertProjectException, IOException {
		System.out.println("담당자 : " + request.getParameter("chargeMno"));
		System.out.println("참여자 : " + request.getParameter("participantMno"));
		System.out.println("열람권한 : " + request.getParameter("perusalMno"));
		System.out.println("관리부서코드 : " + request.getParameter("chargeDid"));
		
		//프로젝트 insert
		project.setCorpNo(loginUser.getCorpNo());
		project.setPdept(request.getParameter("chargeDid"));
		String writer = Integer.toString(loginUser.getMno());
		
		HashMap<String, Object> projectInfo = new HashMap<String, Object>();
		projectInfo.put("project", project);
		projectInfo.put("writer", writer);
		
		try {
			int insertProjectResult = projectService.insertProject(projectInfo);
		} catch(InsertProjectException e) {
			model.addAttribute("msg", e.getMessage());
		}
		
		//신규등록한 프로젝트 pno 가져오기
		int newPno = projectService.selectNewProjectPno(loginUser.getMno());
		System.out.println("find new pno : " + newPno);
		
		//프로젝트멤버 insert
		String charge = request.getParameter("chargeMno");
		String participant = request.getParameter("participantMno");
		String perusal = request.getParameter("perusalMno");
		
		ArrayList<Integer> participantArr = new ArrayList<Integer>();
		StringTokenizer participantSt = new StringTokenizer(participant, ", ");
		while(participantSt.hasMoreTokens()) {
			participantArr.add(Integer.parseInt(participantSt.nextToken()));
		}
		
		ArrayList<Integer> perusalArr = new ArrayList<Integer>();
		StringTokenizer perusalSt = new StringTokenizer(perusal, ", ");
		while(perusalSt.hasMoreTokens()) {
			perusalArr.add(Integer.parseInt(perusalSt.nextToken()));
		}
		
		HashMap<String, Object> projectMember = new HashMap<String, Object>();
		projectMember.put("pno", newPno);
		projectMember.put("charge", charge);
		projectMember.put("participant", participantArr);
		projectMember.put("perusal", perusalArr);
		
		try {
			int insertProjectMemberResult = projectService.insertProjectMember(projectMember);
		} catch(InsertProjectException e) {
			model.addAttribute("msg", e.getMessage());
		}
		
		//프로젝트 첨부파일 업로드 및 ATTACHMENT 테이블 insert
		
		ArrayList<FileBox> fileArr = new ArrayList<FileBox>();
		FileBox file = null;
		
		if(!files[0].isEmpty()) {
			//저장할 경로 지정(톰캣이 가지고 있는 webapp 폴더 밑 resources 폴더의 절대경로를 가져와라). 톰캣에서 관리하는 폴더는 하위폴더를 구분할 때 역슬러쉬(\)를 사용한다.
			String root = request.getSession().getServletContext().getRealPath("resources");
					
			System.out.println(root);
					
			//이스케이프 문자 주의할 것
			String filePath = root + "\\uploadFiles\\project";
					
			for(int i = 0; i < files.length; i++) {
				
				file = new FileBox();
				
				String originFileName = files[i].getOriginalFilename();
				//확장자만 따로 저장하기
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				
				String changeName = CommonUtils.getRandomString();
				
				Long size = files[i].getSize();
				
				file.setFileRole("999");
				file.setFilePath(filePath);
				file.setFileSize(size);
				file.setMno(loginUser.getMno());
				file.setPno(Integer.toString(newPno));
				file.setCorp_no(loginUser.getCorpNo());
				file.setExt(ext);
				file.setOriginName(originFileName);
				file.setChangeName(changeName);
				
				fileArr.add(file);
				
				try {
					files[i].transferTo(new File(filePath + "\\" + changeName + ext));

				} catch (IllegalStateException | IOException e) {
					//익셉션 발생할 경우 파일 삭제
					new File(filePath + "\\" + changeName + ext).delete();
				}
			}

			int insertFile = projectService.insertFile(fileArr);
		}
		
		HashMap<String, Object> projectDetail = projectService.selectOneProject(newPno);
		
		model.addAttribute("projectInfo", projectDetail);

//		//페이지 이동 시 alert창 출력
//		response.setContentType("text/html; charset=UTF-8");
//		 
//		PrintWriter out = response.getWriter();
//		 
//		out.println("<script>alert('프로젝트 등록이 완료되었습니다.');</script>");
//		 
//		out.flush();
		
		return "projectManage/projectDetail";
	}
	
	@RequestMapping("searchPerson.pm")
	public String searchPerson(Model model, HttpServletRequest request, @SessionAttribute("loginUser") Member loginUser) {
		
		HashMap<String, Object> searchCondition = new HashMap<String, Object>();
		
		searchCondition.put("name", request.getParameter("searchName"));
		searchCondition.put("corpNo", loginUser.getCorpNo());
		
		HashMap<String, Object> allMemberDept = projectService.selectSearchPerson(searchCondition);
		
//		mv.addObject("allMemberDept", allMemberDept);
//		mv.setViewName("projectManage/insertProjectForm");
		
		model.addAttribute("allMemberDept", allMemberDept);
		
		return "projectManage/insertProjectForm";
	}
	
	@RequestMapping("projectNotice.pm")
	public String showProjectNotice() {
		return "projectManage/projectNoticeList";
	}
	
	@RequestMapping("projectDetail.pm")
	public String showProjectDetail(Model model, HttpServletRequest request) {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println("pno : " + pno);
		
		HashMap<String, Object> projectInfo = projectService.selectOneProject(pno);
		System.out.println("projectinfo : " + projectInfo);
		
		model.addAttribute("projectInfo", projectInfo);
		
		return "projectManage/projectDetail";
	}
	
	@RequestMapping("projectFileDownload.pm")
	public void projectFileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String fileNo = request.getParameter("fileNo");
		
		HashMap<String, Object> file = projectService.selectOneFile(fileNo);
		
		//폴더에서 파일을 읽어들일 때 사용할 스트림 생성
		BufferedInputStream buf = null;
				
		//클라이언트로 내보낼 출력스트림 생성
		ServletOutputStream downOut = null;
				
		downOut = response.getOutputStream();
				
		//스트림으로 전송할 파일 객체 생성
		File downFile = new File((String) file.get("filePath") + "\\" + file.get("changeName") + file.get("ext"));
				
		response.setContentType("text/plane; charset=UTF-8");
				
		//한글파일명에 대한 인코딩 처리
		//강제적으로 다운로드 처리(버튼 누르면 바로 다운로드 진행하는 기능, 크롬은 강제다운로드만 진행함)
		response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(((String) file.get("originName")).getBytes("UTF-8"), "ISO-8859-1") + "\"");
		//attachment : 강제다운로드방식
				
		response.setContentLength((int)downFile.length());
				
		FileInputStream fin = new FileInputStream(downFile);
				
		buf = new BufferedInputStream(fin);
				
		int readBytes = 0;
				
		while((readBytes = buf.read()) != -1) {
			downOut.write(readBytes);
		}
			
		downOut.close();
		buf.close();
	}

	@RequestMapping("insertTaskForm.pm")
	public String showInsertTaskForm(Model model, HttpServletRequest request, @SessionAttribute("loginUser") Member loginUser) {
		
		String parentPno = request.getParameter("pno");
		
		HashMap<String, Object> allMemberDept = projectService.selectAllMemberDept(loginUser.getCorpNo());
		
		model.addAttribute("allMemberDept", allMemberDept);
		
		model.addAttribute("parentPno", parentPno);
		
		return "projectManage/insertTaskForm";
	}
	
	@RequestMapping("insertTask.pm")
	public String insertTask(Model model, Project project, MultipartHttpServletRequest request, HttpServletResponse response
								, MultipartFile[] files, @SessionAttribute("loginUser") Member loginUser) {
		
		System.out.println(project);
		String[] uniqueness = request.getParameterValues("uniqueness");
		System.out.println(uniqueness[0]);
		System.out.println(uniqueness[1]);
		
		return "";
	}
	
	
	@RequestMapping("taskDetail.pm")
	public String showTaskDetail() {
		return "projectManage/taskDetail";
	}
	
	@RequestMapping("insertSubTaskForm.pm")
	public String showInsertSubTaskForm() {
		return "projectManage/insertSubTaskForm";
	}
	
	@RequestMapping("subTaskDetail.pm")
	public String showSubTaskDetail() {
		return "projectManage/subTaskDetail";
	}
	
	@RequestMapping("insertProjectNotice.pm")
	public String showInsertProjectNoticeForm() {
		return "projectManage/insertProjectNoticeForm";
	}
	
	@RequestMapping("noticeDetail.pm")
	public String showNoticeDetail() {
		return "projectManage/noticeDetail";
	}
}
