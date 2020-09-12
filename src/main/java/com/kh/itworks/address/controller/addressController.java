package com.kh.itworks.address.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.itworks.address.model.service.addressService;

@Controller
public class addressController {
	
//	@Autowired
//	private addressService as;
	
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
}
