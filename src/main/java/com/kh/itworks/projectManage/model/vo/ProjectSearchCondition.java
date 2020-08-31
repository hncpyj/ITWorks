package com.kh.itworks.projectManage.model.vo;

public class ProjectSearchCondition {
	
	private String startDate;
	private String endDate;
	private String projectName;
	private String progress;
	private String writer;
	private String charge;
	private String join;
	private int scMno;
	
	public ProjectSearchCondition() {}

	public ProjectSearchCondition(String startDate, String endDate, String projectName, String progress, String writer,
			String charge, String join, int scMno) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.projectName = projectName;
		this.progress = progress;
		this.writer = writer;
		this.charge = charge;
		this.join = join;
		this.scMno = scMno;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCharge() {
		return charge;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}

	public String getJoin() {
		return join;
	}

	public void setJoin(String join) {
		this.join = join;
	}

	public int getScMno() {
		return scMno;
	}

	public void setScMno(int scMno) {
		this.scMno = scMno;
	}

	@Override
	public String toString() {
		return "ProjectSearchCondition [startDate=" + startDate + ", endDate=" + endDate + ", projectName="
				+ projectName + ", progress=" + progress + ", writer=" + writer + ", charge=" + charge + ", join="
				+ join + ", scMno=" + scMno + "]";
	}
}
