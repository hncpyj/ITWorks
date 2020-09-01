package com.kh.itworks.fileBox.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.itworks.common.CommonUtils;
import com.kh.itworks.fileBox.model.service.FileBoxService;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.fileBox.model.vo.Storage;

@Controller
public class FileBoxController {
	
	@Autowired
	private FileBoxService fbs;
	
	@RequestMapping("selectFirst.fb")
	   public String showFileBox() {

	      return "fileBox/fileBox";
	   }
	
	@RequestMapping("selectOne.fb")
	public String FileBoxDetail() {
		
		return "fileBox/fileDetail";
	}
	
	@RequestMapping("admin.fb")
	public String FileBoxAdmin() {
		
		return "fileBox/fileBoxAdmin";
	}
	
	@RequestMapping("uploadPage.fb")
	public String FileUploadPage() {
		
		return "fileBox/fileUpload";
	}
	
	@RequestMapping("upload.fb")
	public String FileUpload(Model model, FileBox fb, HttpServletRequest request, MultipartFile photo) {
		
//		Member loginUser = (Member)request.getSession().getAttribute("");
		
		System.out.println(model);
		System.out.println(fb);
		
		System.out.println(photo);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		System.out.println("root : " + root);
		
		String filePath = root + "/uploadFiles";
		
		System.out.println("filePath : " + filePath);
		
		//원본 이름 저장
		String originFileName = photo.getOriginalFilename();
		//확장자 따로 저장
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		//이름 바꾸기
		String changeName = CommonUtils.getRandomString();
		//파일 사이즈
		Long size = photo.getSize();
		
		
		fb.setOriginName(originFileName);
		fb.setFileType(ext);
		fb.setChangeName(changeName);
		fb.setFileSize(size);
		
		try {
			photo.transferTo(new File(filePath + "/" + changeName + ext));
			
			
			fbs.uploadFile(fb);
			
			
		} catch (IllegalStateException e) {
			new File(filePath + "/" + changeName + ext).delete();
			
			return "common/errorPage";
		} catch (IOException e) {
			new File(filePath + "/" + changeName + ext).delete();
			
			
			return "common/errorPage";
		}
		
		return "fileBox/fileDetail";
	}
	
	
}
