package com.kh.itworks.orgChart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrgChartController {
	
	   @RequestMapping("orgChart.org")
	   public String orgChart() {
	      
	      return "orgChart/orgChart";
	   }
	@RequestMapping("orgList.org")
	   public String orgList() {
	      
	      return "orgChart/orgList";
	   }
	
	@RequestMapping("orgManage.org")
	   public String orgManage() {
	      
	      return "orgChart/orgManage";
	   }
	@RequestMapping("positionManage.org")
	   public String positionManage() {
	      
	      return "orgChart/positionManage";
	   }
}
