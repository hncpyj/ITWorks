package com.kh.itworks.projectManage.model.vo;

import java.sql.Date;

public class Project {
	
	private String pno;
	private String pname;
	private String pdept;
	private String pstartDate;
	private String pendDate;
	private String actualEndDate;
	private String psummary;
	private int plevel;
	private String pcontent;
	private String uniqueness;
	private int corpNo;
	private String pstatus;
	private String pdate;
	private String ptime;
	private String parentPjt;
	private String pjtTaskNo;
	private String pprogress;
	private String pwriter;
	
	public Project() {}

	public Project(String pno, String pname, String pdept, String pstartDate, String pendDate, String actualEndDate,
			String psummary, int plevel, String pcontent, String uniqueness, int corpNo, String pstatus, String pdate,
			String ptime, String parentPjt, String pjtTaskNo, String pprogress, String pwriter) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.pdept = pdept;
		this.pstartDate = pstartDate;
		this.pendDate = pendDate;
		this.actualEndDate = actualEndDate;
		this.psummary = psummary;
		this.plevel = plevel;
		this.pcontent = pcontent;
		this.uniqueness = uniqueness;
		this.corpNo = corpNo;
		this.pstatus = pstatus;
		this.pdate = pdate;
		this.ptime = ptime;
		this.parentPjt = parentPjt;
		this.pjtTaskNo = pjtTaskNo;
		this.pprogress = pprogress;
		this.pwriter = pwriter;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPdept() {
		return pdept;
	}

	public void setPdept(String pdept) {
		this.pdept = pdept;
	}

	public String getPstartDate() {
		return pstartDate;
	}

	public void setPstartDate(String pstartDate) {
		this.pstartDate = pstartDate;
	}

	public String getPendDate() {
		return pendDate;
	}

	public void setPendDate(String pendDate) {
		this.pendDate = pendDate;
	}

	public String getActualEndDate() {
		return actualEndDate;
	}

	public void setActualEndDate(String actualEndDate) {
		this.actualEndDate = actualEndDate;
	}

	public String getPsummary() {
		return psummary;
	}

	public void setPsummary(String psummary) {
		this.psummary = psummary;
	}

	public int getPlevel() {
		return plevel;
	}

	public void setPlevel(int plevel) {
		this.plevel = plevel;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getUniqueness() {
		return uniqueness;
	}

	public void setUniqueness(String uniqueness) {
		this.uniqueness = uniqueness;
	}

	public int getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getPtime() {
		return ptime;
	}

	public void setPtime(String ptime) {
		this.ptime = ptime;
	}

	public String getParentPjt() {
		return parentPjt;
	}

	public void setParentPjt(String parentPjt) {
		this.parentPjt = parentPjt;
	}

	public String getPjtTaskNo() {
		return pjtTaskNo;
	}

	public void setPjtTaskNo(String pjtTaskNo) {
		this.pjtTaskNo = pjtTaskNo;
	}

	public String getPprogress() {
		return pprogress;
	}

	public void setPprogress(String pprogress) {
		this.pprogress = pprogress;
	}

	public String getPwriter() {
		return pwriter;
	}

	public void setPwriter(String pwriter) {
		this.pwriter = pwriter;
	}

	@Override
	public String toString() {
		return "Project [pno=" + pno + ", pname=" + pname + ", pdept=" + pdept + ", pstartDate=" + pstartDate
				+ ", pendDate=" + pendDate + ", actualEndDate=" + actualEndDate + ", psummary=" + psummary + ", plevel="
				+ plevel + ", pcontent=" + pcontent + ", uniqueness=" + uniqueness + ", corpNo=" + corpNo + ", pstatus="
				+ pstatus + ", pdate=" + pdate + ", ptime=" + ptime + ", parentPjt=" + parentPjt + ", pjtTaskNo="
				+ pjtTaskNo + ", pprogress=" + pprogress + ", pwriter=" + pwriter + "]";
	}

	
}
