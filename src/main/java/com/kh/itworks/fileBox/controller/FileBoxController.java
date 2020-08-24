package com.kh.itworks.fileBox.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileBoxController {
	
	
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
	
	
	
	
}
