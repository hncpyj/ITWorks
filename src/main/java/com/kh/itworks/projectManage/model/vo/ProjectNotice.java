package com.kh.itworks.projectManage.model.vo;

import java.sql.Date;

public class ProjectNotice {
	
	private String pnoticeNo;
	private String pnoticeName;
	private String pnoticeContent;
	private String pnoticeDate;
	private String pnoticeTime;
	private String pno;
	private String pnoticeStatus;
	private String pmemberId;
	private String ename;
	private int count;
	
	private String writerMno;
	
	public ProjectNotice() {}

	public ProjectNotice(String pnoticeNo, String pnoticeName, String pnoticeContent, String pnoticeDate,
			String pnoticeTime, String pno, String pnoticeStatus, String pmemberId, String ename, int count,
			String writerMno) {
		super();
		this.pnoticeNo = pnoticeNo;
		this.pnoticeName = pnoticeName;
		this.pnoticeContent = pnoticeContent;
		this.pnoticeDate = pnoticeDate;
		this.pnoticeTime = pnoticeTime;
		this.pno = pno;
		this.pnoticeStatus = pnoticeStatus;
		this.pmemberId = pmemberId;
		this.ename = ename;
		this.count = count;
		this.writerMno = writerMno;
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

	public String getPnoticeDate() {
		return pnoticeDate;
	}

	public void setPnoticeDate(String pnoticeDate) {
		this.pnoticeDate = pnoticeDate;
	}

	public String getPnoticeTime() {
		return pnoticeTime;
	}

	public void setPnoticeTime(String pnoticeTime) {
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

	public String getPmemberId() {
		return pmemberId;
	}

	public void setPmemberId(String pmemberId) {
		this.pmemberId = pmemberId;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getWriterMno() {
		return writerMno;
	}

	public void setWriterMno(String writerMno) {
		this.writerMno = writerMno;
	}

	@Override
	public String toString() {
		return "ProjectNotice [pnoticeNo=" + pnoticeNo + ", pnoticeName=" + pnoticeName + ", pnoticeContent="
				+ pnoticeContent + ", pnoticeDate=" + pnoticeDate + ", pnoticeTime=" + pnoticeTime + ", pno=" + pno
				+ ", pnoticeStatus=" + pnoticeStatus + ", pmemberId=" + pmemberId + ", ename=" + ename + ", count="
				+ count + ", writerMno=" + writerMno + "]";
	}

	
}
