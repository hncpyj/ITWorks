package com.kh.itworks.atManagement.model.vo;

public class Attachments {
	
	private String fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String uploadDate;
	private String uploadTime;
	private String fileSize;
	private String fileRole;
	private String fileType;
	private int apvNo;
	private String chatNo;
	private int mno;
	private String noticeNo;
	private String pno;
	private String pnoticeNo;
	private String stgNo;
	private String corpNo;
	private String ext;
	
	public Attachments() {}

	public Attachments(String fileNo, String originName, String changeName, String filePath, String uploadDate,
			String uploadTime, String fileSize, String fileRole, String fileType, int apvNo, String chatNo, int mno,
			String noticeNo, String pno, String pnoticeNo, String stgNo, String corpNo, String ext) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.uploadTime = uploadTime;
		this.fileSize = fileSize;
		this.fileRole = fileRole;
		this.fileType = fileType;
		this.apvNo = apvNo;
		this.chatNo = chatNo;
		this.mno = mno;
		this.noticeNo = noticeNo;
		this.pno = pno;
		this.pnoticeNo = pnoticeNo;
		this.stgNo = stgNo;
		this.corpNo = corpNo;
		this.ext = ext;
	}

	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileRole() {
		return fileRole;
	}

	public void setFileRole(String fileRole) {
		this.fileRole = fileRole;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public int getApvNo() {
		return apvNo;
	}

	public void setApvNo(int apvNo) {
		this.apvNo = apvNo;
	}

	public String getChatNo() {
		return chatNo;
	}

	public void setChatNo(String chatNo) {
		this.chatNo = chatNo;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getPnoticeNo() {
		return pnoticeNo;
	}

	public void setPnoticeNo(String pnoticeNo) {
		this.pnoticeNo = pnoticeNo;
	}

	public String getStgNo() {
		return stgNo;
	}

	public void setStgNo(String stgNo) {
		this.stgNo = stgNo;
	}

	public String getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(String corpNo) {
		this.corpNo = corpNo;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	@Override
	public String toString() {
		return "Attachments [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", uploadTime=" + uploadTime + ", fileSize="
				+ fileSize + ", fileRole=" + fileRole + ", fileType=" + fileType + ", apvNo=" + apvNo + ", chatNo="
				+ chatNo + ", mno=" + mno + ", noticeNo=" + noticeNo + ", pno=" + pno + ", pnoticeNo=" + pnoticeNo
				+ ", stgNo=" + stgNo + ", corpNo=" + corpNo + ", ext=" + ext + "]";
	}
	
	
	
	
}
