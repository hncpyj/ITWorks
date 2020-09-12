package com.kh.itworks.projectManage.model.vo;

public class ProjectMember {
	
	private String pmemberId;
	private String prole;
	private String pno;
	private int mno;
	private String pmName;
	
	public ProjectMember() {}

	public ProjectMember(String pmemberId, String prole, String pno, int mno, String pmName) {
		super();
		this.pmemberId = pmemberId;
		this.prole = prole;
		this.pno = pno;
		this.mno = mno;
		this.pmName = pmName;
	}

	public String getPmemberId() {
		return pmemberId;
	}

	public void setPmemberId(String pmemberId) {
		this.pmemberId = pmemberId;
	}

	public String getProle() {
		return prole;
	}

	public void setProle(String prole) {
		this.prole = prole;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getPmName() {
		return pmName;
	}

	public void setPmName(String pmName) {
		this.pmName = pmName;
	}

	@Override
	public String toString() {
		return "ProjectMember [pmemberId=" + pmemberId + ", prole=" + prole + ", pno=" + pno + ", mno=" + mno
				+ ", pmName=" + pmName + "]";
	}
	
}
