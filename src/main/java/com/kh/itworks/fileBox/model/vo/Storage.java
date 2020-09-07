package com.kh.itworks.fileBox.model.vo;

public class Storage implements java.io.Serializable{
	private String stgNo;						//파일보관함관리코드
	private String newStgDate;					//등록일자
	private String newStgTime;					//등록시간
	private String stgRole;						//권한
	private String stgPath;						//폴더경로
	private String stgLevel;					//폴더레벨
	private String stgStatus;					//폴더상태
	private int stgSize;						//폴더용량
	private String stg_name;					//폴더명
	private String stgType;						//폴더종류
	private int corpNo;							//회사코드
	
	
	public Storage() {}


	public Storage(String stgNo, String newStgDate, String newStgTime, String stgRole, String stgPath, String stgLevel,
			String stgStatus, int stgSize, String stg_name, String stgType, int corpNo) {
		super();
		this.stgNo = stgNo;
		this.newStgDate = newStgDate;
		this.newStgTime = newStgTime;
		this.stgRole = stgRole;
		this.stgPath = stgPath;
		this.stgLevel = stgLevel;
		this.stgStatus = stgStatus;
		this.stgSize = stgSize;
		this.stg_name = stg_name;
		this.stgType = stgType;
		this.corpNo = corpNo;
	}


	public String getStgNo() {
		return stgNo;
	}


	public void setStgNo(String stgNo) {
		this.stgNo = stgNo;
	}


	public String getNewStgDate() {
		return newStgDate;
	}


	public void setNewStgDate(String newStgDate) {
		this.newStgDate = newStgDate;
	}


	public String getNewStgTime() {
		return newStgTime;
	}


	public void setNewStgTime(String newStgTime) {
		this.newStgTime = newStgTime;
	}


	public String getStgRole() {
		return stgRole;
	}


	public void setStgRole(String stgRole) {
		this.stgRole = stgRole;
	}


	public String getStgPath() {
		return stgPath;
	}


	public void setStgPath(String stgPath) {
		this.stgPath = stgPath;
	}


	public String getStgLevel() {
		return stgLevel;
	}


	public void setStgLevel(String stgLevel) {
		this.stgLevel = stgLevel;
	}


	public String getStgStatus() {
		return stgStatus;
	}


	public void setStgStatus(String stgStatus) {
		this.stgStatus = stgStatus;
	}


	public int getStgSize() {
		return stgSize;
	}


	public void setStgSize(int stgSize) {
		this.stgSize = stgSize;
	}


	public String getStg_name() {
		return stg_name;
	}


	public void setStg_name(String stg_name) {
		this.stg_name = stg_name;
	}


	public String getStgType() {
		return stgType;
	}


	public void setStgType(String stgType) {
		this.stgType = stgType;
	}


	public int getCorpNo() {
		return corpNo;
	}


	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}


	@Override
	public String toString() {
		return "Storage [stgNo=" + stgNo + ", newStgDate=" + newStgDate + ", newStgTime=" + newStgTime + ", stgRole="
				+ stgRole + ", stgPath=" + stgPath + ", stgLevel=" + stgLevel + ", stgStatus=" + stgStatus
				+ ", stgSize=" + stgSize + ", stg_name=" + stg_name + ", stgType=" + stgType + ", corpNo=" + corpNo
				+ "]";
	}
	
	
	
}
