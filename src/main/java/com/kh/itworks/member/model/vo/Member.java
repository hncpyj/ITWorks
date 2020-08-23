package com.kh.itworks.member.model.vo;

import java.sql.Date;

public class Member {
	private int corpNo;
	private String roleNo;
	private String jobNo;
	private String deptNo;
	private String ename;
	private String epwd;
	private String phone;
	private String email;
	private String address;
	private Date birthday;
	private int eno;
	private Date hireDate;
	private Date resignationDate;
	private String status;
	private String approval;
	private String internalPhone;
	private int mno;
	private String eid;
	
	public Member() {}

	public Member(int corpNo, String roleNo, String jobNo, String deptNo, String ename, String epwd, String phone,
			String email, String address, Date birthday, int eno, Date hireDate, Date resignationDate, String status,
			String approval, String internalPhone, int mno, String eid) {
		super();
		this.corpNo = corpNo;
		this.roleNo = roleNo;
		this.jobNo = jobNo;
		this.deptNo = deptNo;
		this.ename = ename;
		this.epwd = epwd;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.birthday = birthday;
		this.eno = eno;
		this.hireDate = hireDate;
		this.resignationDate = resignationDate;
		this.status = status;
		this.approval = approval;
		this.internalPhone = internalPhone;
		this.mno = mno;
		this.eid = eid;
	}

	public int getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}

	public String getRoleNo() {
		return roleNo;
	}

	public void setRoleNo(String roleNo) {
		this.roleNo = roleNo;
	}

	public String getJobNo() {
		return jobNo;
	}

	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEpwd() {
		return epwd;
	}

	public void setEpwd(String epwd) {
		this.epwd = epwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public Date getResignationDate() {
		return resignationDate;
	}

	public void setResignationDate(Date resignationDate) {
		this.resignationDate = resignationDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	public String getInternalPhone() {
		return internalPhone;
	}

	public void setInternalPhone(String internalPhone) {
		this.internalPhone = internalPhone;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	@Override
	public String toString() {
		return "Member [corpNo=" + corpNo + ", roleNo=" + roleNo + ", jobNo=" + jobNo + ", deptNo=" + deptNo
				+ ", ename=" + ename + ", epwd=" + epwd + ", phone=" + phone + ", email=" + email + ", address="
				+ address + ", birthday=" + birthday + ", eno=" + eno + ", hireDate=" + hireDate + ", resignationDate="
				+ resignationDate + ", status=" + status + ", approval=" + approval + ", internalPhone=" + internalPhone
				+ ", mno=" + mno + ", eid=" + eid + "]";
	}
	
	
	
	
}
