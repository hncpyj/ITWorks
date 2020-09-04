package com.kh.itworks.atManagement.model.vo;



public class ATManagement implements java.io.Serializable {
	private String workingStatusNo;	//근무상태코드
	private String workType;		//근무상태종류
	private String work;			//근무시간포함여부
	private int corpNo;				//회사코드
	private String wno;				//근태정보관리코드
	private String wstatus;			//출근상태
	private String wstart;			//출근시간
	private String ip;				//ip
	private String outsideWork;		//외근여부
	private String wdate;				//출퇴근 날짜
	private int eid;				//회원id
	private String yearAleave;		//근속년수연차관리코드
	private int hireYear;			//입사년차
	private int aleaveCount;		//연차갯수
	private int accUnitPeriod;		//회계단위기간
	private String rwdNo;			//포상휴가관리코드
	private String rwdName;			//포상휴가명
	private int rwdPeriod;			//포상휴가일수
	private String otNo;			//연장근무코드
	private String ptRef;			//연장근무참조
	private String otDate;			//연장근무일
	private String otStart;			//연장시작시간
	private String otEnd;				//연장종료시간
	private String otReason;		//연장근무사유
	private String objNo;			//이의신청코드
	private String objDate;			//이의신청날짜
	private String objType;			//이의종류
	private String changeDate;		//이의변경시간
	private String objStatus;		//이의신청변경상태
	private String objReason;		//이의신청사유
	private String rid;			//권한코드
	private String jid;			//직급코드
	private String did;			//부서코드
	private String ename;			//이름
	private int eno;				//사번
	private String hireDate;			//입사일
	private String status;			//재직여부
	private String approval;		//승인상태
	private String mno;				//회원관리코드
	private String dname;			//부서명
	private String breakTimeNo;		//휴게시간관리코드
	private String btType;			//휴게시간 종류
	private String btStart;			//휴게시작시간
	private String btEnd;			//휴게종류시간
	private String attendence;		//근태기능사용여부
	private String workTimeLimit;	//52시간 근무 적용여부
	private String laborDay;		//근로자의날 휴무여부
	private String holidays;		//공휴일휴무여부
	private String alternativeHolidays;	//대체공휴일휴무여부
	private String fileNo;				//첨부파일관리코드
	private String originName;			//원본파일명
	private String changeName;			//변환파일명
	private String filePath;			//파일경로
	private String uploadDate;			//등록일
	private String uploadTime;			//등록시간
	private int fileSize;				//파일크기
	private String fileRole;			//파일권한
	private String fileType;			//파일종류
	private int workingSetNo;			//근태기본시간코드
	private String workingSetTime;		//근태시간설정종류
	private String dayOfTheWeek;		//근무요일
	private String workingTime;			//근무기본출근시간
	private String quittingTime;		//근무기본퇴근시간
	private String harfOff;				//반차시간
	
	

	
	public ATManagement() {}




	public ATManagement(String workingStatusNo, String workType, String work, int corpNo, String wno, String wstatus,
			String wstart, String ip, String outsideWork, String wdate, int eid, String yearAleave, int hireYear,
			int aleaveCount, int accUnitPeriod, String rwdNo, String rwdName, int rwdPeriod, String otNo, String ptRef,
			String otDate, String otStart, String otEnd, String otReason, String objNo, String objDate, String objType,
			String changeDate, String objStatus, String objReason, String rid, String jid, String did, String ename,
			int eno, String hireDate, String status, String approval, String mno, String dname, String breakTimeNo,
			String btType, String btStart, String btEnd, String attendence, String workTimeLimit, String laborDay,
			String holidays, String alternativeHolidays, String fileNo, String originName, String changeName,
			String filePath, String uploadDate, String uploadTime, int fileSize, String fileRole, String fileType,
			int workingSetNo, String workingSetTime, String dayOfTheWeek, String workingTime, String quittingTime,
			String harfOff) {
		super();
		this.workingStatusNo = workingStatusNo;
		this.workType = workType;
		this.work = work;
		this.corpNo = corpNo;
		this.wno = wno;
		this.wstatus = wstatus;
		this.wstart = wstart;
		this.ip = ip;
		this.outsideWork = outsideWork;
		this.wdate = wdate;
		this.eid = eid;
		this.yearAleave = yearAleave;
		this.hireYear = hireYear;
		this.aleaveCount = aleaveCount;
		this.accUnitPeriod = accUnitPeriod;
		this.rwdNo = rwdNo;
		this.rwdName = rwdName;
		this.rwdPeriod = rwdPeriod;
		this.otNo = otNo;
		this.ptRef = ptRef;
		this.otDate = otDate;
		this.otStart = otStart;
		this.otEnd = otEnd;
		this.otReason = otReason;
		this.objNo = objNo;
		this.objDate = objDate;
		this.objType = objType;
		this.changeDate = changeDate;
		this.objStatus = objStatus;
		this.objReason = objReason;
		this.rid = rid;
		this.jid = jid;
		this.did = did;
		this.ename = ename;
		this.eno = eno;
		this.hireDate = hireDate;
		this.status = status;
		this.approval = approval;
		this.mno = mno;
		this.dname = dname;
		this.breakTimeNo = breakTimeNo;
		this.btType = btType;
		this.btStart = btStart;
		this.btEnd = btEnd;
		this.attendence = attendence;
		this.workTimeLimit = workTimeLimit;
		this.laborDay = laborDay;
		this.holidays = holidays;
		this.alternativeHolidays = alternativeHolidays;
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.uploadTime = uploadTime;
		this.fileSize = fileSize;
		this.fileRole = fileRole;
		this.fileType = fileType;
		this.workingSetNo = workingSetNo;
		this.workingSetTime = workingSetTime;
		this.dayOfTheWeek = dayOfTheWeek;
		this.workingTime = workingTime;
		this.quittingTime = quittingTime;
		this.harfOff = harfOff;
	}




	public String getWorkingStatusNo() {
		return workingStatusNo;
	}




	public void setWorkingStatusNo(String workingStatusNo) {
		this.workingStatusNo = workingStatusNo;
	}




	public String getWorkType() {
		return workType;
	}




	public void setWorkType(String workType) {
		this.workType = workType;
	}




	public String getWork() {
		return work;
	}




	public void setWork(String work) {
		this.work = work;
	}




	public int getCorpNo() {
		return corpNo;
	}




	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}




	public String getWno() {
		return wno;
	}




	public void setWno(String wno) {
		this.wno = wno;
	}




	public String getWstatus() {
		return wstatus;
	}




	public void setWstatus(String wstatus) {
		this.wstatus = wstatus;
	}




	public String getWstart() {
		return wstart;
	}




	public void setWstart(String wstart) {
		this.wstart = wstart;
	}




	public String getIp() {
		return ip;
	}




	public void setIp(String ip) {
		this.ip = ip;
	}




	public String getOutsideWork() {
		return outsideWork;
	}




	public void setOutsideWork(String outsideWork) {
		this.outsideWork = outsideWork;
	}




	public String getWdate() {
		return wdate;
	}




	public void setWdate(String wdate) {
		this.wdate = wdate;
	}




	public int getEid() {
		return eid;
	}




	public void setEid(int eid) {
		this.eid = eid;
	}




	public String getYearAleave() {
		return yearAleave;
	}




	public void setYearAleave(String yearAleave) {
		this.yearAleave = yearAleave;
	}




	public int getHireYear() {
		return hireYear;
	}




	public void setHireYear(int hireYear) {
		this.hireYear = hireYear;
	}




	public int getAleaveCount() {
		return aleaveCount;
	}




	public void setAleaveCount(int aleaveCount) {
		this.aleaveCount = aleaveCount;
	}




	public int getAccUnitPeriod() {
		return accUnitPeriod;
	}




	public void setAccUnitPeriod(int accUnitPeriod) {
		this.accUnitPeriod = accUnitPeriod;
	}




	public String getRwdNo() {
		return rwdNo;
	}




	public void setRwdNo(String rwdNo) {
		this.rwdNo = rwdNo;
	}




	public String getRwdName() {
		return rwdName;
	}




	public void setRwdName(String rwdName) {
		this.rwdName = rwdName;
	}




	public int getRwdPeriod() {
		return rwdPeriod;
	}




	public void setRwdPeriod(int rwdPeriod) {
		this.rwdPeriod = rwdPeriod;
	}




	public String getOtNo() {
		return otNo;
	}




	public void setOtNo(String otNo) {
		this.otNo = otNo;
	}




	public String getPtRef() {
		return ptRef;
	}




	public void setPtRef(String ptRef) {
		this.ptRef = ptRef;
	}




	public String getOtDate() {
		return otDate;
	}




	public void setOtDate(String otDate) {
		this.otDate = otDate;
	}




	public String getOtStart() {
		return otStart;
	}




	public void setOtStart(String otStart) {
		this.otStart = otStart;
	}




	public String getOtEnd() {
		return otEnd;
	}




	public void setOtEnd(String otEnd) {
		this.otEnd = otEnd;
	}




	public String getOtReason() {
		return otReason;
	}




	public void setOtReason(String otReason) {
		this.otReason = otReason;
	}




	public String getObjNo() {
		return objNo;
	}




	public void setObjNo(String objNo) {
		this.objNo = objNo;
	}




	public String getObjDate() {
		return objDate;
	}




	public void setObjDate(String objDate) {
		this.objDate = objDate;
	}




	public String getObjType() {
		return objType;
	}




	public void setObjType(String objType) {
		this.objType = objType;
	}




	public String getChangeDate() {
		return changeDate;
	}




	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}




	public String getObjStatus() {
		return objStatus;
	}




	public void setObjStatus(String objStatus) {
		this.objStatus = objStatus;
	}




	public String getObjReason() {
		return objReason;
	}




	public void setObjReason(String objReason) {
		this.objReason = objReason;
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




	public String getMno() {
		return mno;
	}




	public void setMno(String mno) {
		this.mno = mno;
	}




	public String getDname() {
		return dname;
	}




	public void setDname(String dname) {
		this.dname = dname;
	}




	public String getBreakTimeNo() {
		return breakTimeNo;
	}




	public void setBreakTimeNo(String breakTimeNo) {
		this.breakTimeNo = breakTimeNo;
	}




	public String getBtType() {
		return btType;
	}




	public void setBtType(String btType) {
		this.btType = btType;
	}




	public String getBtStart() {
		return btStart;
	}




	public void setBtStart(String btStart) {
		this.btStart = btStart;
	}




	public String getBtEnd() {
		return btEnd;
	}




	public void setBtEnd(String btEnd) {
		this.btEnd = btEnd;
	}




	public String getAttendence() {
		return attendence;
	}




	public void setAttendence(String attendence) {
		this.attendence = attendence;
	}




	public String getWorkTimeLimit() {
		return workTimeLimit;
	}




	public void setWorkTimeLimit(String workTimeLimit) {
		this.workTimeLimit = workTimeLimit;
	}




	public String getLaborDay() {
		return laborDay;
	}




	public void setLaborDay(String laborDay) {
		this.laborDay = laborDay;
	}




	public String getHolidays() {
		return holidays;
	}




	public void setHolidays(String holidays) {
		this.holidays = holidays;
	}




	public String getAlternativeHolidays() {
		return alternativeHolidays;
	}




	public void setAlternativeHolidays(String alternativeHolidays) {
		this.alternativeHolidays = alternativeHolidays;
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




	public int getFileSize() {
		return fileSize;
	}




	public void setFileSize(int fileSize) {
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




	public int getWorkingSetNo() {
		return workingSetNo;
	}




	public void setWorkingSetNo(int workingSetNo) {
		this.workingSetNo = workingSetNo;
	}




	public String getWorkingSetTime() {
		return workingSetTime;
	}




	public void setWorkingSetTime(String workingSetTime) {
		this.workingSetTime = workingSetTime;
	}




	public String getDayOfTheWeek() {
		return dayOfTheWeek;
	}




	public void setDayOfTheWeek(String dayOfTheWeek) {
		this.dayOfTheWeek = dayOfTheWeek;
	}




	public String getWorkingTime() {
		return workingTime;
	}




	public void setWorkingTime(String workingTime) {
		this.workingTime = workingTime;
	}




	public String getQuittingTime() {
		return quittingTime;
	}




	public void setQuittingTime(String quittingTime) {
		this.quittingTime = quittingTime;
	}




	public String getHarfOff() {
		return harfOff;
	}




	public void setHarfOff(String harfOff) {
		this.harfOff = harfOff;
	}




	@Override
	public String toString() {
		return "ATManagement [workingStatusNo=" + workingStatusNo + ", workType=" + workType + ", work=" + work
				+ ", corpNo=" + corpNo + ", wno=" + wno + ", wstatus=" + wstatus + ", wstart=" + wstart + ", ip=" + ip
				+ ", outsideWork=" + outsideWork + ", wdate=" + wdate + ", eid=" + eid + ", yearAleave=" + yearAleave
				+ ", hireYear=" + hireYear + ", aleaveCount=" + aleaveCount + ", accUnitPeriod=" + accUnitPeriod
				+ ", rwdNo=" + rwdNo + ", rwdName=" + rwdName + ", rwdPeriod=" + rwdPeriod + ", otNo=" + otNo
				+ ", ptRef=" + ptRef + ", otDate=" + otDate + ", otStart=" + otStart + ", otEnd=" + otEnd
				+ ", otReason=" + otReason + ", objNo=" + objNo + ", objDate=" + objDate + ", objType=" + objType
				+ ", changeDate=" + changeDate + ", objStatus=" + objStatus + ", objReason=" + objReason + ", rid="
				+ rid + ", jid=" + jid + ", did=" + did + ", ename=" + ename + ", eno=" + eno + ", hireDate=" + hireDate
				+ ", status=" + status + ", approval=" + approval + ", mno=" + mno + ", dname=" + dname
				+ ", breakTimeNo=" + breakTimeNo + ", btType=" + btType + ", btStart=" + btStart + ", btEnd=" + btEnd
				+ ", attendence=" + attendence + ", workTimeLimit=" + workTimeLimit + ", laborDay=" + laborDay
				+ ", holidays=" + holidays + ", alternativeHolidays=" + alternativeHolidays + ", fileNo=" + fileNo
				+ ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", uploadDate=" + uploadDate + ", uploadTime=" + uploadTime + ", fileSize=" + fileSize + ", fileRole="
				+ fileRole + ", fileType=" + fileType + ", workingSetNo=" + workingSetNo + ", workingSetTime="
				+ workingSetTime + ", dayOfTheWeek=" + dayOfTheWeek + ", workingTime=" + workingTime + ", quittingTime="
				+ quittingTime + ", harfOff=" + harfOff + "]";
	}


	

	
	
	
	
	
	
}
