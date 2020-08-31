package com.kh.itworks.projectManage.model.vo;

import java.sql.Date;

public class ProjectNotice {
	
	private String pnoticeNo;
	private String pnoticeName;
	private String pnoticeContent;
	private Date pnoticeDate;
	private Date pnoticeTime;
	private String pno;
	private String pnoticeStatus;
	private int eid;
	
	public ProjectNotice() {}

	public ProjectNotice(String pnoticeNo, String pnoticeName, String pnoticeContent, Date pnoticeDate,
			Date pnoticeTime, String pno, String pnoticeStatus, int eid) {
		super();
		this.pnoticeNo = pnoticeNo;
		this.pnoticeName = pnoticeName;
		this.pnoticeContent = pnoticeContent;
		this.pnoticeDate = pnoticeDate;
		this.pnoticeTime = pnoticeTime;
		this.pno = pno;
		this.pnoticeStatus = pnoticeStatus;
		this.eid = eid;
	}

	public String getPnoticeNo() {
		return pnoticeNo;
	}

	public void setPnoticeNo(String pnoticeNo) {
		this.pnoticeNo = pnoticeNo;
	}

	public String getPnoticeName() {
		return pnoticeName;
	}

	public void setPnoticeName(String pnoticeName) {
		this.pnoticeName = pnoticeName;
	}

	public String getPnoticeContent() {
		return pnoticeContent;
	}

	public void setPnoticeContent(String pnoticeContent) {
		this.pnoticeContent = pnoticeContent;
	}

	public Date getPnoticeDate() {
		return pnoticeDate;
	}

	public void setPnoticeDate(Date pnoticeDate) {
		this.pnoticeDate = pnoticeDate;
	}

	public Date getPnoticeTime() {
		return pnoticeTime;
	}

	public void setPnoticeTime(Date pnoticeTime) {
		this.pnoticeTime = pnoticeTime;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getPnoticeStatus() {
		return pnoticeStatus;
	}

	public void setPnoticeStatus(String pnoticeStatus) {
		this.pnoticeStatus = pnoticeStatus;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	@Override
	public String toString() {
		return "projectNotice [pnoticeNo=" + pnoticeNo + ", pnoticeName=" + pnoticeName + ", pnoticeContent="
				+ pnoticeContent + ", pnoticeDate=" + pnoticeDate + ", pnoticeTime=" + pnoticeTime + ", pno=" + pno
				+ ", pnoticeStatus=" + pnoticeStatus + ", eid=" + eid + "]";
	}
}
