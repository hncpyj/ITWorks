package com.kh.itworks.memberManage.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.itworks.common.CommonUtils;
import com.kh.itworks.common.PageInfo;
import com.kh.itworks.common.Pagination;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;
import com.kh.itworks.memberManage.model.service.MemberManageService;

@Controller
public class MemberManageController {

	@Autowired
	private MemberManageService mms;
	
	// 가입대기 직원 리스트 전체
	@RequestMapping("waitingToJoinList.mm")
	public String waitingToJoinList(HttpServletRequest request, @SessionAttribute("loginUser") Member loginUser, Model model) {
		int currentPage = 1;
		int corpNo = loginUser.getCorpNo();
		
		if(request.getParameter("currentPage") != null) {
			 currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 전체 리스트의 행의 갯수
		int listCount = mms.getListCount1(corpNo); 
		System.out.println("listCount1 : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = mms.selectMemberManageList(pi, corpNo);
		
		ArrayList<HashMap<String, String>> allDeptList = mms.selectAllDept(loginUser.getCorpNo());
		ArrayList<HashMap<String, String>> allJobList = mms.selectAllJob(loginUser.getCorpNo());
		
		System.out.println("dept : " + allDeptList);
		System.out.println("job : " + allJobList);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("listCount1", listCount);
		model.addAttribute("allDeptList", allDeptList);
		model.addAttribute("allJobList", allJobList);
		
		return "memberManage/waitingToJoinList";
	}

	@RequestMapping("modifyMemberInfo.mm")
	public String modifyMemberInfo(MultipartFile file, HttpServletRequest request, Member modifyInfo, @SessionAttribute("loginUser") Member loginUser) {
		
		System.out.println(modifyInfo);
		
		int updateMember = mms.updateMember(modifyInfo);
		
		if(!file.isEmpty()) {
			//저장할 경로 지정(톰캣이 가지고 있는 webapp 폴더 밑 resources 폴더의 절대경로를 가져와라). 톰캣에서 관리하는 폴더는 하위폴더를 구분할 때 역슬러쉬(\)를 사용한다.
			String root = request.getSession().getServletContext().getRealPath("resources");
					
			System.out.println(root);
					
			//이스케이프 문자 주의할 것
			String filePath = root + "\\uploadFiles\\profile";
					
			String originFileName = file.getOriginalFilename();
			//확장자만 따로 저장하기
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
					
			String changeName = CommonUtils.getRandomString();
			
			Long size = file.getSize();
					
			try {
				file.transferTo(new File(filePath + "\\" + changeName + ext));
				
				FileBox profile = new FileBox();
				
				profile.setFileRole("999");
				profile.setFilePath(filePath);
				profile.setFileSize(size);
				profile.setMno(modifyInfo.getMno());
				profile.setFileType("MEMBER");
				profile.setCorp_no(modifyInfo.getCorpNo());
				profile.setExt(ext);
				profile.setOriginName(originFileName);
				profile.setChangeName(changeName);
				
				int fileUploadResult = mms.uploadProfile(profile);
				
			} catch (IllegalStateException | IOException e) {
				//익셉션 발생할 경우 파일 삭제
				new File(filePath + "\\" + changeName + ext).delete();
				
			}
		}	
		
		return "redirect:waitingToJoinList.mm";
	}
	
	// 검색 조회
	@RequestMapping("searchMemberList.mm")
	public String searchMemberList() {
		
		return "";
	}
	
	
	// 가입대기 직원 리스트에서 수정버튼 누른 후 모달창
	@RequestMapping("updateJoinList.mm") 
	public String updateJoinList() {
	 
		return "memberManage/waitingToJoinList";
	
	}
	
	@PostMapping("signUpApproval.mm")
	public ModelAndView signUpApproval(ModelAndView mv, HttpServletRequest request) {
		
		String mno = request.getParameter("mno");
		
		int signUpResult = mms.signUpApproval(mno);
		
		mv.addObject("signUpResult", signUpResult);
		mv.setViewName("jsonView");
		
		return mv;
	}
	 
	// 가입 승인 버튼 누르면 가임된 직원 리스트로 내용이 이동함
	@RequestMapping("signUpApprovalList.mm") 
	public String signUpApprovalList(HttpServletRequest request, @SessionAttribute("loginUser") Member loginUser, Model model) {
		int currentPage = 1;
		int corpNo = loginUser.getCorpNo();
		
		if(request.getParameter("currentPage") != null) {
			 currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 전체 리스트의 행의 갯수
		int listCount = mms.getListCount2(corpNo); 
		System.out.println("listCount2 : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = mms.signUpApprovalList(pi, corpNo);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("listCount2", listCount);
		
		
		return "memberManage/signUpApprovalList";
	} 

	
	
	
}
