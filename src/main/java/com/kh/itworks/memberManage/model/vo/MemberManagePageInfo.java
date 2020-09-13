package com.kh.itworks.memberManage.model.vo;

public class MemberManagePageInfo implements java.io.Serializable {
	private int currentPage;
	private int listCount; //조회할 모든 행의 갯수
	private int limit; //한 페이지에 보여질 행 갯수
	private int maxPage; //제일 마지막 페이징버튼 숫자
	private int startPage; //시작하는 페이징버튼 숫자 (1, 11...)
	private int endPage; //마지막 페이징버튼 숫자 (10, 20...)
	 
	
	public MemberManagePageInfo() {}


	public MemberManagePageInfo(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getListCount() {
		return listCount;
	}


	public void setListCount(int listCount) {
		this.listCount = listCount;
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
	}


	public int getMaxPage() {
		return maxPage;
	}


	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	@Override
	public String toString() {
		return "MemberManagePageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
				+ ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}


}
