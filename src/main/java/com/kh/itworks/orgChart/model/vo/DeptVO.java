package com.kh.itworks.orgChart.model.vo;

public class DeptVO {

	private String deptNo;
	private String dName;
	private int dLevel;
	private int corpNo;
	private int dId;
	
	public DeptVO() {}

	public DeptVO(String deptNo, String dName, int dLevel, int corpNo, int dId) {
		super();
		this.deptNo = deptNo;
		this.dName = dName;
		this.dLevel = dLevel;
		this.corpNo = corpNo;
		this.dId = dId;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public int getdLevel() {
		return dLevel;
	}

	public void setdLevel(int dLevel) {
		this.dLevel = dLevel;
	}

	public int getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	@Override
	public String toString() {
		return "OrgChartVO [deptNo=" + deptNo + ", dName=" + dName + ", dLevel=" + dLevel + ", corpNo=" + corpNo
				+ ", dId=" + dId + "]";
	}

}
