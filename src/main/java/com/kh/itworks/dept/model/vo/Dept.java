package com.kh.itworks.dept.model.vo;

public class Dept {
	
	private String deptNo;
	private String dname;
	private int dlevel;
	private int corpNo;
	private int did;
	
	public Dept() {}

	public Dept(String deptNo, String dname, int dlevel, int corpNo, int did) {
		super();
		this.deptNo = deptNo;
		this.dname = dname;
		this.dlevel = dlevel;
		this.corpNo = corpNo;
		this.did = did;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public int getDlevel() {
		return dlevel;
	}

	public void setDlevel(int dlevel) {
		this.dlevel = dlevel;
	}

	public int getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	@Override
	public String toString() {
		return "Dept [deptNo=" + deptNo + ", dname=" + dname + ", dlevel=" + dlevel + ", corpNo=" + corpNo + ", did="
				+ did + "]";
	}
}