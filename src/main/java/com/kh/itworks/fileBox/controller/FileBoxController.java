package com.kh.itworks.fileBox.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.itworks.common.CommonUtils;
import com.kh.itworks.fileBox.Pagination;
import com.kh.itworks.fileBox.model.service.FileBoxService;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.fileBox.model.vo.PageInfo;
import com.kh.itworks.fileBox.model.vo.Storage;
import com.kh.itworks.member.model.vo.Member;

@Controller
public class FileBoxController {
	
	@Autowired
	private FileBoxService fbs;
	
	@RequestMapping("selectFirst.fb")
	public String showFileBox(Model model, FileBox fb, HttpServletRequest request) {
		System.out.println("controller 넘어오니..?");
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = fbs.getListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<FileBox> list = fbs.selectFileList(pi);
			
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			
			return "fileBox/fileBox";
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			
			return "common/error";
		}
	}
	
	@RequestMapping("selectOne.fb")
	public String FileBoxDetail() {
		
		
		return "fileBox/fileDetail";
	}
	
	@RequestMapping("admin.fb")
	public String FileBoxAdmin() {
		
		return "fileBox/folderTree";
	}
	
	@RequestMapping("uploadPage.fb")
	public String FileUploadPage() {
		
		return "fileBox/fileUpload";
	}
	
	@RequestMapping("error.fb")
	public String errorPage() {
		
		return "common/error";
	}
	
	@RequestMapping("upload.fb")
	public String FileUpload(Model model, FileBox fb, HttpServletRequest request, MultipartFile file, @SessionAttribute("loginUser") Member loginUser) {
		
		
		
		System.out.println(model);
		System.out.println(fb);
		
		System.out.println(file);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		System.out.println("root : " + root);
		
		String filePath = root + "/uploadFiles/fileBox";
		
		System.out.println("filePath : " + filePath);
		
		//원본 이름 저장
		String originFileName = file.getOriginalFilename();
		//확장자 따로 저장
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		//이름 바꾸기
		String changeName = CommonUtils.getRandomString();
		//파일 사이즈
		Long size = file.getSize();
		
		
		
		
		fb.setOriginName(originFileName);
		fb.setChangeName(changeName);
		fb.setFilePath(filePath);
		fb.setFileSize(size);
		fb.setFileRole("999");
		fb.setCorp_no(loginUser.getCorpNo());
		fb.setFileType("fileBox");
		fb.setExt(ext);
		
		System.out.println(fb);
		try {
			file.transferTo(new File(filePath + "/" + changeName + ext));
			
			
			fbs.uploadFile(fb, loginUser);
			System.out.println(fb);
			
		} catch (IllegalStateException e) {
			new File(filePath + "/" + changeName + ext).delete();
			
			return "common/errorPage";
		} catch (IOException e) {
			new File(filePath + "/" + changeName + ext).delete();
			
			
			return "common/errorPage";
		}
		
		return "fileBox/fileDetail";
	}
	
	@RequestMapping("download.fb")
	public void FileDownload() {
		
	}
	
}
