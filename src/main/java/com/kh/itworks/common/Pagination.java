package com.kh.itworks.common;

import com.kh.itworks.projectManage.model.vo.ProjectPageInfo;

public class Pagination {
	
	public static ProjectPageInfo getPageInfo(int currentPage, int listCount) {
		ProjectPageInfo pi = null;
		
		int limit = 10;
		int buttonCount = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int) ((double) listCount / buttonCount + 0.9);
		
		startPage = (((int) ((double) currentPage / buttonCount + 0.9)) - 1) * buttonCount + 1;
		
		endPage = startPage + buttonCount - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new ProjectPageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		 
		return pi;
	}

}
