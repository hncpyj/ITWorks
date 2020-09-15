package com.kh.itworks.fileBox.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.itworks.fileBox.model.service.StorageService;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.fileBox.model.vo.Storage;
import com.kh.itworks.member.model.comparator.AscendingStgPath;
import com.kh.itworks.member.model.vo.Member;

import net.sf.json.JSONArray;

@Controller
public class StorageController {
	@Autowired
	private StorageService stgs;
	
//	@RequestMapping("admin.fb")
//	public String FileBoxAdmin(Model model, Storage stg, HttpServletRequest request) {
//		System.out.println("admin controller 넘어오니..?");
//		try {
//			int stgSize = stgs.getStgSize();
//			System.out.println("controller getStorageSize : " + stgSize);
//			
//			
//			ArrayList<Storage> list = stgs.selectFolderList();
//			System.out.println("controller : " + list);
//			request.setAttribute("list", list);
//			
//			return "fileBox/fileBoxAdmin";
//			
//		} catch (Exception e) {
//			request.setAttribute("message", e.getMessage());
//			
//			return "common/error";
//		}
////		return "fileBox/fileBoxAdmin";
//	}
	
	
	@RequestMapping("folderTree.fb")
	public String Foldertree(Model model, Storage stg, HttpServletRequest request) {
		System.out.println("admin controller 넘어오니..?");
		try {
//			double stgSize = stgs.getStgSize();
//			System.out.println("controller getStorageSize : " + stgSize);
			
			ArrayList<Storage> list = stgs.selectFolderList();
			
			//list json으로 parsing하기위해 json배열 할당
		    JSONArray jsonArray = new JSONArray();
		    
		    //json으로 파싱해서 모델에 리스트랑 같이 보내줌
		    model.addAttribute("list", list); 
		    model.addAttribute("jsonList", jsonArray.fromObject(list));
//			request.setAttribute("list", list);
			 
			return "fileBox/folderTree";
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			
			return "common/error";
		}
//		return "fileBox/fileBoxAdmin";
	}
	
	
	@RequestMapping("admin.fb")
	public String StorageAdmin(Model model, Storage stg, HttpServletRequest request) {
		System.out.println("******admin controller 넘어오니..?");
		try {
			double stgSize = stgs.getStgSize();
			System.out.println("controller getStorageSize : " + stgSize);
			stgSize /= 1024;
			
			
			System.out.println(stgSize);
			
			ArrayList<Storage> list = stgs.selectFolderList();
			
			System.out.println(list);
			//list json으로 parsing하기위해 json배열 할당
			JSONArray jsonArray = new JSONArray();
			
			//json으로 파싱해서 모델에 리스트랑 같이 보내줌
			model.addAttribute("list", list);
			model.addAttribute("jsonList", jsonArray.fromObject(list));
			request.setAttribute("list", list);
			request.setAttribute("stgSize", stgSize);
			
			return "fileBox/fileBoxAdmin";
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			
			return "common/error";
		}
//		return "fileBox/fileBoxAdmin";
	}
	
	

//	@RequestMapping("selectFolderTrash.fb")
//	public String selectFolderTrash(Model model, Storage stg, HttpServletRequest request, String stgNo, @SessionAttribute("loginUser") Member loginUser) {
//		System.out.println("controller restore fileNo : " + stg.getStgNo());
//		stg.setStgNo(stg.getStgNo());
//		int folderDelete = stgs.folderDelete(stg);
//		System.out.println("controller folderDelete : " + folderDelete);
////		return "fileBox/fileBox";
//		return StorageAdmin(model, stg, request);
//	}
	
	@ResponseBody
	@RequestMapping("folderRename.fb")
	public void folderRename(Storage stg, HttpServletRequest request, String stgNo, String stgName, @SessionAttribute("loginUser") Member loginUser) {
		System.out.println("controller folderRename folderNo : " + stg.getStgNo());
		System.out.println("controller folderRename folderName : " + stg.getStgName());
		stg.setStgNo(stg.getStgNo());
		stg.setStgName(stg.getStgName());
		int folderRename = stgs.folderRename(stg);
		System.out.println("===last controller folderRename : " + folderRename);
//		return "fileBox/fileBox";
//		return StorageAdmin(model, stg, request);
	}
	
	@ResponseBody
	@RequestMapping("folderDelete.fb")
	public void folderDelete(Storage stg, HttpServletRequest request, String stgNo, @SessionAttribute("loginUser") Member loginUser) {
//		System.out.println("controller folderDelete folderNo : " + stg.getStgNo());
//		stg.setStgNo(stg.getStgNo());
		int folderDelete = stgs.folderDelete(stgNo);
		System.out.println("===last controller folderDelete : " + folderDelete);
		
	}
	
	@RequestMapping("addNewFolder.fb")
	public String addNewFolder(Model model, Storage stg, HttpServletRequest request, String stgNo, String stgName, String stgPath, @SessionAttribute("loginUser") Member loginUser) {
		System.out.println("controller restore folderNo : " + stg.getStgNo());
		System.out.println("controller restore folderName : " + stg.getStgName());
		System.out.println("controller restore folderName : " + stg.getStgPath());
		stg.setStgNo(stg.getStgNo());
		stg.setStgName(stg.getStgName());
		stg.setStgPath(stg.getStgPath());
		int addNewFolder = stgs.addNewFolder(stg);
		System.out.println("controller addNewFolder : " + addNewFolder);
//		return "fileBox/fileBox";
		return StorageAdmin(model, stg, request);
	}
	
	
	
	
	
	
}