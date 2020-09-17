package com.kh.itworks.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.itworks.common.CommonUtils;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.exception.LoginFailedException;
import com.kh.itworks.member.model.service.MemberService;
import com.kh.itworks.member.model.vo.Member;

@SessionAttributes({"loginUser", "profile"})
@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	

	  
	//로그인
	@RequestMapping("login.me")
	public String loginCheck(Model model, Member m) {
	
		
		try {
		      Member loginUser = ms.loginMember(m);
		      FileBox menubarProfile = ms.getProfile(loginUser.getMno());
		      
		      model.addAttribute("loginUser", loginUser);
		      model.addAttribute("profile", menubarProfile);
		      
		      return "redirect:main.me";
		} catch(LoginFailedException e){
		      model.addAttribute("msg", e.getMessage());
		         
		      return "common/errorPage";
		}
	}
	
	//회원가입 폼
	@RequestMapping("/MemberjoinForm.me")
	public String showMemberJoinForm() {
		
		return "join/join";
	}
	
	
	//아이디 중복체크
	@RequestMapping("duplicationCheck.me")
	public void duplicationCheck(@RequestParam String userId, HttpServletResponse response) {
		
		Member m = ms.duplicationCheck(userId);
		
		//임의의 숫자 높게 줌
		int chk = 3000;
		//아이디 중복체크는 똑같은게 있으면 안 되는 조건!
		//중복되는 것이 없을 때  0 (중복체크 통과)
		if(m == null) {
			chk = 0;
		} else {
			chk = 1;
		}
		
		try {
			response.getWriter().print(chk);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	//회사코드 DB등록여부 체크
	@RequestMapping("corpNoCheck.me")
	public void corpNoCheck(@RequestParam int corpNo, HttpServletResponse response) {
		
		//return : 나를 호출한 것으로 값을 들고 돌아온 것임
		//m에는 DB에서 가져온 값 0 또는 1이 들어있다.
		int m = ms.corpNoCheck(corpNo);
		
//		System.out.println(m);
		
		//회사코드는 똑같은게 있어야 되는 조건!
		//중복되는 것이 있을 때 1 (중복체크 통과..)
		try {
			response.getWriter().print(m);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	//회원가입 insert 
	@RequestMapping(value="insert.me")
	public String insertMember(Model model, Member m) {
		
		ms.insertMember(m);
		
		return "login/login";
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:index.jsp";
	}
	
	@RequestMapping("goMyPage.me")
	public String goMyPage(Model model, @SessionAttribute("loginUser") Member loginUser) {
		
		Member userInfo = ms.selectUserInfo(loginUser.getMno());
	    FileBox menubarProfile = ms.getProfile(loginUser.getMno());

		
		System.out.println(userInfo);
		
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("profile", menubarProfile);
		
		return "myPage/myPage";
	}

	@RequestMapping("showMyPageCheckPwd.me")
	public String showMyPageCheckPwd() {
		return "myPage/checkPwd";
	}
	
	@RequestMapping("myPageCheckPwd.me")
	public ModelAndView myPageCheckPwd(ModelAndView mv, HttpServletRequest request) {
		
		String mno = request.getParameter("mno");
		String pwd = request.getParameter("pwd");
		
		HashMap<String, String> info = new HashMap<String, String>();
		
		info.put("mno", mno);
		info.put("pwd", pwd);
		
		boolean result = ms.myPageCheckPwd(info);
		
		mv.addObject("result", result);
		mv.setViewName("jsonView");
		
		
		return mv;
	}
	
	@RequestMapping("modifyUserInfo.me")
	public String modifyUserInfo(Member m) {
		
		System.out.println(m);
		
		int updateUserInfo = ms.updateUserInfo(m);
		
		return "goMyPage.me";
	}
	
	@ResponseBody
	@RequestMapping("uploadProfile.me")
	public void uploadProfile(HttpServletRequest request, MultipartFile file, @SessionAttribute("loginUser") Member loginUser) {
		
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
				profile.setMno(loginUser.getMno());
				profile.setFileType("MEMBER");
				profile.setCorp_no(loginUser.getCorpNo());
				profile.setExt(ext);
				profile.setOriginName(originFileName);
				profile.setChangeName(changeName);
				
				System.out.println(profile);
				
				int fileUploadResult = ms.uploadProfile(profile);
				
			} catch (IllegalStateException | IOException e) {
				//익셉션 발생할 경우 파일 삭제
				new File(filePath + "\\" + changeName + ext).delete();
				
			}
		}	
	}
}
