package com.kh.itworks.address.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.itworks.address.model.service.AddressService;
import com.kh.itworks.address.model.vo.AddressVO;
import com.kh.itworks.address.model.vo.Criteria;
import com.kh.itworks.address.model.vo.PageMaker;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService as;
	
	@RequestMapping("/mainAddress.ad")
	public ModelAndView addressList(Criteria cri, HttpSession session, ModelAndView mav) {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(as.countBoardList());

		List<Map<String, Object>> list = as.pageList(cri);

		session.setAttribute("mainList", list);
		session.setAttribute("pageMaker", pageMaker);

		mav.setViewName("address/mainAddress");
		System.out.println(list);
		System.out.println(pageMaker);

		return mav;
	}
	
	@RequestMapping("/importantAddress.ad")
	public String importantAddress(HttpServletRequest request) {
		
		return "address/importantAddress";
	}
	
	@RequestMapping("/shareAddress.ad")
	public String shareAddress(HttpServletRequest request) {
		
		return "address/shareAddress";
	}
	
	@RequestMapping("/insert.ad")
	public String insertAddress(Model model, AddressVO address) {

		System.out.println("insert Address : " + address);

		int result = as.insertAddress(address);

		if(result > 0) {
			
			return "address/mainAddress";
			
		} else {
			model.addAttribute("msg", "");
			
			return "address/mainAddress";
		}
	}
}
