package com.kh.itworks.projectManage.model.vo;

public class ProjectTaskReply {
	
	private String taskReplyNo;
	private String tcontent;
	private String tdate;
	private String ttime;
	private String tstatus;
	private String pmemberId;
	private String ename;
	private String pno;
	private int writerMno;
	private String changeName;
	private String ext;
	
	public ProjectTaskReply() {}

	public ProjectTaskReply(String taskReplyNo, String tcontent, String tdate, String ttime, String tstatus,
			String pmemberId, String ename, String pno, int writerMno, String changeName, String ext) {
		super();
		this.taskReplyNo = taskReplyNo;
		this.tcontent = tcontent;
		this.tdate = tdate;
		this.ttime = ttime;
		this.tstatus = tstatus;
		this.pmemberId = pmemberId;
		this.ename = ename;
		this.pno = pno;
		this.writerMno = writerMno;
		this.changeName = changeName;
		this.ext = ext;
	}

	public String getTaskReplyNo() {
		return taskReplyNo;
	}

	public void setTaskReplyNo(String taskReplyNo) {
		this.taskReplyNo = taskReplyNo;
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

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public int getWriterMno() {
		return writerMno;
	}

	public void setWriterMno(int writerMno) {
		this.writerMno = writerMno;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	@Override
	public String toString() {
		return "ProjectTaskReply [taskReplyNo=" + taskReplyNo + ", tcontent=" + tcontent + ", tdate=" + tdate
				+ ", ttime=" + ttime + ", tstatus=" + tstatus + ", pmemberId=" + pmemberId + ", ename=" + ename
				+ ", pno=" + pno + ", writerMno=" + writerMno + ", changeName=" + changeName + ", ext=" + ext + "]";
	}

	
}
