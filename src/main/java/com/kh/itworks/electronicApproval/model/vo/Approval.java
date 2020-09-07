package com.kh.itworks.electronicApproval.model.vo;

import java.sql.Date;

public class Approval implements java.io.Serializable {
	
	private int apvNo;				//문서번호
	private String apvDate;			//기안일자
	private String apvTime;			//기안시간
	private int mNo;				//회원관리코드
	private String deptNo;			//기안부서
	private String apvTitle;		//제목
	private String apvType;			//분류
	private String tempStg;			//임시저장여주
	private String lInfoNo;			//휴가정보관리코드
	private String objNo;			//이의신청코드
	private String wNo;				//근태정보관리코드
	private String apvLineNo;		//결재관리코드
	private int corpNo;				//회사코드
	private int spvNo;				//
	private String apvLineDate;		//처리일
	private String apvLineTime;		//처리시간
	private String apvLineContent;	//결재메세지
	private String apvMethod;		//결재방법
	private String apvOrder;		//결재순번
	private String apvProcess;		//처리종류
	private String apvFinal; 		//결재최종완료여부
	private String apvProgress;		//결재진형여부
	private String formNo;			//결재양식관리코드
	private String fName;			//양식명
	private String fDate;			//등록일
	private String fTime;			//등록시간
	private String fContent;		//양식내용
	private String fType;			//양식유형
	private String apvReadNo;		//결재열람참조관리코드
	private String apvReadType;		//분류
	
	public Approval() {
		
	}

	public Approval(int apvNo, String apvDate, String apvTime, int mNo, String deptNo, String apvTitle, String apvType,
			String tempStg, String lInfoNo, String objNo, String wNo, String apvLineNo, int corpNo, int spvNo,
			String apvLineDate, String apvLineTime, String apvLineContent, String apvMethod, String apvOrder,
			String apvProcess, String apvFinal, String apvProgress, String formNo, String fName, String fDate,
			String fTime, String fContent, String fType, String apvReadNo, String apvReadType) {
		super();
		this.apvNo = apvNo;
		this.apvDate = apvDate;
		this.apvTime = apvTime;
		this.mNo = mNo;
		this.deptNo = deptNo;
		this.apvTitle = apvTitle;
		this.apvType = apvType;
		this.tempStg = tempStg;
		this.lInfoNo = lInfoNo;
		this.objNo = objNo;
		this.wNo = wNo;
		this.apvLineNo = apvLineNo;
		this.corpNo = corpNo;
		this.spvNo = spvNo;
		this.apvLineDate = apvLineDate;
		this.apvLineTime = apvLineTime;
		this.apvLineContent = apvLineContent;
		this.apvMethod = apvMethod;
		this.apvOrder = apvOrder;
		this.apvProcess = apvProcess;
		this.apvFinal = apvFinal;
		this.apvProgress = apvProgress;
		this.formNo = formNo;
		this.fName = fName;
		this.fDate = fDate;
		this.fTime = fTime;
		this.fContent = fContent;
		this.fType = fType;
		this.apvReadNo = apvReadNo;
		this.apvReadType = apvReadType;
	}

	public int getApvNo() {
		return apvNo;
	}

	public void setApvNo(int apvNo) {
		this.apvNo = apvNo;
	}

	public String getApvDate() {
		return apvDate;
	}

	public void setApvDate(String apvDate) {
		this.apvDate = apvDate;
	}

	public String getApvTime() {
		return apvTime;
	}

	public void setApvTime(String apvTime) {
		this.apvTime = apvTime;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getApvTitle() {
		return apvTitle;
	}

	public void setApvTitle(String apvTitle) {
		this.apvTitle = apvTitle;
	}

	public String getApvType() {
		return apvType;
	}

	public void setApvType(String apvType) {
		this.apvType = apvType;
	}

	public String getTempStg() {
		return tempStg;
	}

	public void setTempStg(String tempStg) {
		this.tempStg = tempStg;
	}

	public String getlInfoNo() {
		return lInfoNo;
	}

	public void setlInfoNo(String lInfoNo) {
		this.lInfoNo = lInfoNo;
	}

	public String getObjNo() {
		return objNo;
	}

	public void setObjNo(String objNo) {
		this.objNo = objNo;
	}

	public String getwNo() {
		return wNo;
	}

	public void setwNo(String wNo) {
		this.wNo = wNo;
	}

	public String getApvLineNo() {
		return apvLineNo;
	}

	public void setApvLineNo(String apvLineNo) {
		this.apvLineNo = apvLineNo;
	}

	public int getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}

	public int getSpvNo() {
		return spvNo;
	}

	public void setSpvNo(int spvNo) {
		this.spvNo = spvNo;
	}

	public String getApvLineDate() {
		return apvLineDate;
	}

	public void setApvLineDate(String apvLineDate) {
		this.apvLineDate = apvLineDate;
	}

	public String getApvLineTime() {
		return apvLineTime;
	}

	public void setApvLineTime(String apvLineTime) {
		this.apvLineTime = apvLineTime;
	}

	public String getApvLineContent() {
		return apvLineContent;
	}

	public void setApvLineContent(String apvLineContent) {
		this.apvLineContent = apvLineContent;
	}

	public String getApvMethod() {
		return apvMethod;
	}

	public void setApvMethod(String apvMethod) {
		this.apvMethod = apvMethod;
	}

	public String getApvOrder() {
		return apvOrder;
	}

	public void setApvOrder(String apvOrder) {
		this.apvOrder = apvOrder;
	}

	public String getApvProcess() {
		return apvProcess;
	}

	public void setApvProcess(String apvProcess) {
		this.apvProcess = apvProcess;
	}

	public String getApvFinal() {
		return apvFinal;
	}

	public void setApvFinal(String apvFinal) {
		this.apvFinal = apvFinal;
	}

	public String getApvProgress() {
		return apvProgress;
	}

	public void setApvProgress(String apvProgress) {
		this.apvProgress = apvProgress;
	}

	public String getFormNo() {
		return formNo;
	}

	public void setFormNo(String formNo) {
		this.formNo = formNo;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getfDate() {
		return fDate;
	}

	public void setfDate(String fDate) {
		this.fDate = fDate;
	}

	public String getfTime() {
		return fTime;
	}

	public void setfTime(String fTime) {
		this.fTime = fTime;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public String getfType() {
		return fType;
	}

	public void setfType(String fType) {
		this.fType = fType;
	}

	public String getApvReadNo() {
		return apvReadNo;
	}

	public void setApvReadNo(String apvReadNo) {
		this.apvReadNo = apvReadNo;
	}

	public String getApvReadType() {
		return apvReadType;
	}

	public void setApvReadType(String apvReadType) {
		this.apvReadType = apvReadType;
	}

	@Override
	public String toString() {
		return "Approval [apvNo=" + apvNo + ", apvDate=" + apvDate + ", apvTime=" + apvTime + ", mNo=" + mNo
				+ ", deptNo=" + deptNo + ", apvTitle=" + apvTitle + ", apvType=" + apvType + ", tempStg=" + tempStg
				+ ", lInfoNo=" + lInfoNo + ", objNo=" + objNo + ", wNo=" + wNo + ", apvLineNo=" + apvLineNo
				+ ", corpNo=" + corpNo + ", spvNo=" + spvNo + ", apvLineDate=" + apvLineDate + ", apvLineTime="
				+ apvLineTime + ", apvLineContent=" + apvLineContent + ", apvMethod=" + apvMethod + ", apvOrder="
				+ apvOrder + ", apvProcess=" + apvProcess + ", apvFinal=" + apvFinal + ", apvProgress=" + apvProgress
				+ ", formNo=" + formNo + ", fName=" + fName + ", fDate=" + fDate + ", fTime=" + fTime + ", fContent="
				+ fContent + ", fType=" + fType + ", apvReadNo=" + apvReadNo + ", apvReadType=" + apvReadType + "]";
	}
	
}
