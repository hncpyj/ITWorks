package com.kh.itworks.address.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.itworks.address.model.exception.AddressMainSelectListCountException;
import com.kh.itworks.address.model.exception.AddressMainSelectListException;
import com.kh.itworks.address.model.service.AddressService;
import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.PageInfo;
import com.kh.itworks.address.model.vo.Pagination;
import com.kh.itworks.member.model.vo.Member;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService as;
	
	@RequestMapping("/insert.ad")
	public String insertAddress(Model model, AddressVO address, @SessionAttribute("loginUser") Member loginUser) {

		address.setCorpNo(loginUser.getCorpNo());
		address.setmNo(loginUser.getMno());
		int result = as.insertAddress(address);

		return "redirect:mainAddress.ad";
		
	}
	
	@RequestMapping("/mainAddress.ad")
	public String addressList(HttpServletRequest request, HttpServletResponse response,  AddressVO address,  @SessionAttribute("loginUser") Member loginUser) 
			throws AddressMainSelectListCountException, AddressMainSelectListException {

		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		address.setCorpNo(loginUser.getCorpNo());
		address.setmNo(loginUser.getMno());
		int listCount = as.countAddressList(address);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<AddressVO> list = as.pageList(pi, address);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("listCount", listCount);
						
		return "address/mainAddress";
	}
	
	@RequestMapping("/importantAddress.ad")
	public String importantAddress(HttpServletRequest request, HttpServletResponse response,  AddressVO address, @SessionAttribute("loginUser") Member loginUser) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
			
		address.setCorpNo(loginUser.getCorpNo());
		address.setmNo(loginUser.getMno());
		int listCount = as.countImportantAddressList(address);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<AddressVO> list = as.importPageList(pi, address);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("listCount", listCount);
		
		return "address/importantAddress";
		
	}
	
	@RequestMapping("/shareAddress.ad")
	public String shareAddress(HttpServletRequest request, HttpServletResponse response,  AddressVO address, @SessionAttribute("loginUser") Member loginUser) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage ") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
			
		address.setCorpNo(loginUser.getCorpNo());
		address.setmNo(loginUser.getMno());
		int listCount = as.countShareAddressList(address);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<AddressVO> list = as.sharePageList(pi, address);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("listCount", listCount);
		
		return "address/shareAddress";
	}

	@RequestMapping("/delete.ad")
	public String deleteAddress(HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		
		String num = request.getParameter("checkboxs");
		int contactsNo = Integer.parseInt(num.substring(4));		
		as.deleteMainAddress(contactsNo);
			
		return "redirect:mainAddress.ad";
	}
	
	@RequestMapping("/importDelete.ad")
	public String deleteImportAddress(HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		
		String num = request.getParameter("checkboxs");
		int contactsNo = Integer.parseInt(num.substring(4));
		
		as.deleteMainAddress(contactsNo);
		
		return "redirect:importantAddress.ad";
	}
	
	@RequestMapping("/shareDelete.ad")
	public String deleteShareAddress(HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		
		String num = request.getParameter("checkboxs");
		int contactsNo = Integer.parseInt(num.substring(4));
		
		as.deleteMainAddress(contactsNo);
		
		return "redirect:shareAddress.ad";
	}
	
	@RequestMapping("/search.ad")
	public String searchValue(HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {
		
		return "";
	}

	@ResponseBody
	@RequestMapping("changeStatus.ad")
	public String changeConImportStatus(HttpServletRequest request,  AddressVO address, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) {

		String contactsNo = request.getParameter("conNo");
		String tempsCon = request.getParameter("conStatus");
		String importCon = "";
		address.setCorpNo(loginUser.getCorpNo());
		address.setmNo(loginUser.getMno());	
		
		
		if(tempsCon.equals("Y")) {
			importCon = "N";
		} else if(tempsCon.equals("N")) {
			importCon = "Y";
		}
				
		address.setContactsNo(contactsNo);
		address.setImportCon(importCon);
		
		int result = as.changeConImportStatus(address);
		AddressVO addressConfirm = as.changeConfirm(address);

		return addressConfirm.getImportCon();
	}
	
	@RequestMapping("/update.ad")
	public String updateAddress(AddressVO address, HttpServletRequest request, HttpServletResponse response, @SessionAttribute("loginUser") Member loginUser) 
			throws AddressMainSelectListCountException, AddressMainSelectListException {
		
		address.setCorpNo(loginUser.getCorpNo());
		address.setmNo(loginUser.getMno());	
		
		int result = as.updateAddress(address);
		
			
		return addressList(request, response, address, loginUser);
	}
}
