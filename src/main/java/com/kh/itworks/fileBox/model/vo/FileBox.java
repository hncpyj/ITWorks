package com.kh.itworks.fileBox.model.vo;

public class FileBox implements java.io.Serializable{
	private String fileNo;								//첨부파일관리코드
	private String originName;							//원본파일명
	private String changeName;							//변환파일명
	private String filePath;							//파일경로
	private String uploadDate;							//등록일
	private String uploadTime;							//등록시간
	private Long fileSize;								//파일크기
	private String fileRole;							//권한
	private String fileType;							//파일종류
	private int apvNo;									//문서번호
	private String chatNo;								//대화코드
	private int mno;									//회원관리코드
	private String noticeNo;							//공지번호관리코드
	private String pno;									//프로젝트관리코드
	private String pNoticeNo;							//프로젝트공지사항관리코드
	private String stgNo;								//파일보관함관리코드
	private int corp_no;								//회사코드
	
	public FileBox() {}

	public FileBox(String fileNo, String originName, String changeName, String filePath, String uploadDate,
			String uploadTime, Long fileSize, String fileRole, String fileType, int apvNo, String chatNo, int mno,
			String noticeNo, String pno, String pNoticeNo, String stgNo, int corp_no) {
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
		this.pNoticeNo = pNoticeNo;
		this.stgNo = stgNo;
		this.corp_no = corp_no;
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

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
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

	public String getpNoticeNo() {
		return pNoticeNo;
	}

	public void setpNoticeNo(String pNoticeNo) {
		this.pNoticeNo = pNoticeNo;
	}

	public String getStgNo() {
		return stgNo;
	}

	public void setStgNo(String stgNo) {
		this.stgNo = stgNo;
	}

	public int getCorp_no() {
		return corp_no;
	}

	public void setCorp_no(int corp_no) {
		this.corp_no = corp_no;
	}

	@Override
	public String toString() {
		return "FileBox [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", uploadTime=" + uploadTime + ", fileSize=" + fileSize
				+ ", fileRole=" + fileRole + ", fileType=" + fileType + ", apvNo=" + apvNo + ", chatNo=" + chatNo
				+ ", mno=" + mno + ", noticeNo=" + noticeNo + ", pno=" + pno + ", pNoticeNo=" + pNoticeNo + ", stgNo="
				+ stgNo + ", corp_no=" + corp_no + "]";
	}

	
	
	
	
	
}
