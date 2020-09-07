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
import org.springframework.web.servlet.ModelAndView;

import com.kh.itworks.address.model.exception.AddressMainSelectListCountException;
import com.kh.itworks.address.model.exception.AddressMainSelectListException;
import com.kh.itworks.address.model.service.AddressService;
import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.PageInfo;
import com.kh.itworks.address.model.vo.Pagination;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService as;
	
	@RequestMapping("/insert.ad")
	public String insertAddress(Model model, AddressVO address) {

		int result = as.insertAddress(address);

	
		return "redirect:mainAddress.ad";
		
	}
	
	@RequestMapping("/mainAddress.ad")
	public String addressList(HttpServletRequest request, HttpServletResponse response) 
			throws AddressMainSelectListCountException, AddressMainSelectListException {

		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		int listCount = as.countAddressList();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<AddressVO> list = as.pageList(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("listCount", listCount);
						
		return "address/mainAddress";
	}
	
	@RequestMapping("/importantAddress.ad")
	public String importantAddress(HttpServletRequest request, HttpServletResponse response) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		int listCount = as.countImportantAddressList();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<AddressVO> list = as.importPageList(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("listCount", listCount);
		
		return "address/importantAddress";
		
	}
	
	@RequestMapping("/shareAddress.ad")
	public String shareAddress(HttpServletRequest request, HttpServletResponse response) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		int listCount = as.countShareAddressList();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<AddressVO> list = as.sharePageList(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("listCount", listCount);
		
		return "address/shareAddress";
	}
	
//	@RequestMapping("/addressDetail.ad")
//	public String addressDetail(HttpServletRequest request, HttpServletResponse response) {
//		
//		int contactsNo = Integer.parseInt(request.getParameter("aNo"));
//				
//		AddressVO address = as.selectOneMainAddress(contactsNo);
//		
//		request.setAttribute("address", address);
//				System.out.println(address);
//		return "address/mainAddress";
//	}
	
}
