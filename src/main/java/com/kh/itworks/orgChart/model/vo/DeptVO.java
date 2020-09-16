package com.kh.itworks.orgChart.model.vo;


public class DeptVO implements java.io.Serializable {

	private String deptNo;
	private String dName;
	private int dLevel;
	private int corpNo;
	private int dId;
	private MemberVO member;
	private CompanyVO company;
	private String corpName;

	public DeptVO() {}

	public DeptVO(String deptNo, String dName, int dLevel, int corpNo, int dId, MemberVO member, CompanyVO company,
			String corpName) {
		super();
		this.deptNo = deptNo;
		this.dName = dName;
		this.dLevel = dLevel;
		this.corpNo = corpNo;
		this.dId = dId;
		this.member = member;
		this.company = company;
		this.corpName = corpName;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public int getdLevel() {
		return dLevel;
	}

	public void setdLevel(int dLevel) {
		this.dLevel = dLevel;
	}

	public int getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	public CompanyVO getCompany() {
		return company;
	}

	public void setCompany(CompanyVO company) {
		this.company = company;
	}

	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}

	@Override
	public String toString() {
		return "DeptVO [deptNo=" + deptNo + ", dName=" + dName + ", dLevel=" + dLevel + ", corpNo=" + corpNo + ", dId="
				+ dId + ", member=" + member + ", company=" + company + ", corpName=" + corpName + "]";
	}

	
	
}
