package com.kh.itworks.address.model.vo;

public class AddressVO implements java.io.Serializable{
	
	private String contactsNo;
	private String conType;
	private String conName;
	private String email;
	private String conPhone;
	private String conCorp;
	private String homePage;
	private String conBirthDay;
	private String conContent;
	private String importCon;
	private String roleNo;
	private int corpNo;
	private String tagId;
	private String deptNo;
	private String jobNo;
	private int mNo;
	private String tagName;
	private String tagNo;
	private String realAddress;
	
	
	public AddressVO() {}


	public AddressVO(String contactsNo, String conType, String conName, String email, String conPhone, String conCorp,
			String homePage, String conBirthDay, String conContent, String importCon, String roleNo, int corpNo,
			String tagId, String deptNo, String jobNo, int mNo, String tagName, String tagNo, String realAddress) {
		super();
		this.contactsNo = contactsNo;
		this.conType = conType;
		this.conName = conName;
		this.email = email;
		this.conPhone = conPhone;
		this.conCorp = conCorp;
		this.homePage = homePage;
		this.conBirthDay = conBirthDay;
		this.conContent = conContent;
		this.importCon = importCon;
		this.roleNo = roleNo;
		this.corpNo = corpNo;
		this.tagId = tagId;
		this.deptNo = deptNo;
		this.jobNo = jobNo;
		this.mNo = mNo;
		this.tagName = tagName;
		this.tagNo = tagNo;
		this.realAddress = realAddress;
	}


	public String getContactsNo() {
		return contactsNo;
	}


	public void setContactsNo(String contactsNo) {
		this.contactsNo = contactsNo;
	}


	public String getConType() {
		return conType;
	}


	public void setConType(String conType) {
		this.conType = conType;
	}


	public String getConName() {
		return conName;
	}


	public void setConName(String conName) {
		this.conName = conName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getConPhone() {
		return conPhone;
	}


	public void setConPhone(String conPhone) {
		this.conPhone = conPhone;
	}


	public String getConCorp() {
		return conCorp;
	}


	public void setConCorp(String conCorp) {
		this.conCorp = conCorp;
	}


	public String getHomePage() {
		return homePage;
	}


	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}


	public String getConBirthDay() {
		return conBirthDay;
	}


	public void setConBirthDay(String conBirthDay) {
		this.conBirthDay = conBirthDay;
	}


	public String getConContent() {
		return conContent;
	}


	public void setConContent(String conContent) {
		this.conContent = conContent;
	}


	public String getImportCon() {
		return importCon;
	}


	public void setImportCon(String importCon) {
		this.importCon = importCon;
	}


	public String getRoleNo() {
		return roleNo;
	}


	public void setRoleNo(String roleNo) {
		this.roleNo = roleNo;
	}


	public int getCorpNo() {
		return corpNo;
	}


	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}


	public String getTagId() {
		return tagId;
	}


	public void setTagId(String tagId) {
		this.tagId = tagId;
	}


	public String getDeptNo() {
		return deptNo;
	}


	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}


	public String getJobNo() {
		return jobNo;
	}


	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}


	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public String getTagName() {
		return tagName;
	}


	public void setTagName(String tagName) {
		this.tagName = tagName;
	}


	public String getTagNo() {
		return tagNo;
	}


	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}


	public String getRealAddress() {
		return realAddress;
	}


	public void setRealAddress(String realAddress) {
		this.realAddress = realAddress;
	}


	@Override
	public String toString() {
		return "Address [contactsNo=" + contactsNo + ", conType=" + conType + ", conName=" + conName + ", email="
				+ email + ", conPhone=" + conPhone + ", conCorp=" + conCorp + ", homePage=" + homePage
				+ ", conBirthDay=" + conBirthDay + ", conContent=" + conContent + ", importCon=" + importCon
				+ ", roleNo=" + roleNo + ", corpNo=" + corpNo + ", tagId=" + tagId + ", deptNo=" + deptNo + ", jobNo="
				+ jobNo + ", mNo=" + mNo + ", tagName=" + tagName + ", tagNo=" + tagNo + ", realAddress=" + realAddress
				+ "]";
	}
	
}
