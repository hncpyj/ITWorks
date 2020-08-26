package com.kh.itworks.electronicApproval.model.vo;

import java.sql.Date;

public class Approval implements java.io.Serializable {
	
	private int apvNo;
	private String apvDate;
	private String apvTime;
	private int mNo;
	private String deptNo;
	private String apvTitle;
	private String apvType;
	private String tempStg;
	private String lInfoNo;
	private String objNo;
	private String wNo;
	private String apvLineNo;
	private int corpNo;
	private int spvNo;
	private String apvLineDate;
	private String apvLineTime;
	private String apvLineContent;
	private String apvMethod;
	private String apvOrder;
	private String apvProcess;
	private String apvFinal; 
	private String apvProgress;
	private String formNo;
	private String fName;
	private String fDate;
	private String fTime;
	private String fContent;
	private String fType;
	private String apvReadNo;
	private String apvReadType;
	
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
