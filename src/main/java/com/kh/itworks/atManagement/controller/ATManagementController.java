package com.kh.itworks.atManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ATManagementController {
	@RequestMapping("selectATManagement.at")
	public String selectATManagement() {
		
		return "atManagement/atManagement";
	}
}
