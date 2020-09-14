package com.kh.itworks.atManagement.model.vo;

public class SearchCondition {

	private String name;
	private String dept;
	private int corpNo;
	
	public SearchCondition() {}

	public SearchCondition(String name, String dept, int corpNo) {
		super();
		this.name = name;
		this.dept = dept;
		this.corpNo = corpNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public int getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}

	@Override
	public String toString() {
		return "SearchCondition [name=" + name + ", dept=" + dept + ", corpNo=" + corpNo + "]";
	}

	
	
	
	
	
}
