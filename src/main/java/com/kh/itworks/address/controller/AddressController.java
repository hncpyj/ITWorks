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
	
	@RequestMapping("/mainAddress.ad")
	public ModelAndView addressList(Criteria cri, HttpSession session, ModelAndView mav) {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(as.countAddressList());

		List<Map<String, Object>> list = as.pageList(cri);

		session.setAttribute("mainList", list);
		session.setAttribute("pageMaker", pageMaker);
		
		System.out.println(list.size());

		mav.setViewName("address/mainAddress");
		
		return mav;
	}
	
	@RequestMapping("/importantAddress.ad")
	public ModelAndView importantAddress(Criteria cri, HttpSession session, ModelAndView mav) {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(as.countImportantAddressList());

		List<Map<String, Object>> list = as.importPageList(cri);

		session.setAttribute("importantList", list);
		session.setAttribute("pageMaker", pageMaker);
		
		mav.setViewName("address/importantAddress");
		
		return mav;
		
	}
	
	@RequestMapping("/shareAddress.ad")
	public ModelAndView shareAddress(Criteria cri, HttpSession session, ModelAndView mav) {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(as.countShareAddressList());

		List<Map<String, Object>> list = as.sharePageList(cri);

		session.setAttribute("shareList", list);
		
		session.setAttribute("pageMaker", pageMaker);
		
		mav.setViewName("address/shareAddress");
		
		return mav;
	}
	
}
