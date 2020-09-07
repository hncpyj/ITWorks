package com.kh.itworks.member.model.vo;

public class Member {
<<<<<<< src/main/java/com/kh/itworks/member/model/vo/Member.java
	private int corpNo;
	private String roleNo;
	private String jobNo;
	private String deptNo;
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
=======
	private int corpNo; 	//회사코드
	private String roleNo; 	//권한관리코드
	private String jobNo; 	//직급관리코드
	private String deptNo; 	//부서관리코드
	private String ename; 	//이름
	private String epwd; 	//비밀번호
	private String phone; 	//휴대전화
	private String email; 	//이메일
	private String address; //주소
	private String birthday; //생년월일
	private int eno; 				//사번
	private String hireDate; 		//입사일
	private String resignationDate; //퇴사일
	private String status; 			//재직여부
	private String approval; 		//승인상태
	private String internalPhone; 	//사내전화
	private int mno; 				//회원관리코드
	private String eid;				//회원ID
>>>>>>> src/main/java/com/kh/itworks/member/model/vo/Member.java
	
	public Member() {}

	public Member(int corpNo, String roleNo, String jobNo, String deptNo, String ename, String epwd, String phone,
<<<<<<< src/main/java/com/kh/itworks/member/model/vo/Member.java
			String email, String address, String birthday, int eno, String hireDate, String resignationDate,
			String status, String approval, String internalPhone, int mno, String eid) {
=======
			String email, String address, String birthday, int eno, String hireDate, String resignationDate, String status,
			String approval, String internalPhone, int mno, String eid) {
>>>>>>> src/main/java/com/kh/itworks/member/model/vo/Member.java
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

	@Override
	public String toString() {
		return "Member [corpNo=" + corpNo + ", roleNo=" + roleNo + ", jobNo=" + jobNo + ", deptNo=" + deptNo
				+ ", ename=" + ename + ", epwd=" + epwd + ", phone=" + phone + ", email=" + email + ", address="
				+ address + ", birthday=" + birthday + ", eno=" + eno + ", hireDate=" + hireDate + ", resignationDate="
				+ resignationDate + ", status=" + status + ", approval=" + approval + ", internalPhone=" + internalPhone
				+ ", mno=" + mno + ", eid=" + eid + "]";
	}

	
	
	
}
