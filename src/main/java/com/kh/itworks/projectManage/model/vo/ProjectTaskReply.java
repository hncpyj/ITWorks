package com.kh.itworks.projectManage.model.vo;

public class ProjectTaskReply {
	
	private String tackReplyNo;
	private String tcontent;
	private String tdate;
	private String ttime;
	private String tstatus;
	private String pmemberId;
	private String pmemberName;
	private String pno;
	
	public ProjectTaskReply() {}

	public ProjectTaskReply(String tackReplyNo, String tcontent, String tdate, String ttime, String tstatus,
			String pmemberId, String pmemberName, String pno) {
		super();
		this.tackReplyNo = tackReplyNo;
		this.tcontent = tcontent;
		this.tdate = tdate;
		this.ttime = ttime;
		this.tstatus = tstatus;
		this.pmemberId = pmemberId;
		this.pmemberName = pmemberName;
		this.pno = pno;
	}

	public String getTackReplyNo() {
		return tackReplyNo;
	}

	public void setTackReplyNo(String tackReplyNo) {
		this.tackReplyNo = tackReplyNo;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public String getTdate() {
		return tdate;
	}

	public void setTdate(String tdate) {
		this.tdate = tdate;
	}

	public String getTtime() {
		return ttime;
	}

	public void setTtime(String ttime) {
		this.ttime = ttime;
	}

	public String getTstatus() {
		return tstatus;
	}

	public void setTstatus(String tstatus) {
		this.tstatus = tstatus;
	}

	public String getPmemberId() {
		return pmemberId;
	}

	public void setPmemberId(String pmemberId) {
		this.pmemberId = pmemberId;
	}

	public String getPmemberName() {
		return pmemberName;
	}

	public void setPmemberName(String pmemberName) {
		this.pmemberName = pmemberName;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	@Override
	public String toString() {
		return "ProjectTaskReply [tackReplyNo=" + tackReplyNo + ", tcontent=" + tcontent + ", tdate=" + tdate
				+ ", ttime=" + ttime + ", tstatus=" + tstatus + ", pmemberId=" + pmemberId + ", pmemberName="
				+ pmemberName + ", pno=" + pno + "]";
	}
}
