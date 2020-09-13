package com.kh.itworks.orgChart.model.vo;

public class CompanyVO {

	private String corpName;
	private String corpAddress;
	private String corpRepName;
	private String corpRegistNo;
	private String corpType;
	private String corpEmail;
	private String corpFax;
	private int corpNo;
	
	public CompanyVO() {}

	public CompanyVO(String corpName, String corpAddress, String corpRepName, String corpRegistNo, String corpType,
			String corpEmail, String corpFax, int corpNo) {
		super();
		this.corpName = corpName;
		this.corpAddress = corpAddress;
		this.corpRepName = corpRepName;
		this.corpRegistNo = corpRegistNo;
		this.corpType = corpType;
		this.corpEmail = corpEmail;
		this.corpFax = corpFax;
		this.corpNo = corpNo;
	}

	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}

	public String getCorpAddress() {
		return corpAddress;
	}

	public void setCorpAddress(String corpAddress) {
		this.corpAddress = corpAddress;
	}

	public String getCorpRepName() {
		return corpRepName;
	}

	public void setCorpRepName(String corpRepName) {
		this.corpRepName = corpRepName;
	}

	public String getCorpRegistNo() {
		return corpRegistNo;
	}

	public void setCorpRegistNo(String corpRegistNo) {
		this.corpRegistNo = corpRegistNo;
	}

	public String getCorpType() {
		return corpType;
	}

	public void setCorpType(String corpType) {
		this.corpType = corpType;
	}

	public String getCorpEmail() {
		return corpEmail;
	}

	public void setCorpEmail(String corpEmail) {
		this.corpEmail = corpEmail;
	}

	public String getCorpFax() {
		return corpFax;
	}

	public void setCorpFax(String corpFax) {
		this.corpFax = corpFax;
	}

	public int getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}

	@Override
	public String toString() {
		return "CompanyVO [corpName=" + corpName + ", corpAddress=" + corpAddress + ", corpRepName=" + corpRepName
				+ ", corpRegistNo=" + corpRegistNo + ", corpType=" + corpType + ", corpEmail=" + corpEmail
				+ ", corpFax=" + corpFax + ", corpNo=" + corpNo + "]";
	}

}
