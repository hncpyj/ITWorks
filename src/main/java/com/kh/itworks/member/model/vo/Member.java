package com.kh.itworks.member.model.vo;

public class Member {
	private int corpNo;
	private String rid;
	private String jid;
	private String did;
	private String ename;
	private String epwd;
	private String phone;
	private String email;
	private String address;
	private String birthday;
	private int eno;
	private String hireDate;
	private String resignationDate;
	private String status;
	private String approval;
	private String internalPhone;
	private int mno;
	private String eid;
	private String roleNo;
	private String dname;
	private String jname;
	
	public Member() {}

	public Member(int corpNo, String rid, String jid, String did, String ename, String epwd, String phone, String email,
			String address, String birthday, int eno, String hireDate, String resignationDate, String status,
			String approval, String internalPhone, int mno, String eid, String roleNo, String dname, String jname) {
		super();
		this.corpNo = corpNo;
		this.rid = rid;
		this.jid = jid;
		this.did = did;
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
		this.roleNo = roleNo;
		this.dname = dname;
		this.jname = jname;
	}

	public int getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getJid() {
		return jid;
	}

	public void setJid(String jid) {
		this.jid = jid;
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
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

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getResignationDate() {
		return resignationDate;
	}

	public void setResignationDate(String resignationDate) {
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

	public String getRoleNo() {
		return roleNo;
	}

	public void setRoleNo(String roleNo) {
		this.roleNo = roleNo;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getJname() {
		return jname;
	}

	public void setJname(String jname) {
		this.jname = jname;
	}

	@Override
	public String toString() {
		return "Member [corpNo=" + corpNo + ", rid=" + rid + ", jid=" + jid + ", did=" + did + ", ename=" + ename
				+ ", epwd=" + epwd + ", phone=" + phone + ", email=" + email + ", address=" + address + ", birthday="
				+ birthday + ", eno=" + eno + ", hireDate=" + hireDate + ", resignationDate=" + resignationDate
				+ ", status=" + status + ", approval=" + approval + ", internalPhone=" + internalPhone + ", mno=" + mno
				+ ", eid=" + eid + ", roleNo=" + roleNo + ", dname=" + dname + ", jname=" + jname + "]";
	}

	
}
