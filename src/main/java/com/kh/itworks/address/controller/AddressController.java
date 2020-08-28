package com.kh.itworks.address.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.itworks.address.model.service.AddressService;
import com.kh.itworks.address.model.vo.Address;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService as;
	
	@RequestMapping("/mainAddress.ad")
	public String addressList(HttpServletRequest request) {
		
		return "address/mainAddress";
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
	public String insertAddress(Model model, Address address) {

		System.out.println("insert Address : " + address);

		int result = as.insertAddress(address);

		if(result > 0) {
			
			return "address/mainAddress";
			
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			
			return "address/mainAddress";
		}
	}
}
