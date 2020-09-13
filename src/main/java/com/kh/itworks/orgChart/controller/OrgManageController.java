package com.kh.itworks.orgChart.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.itworks.orgChart.model.service.OrgChartService;
import com.kh.itworks.orgChart.model.vo.DeptVO;

@Controller
public class OrgManageController {
	
	@Autowired
	private OrgChartService ocs;	

	@ResponseBody
	@RequestMapping("second.org")
	public void sendPostMappingMessageFromRequestParam(HttpServletResponse response,
															HttpServletRequest request, DeptVO dept) throws IOException {
		response.setCharacterEncoding("UTF-8");
		
	    String deptName = request.getParameter("deptName");
	    int level = Integer.parseInt(request.getParameter("level"));
	    
	    dept.setdName(deptName);
	    dept.setdLevel(level);
	    
	    int result = ocs.insertDept(dept);
	    
	    System.out.println(result);
	    
	    if(result > 0) {
	    	ocs.selectDeptList(dept);
	    }
	    
	    System.out.println(dept);
	    
			}	
	
}
