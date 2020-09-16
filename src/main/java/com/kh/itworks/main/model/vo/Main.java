package com.kh.itworks.main.model.vo;

public class Main {

	private String noticeno;	//공지번호관리코드
	private int cid;			//카테고리관리코드
	private String ntitle;		//제목
	private String ndate;		//작성일
	private int mno;			//회원관리코드
	private int corpno;			//회사코드
	private String ename;		//이름
	private String pno;
	private String pname;
	private String pstatus;
	private String pdate;
	private String wno;				//근태정보관리코드
	private String wstatus;			//출근상태
	private String wstart;			//출근시간
	private String wend;			//퇴근시간
	private String ip;				//ip
	private String outsideWork;		//외근여부
	private String wdate;				//출퇴근 날짜
	
	public Main() {}

	public Main(String noticeno, int cid, String ntitle, String ndate, int mno, int corpno, String ename, String pno,
			String pname, String pstatus, String pdate, String wno, String wstatus, String wstart, String wend,
			String ip, String outsideWork, String wdate) {
		super();
		this.noticeno = noticeno;
		this.cid = cid;
		this.ntitle = ntitle;
		this.ndate = ndate;
		this.mno = mno;
		this.corpno = corpno;
		this.ename = ename;
		this.pno = pno;
		this.pname = pname;
		this.pstatus = pstatus;
		this.pdate = pdate;
		this.wno = wno;
		this.wstatus = wstatus;
		this.wstart = wstart;
		this.wend = wend;
		this.ip = ip;
		this.outsideWork = outsideWork;
		this.wdate = wdate;
	}

	public String getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(String noticeno) {
		this.noticeno = noticeno;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNdate() {
		return ndate;
	}

	public void setNdate(String ndate) {
		this.ndate = ndate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getCorpno() {
		return corpno;
	}

	public void setCorpno(int corpno) {
		this.corpno = corpno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
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

	public String getWend() {
		return wend;
	}

	public void setWend(String wend) {
		this.wend = wend;
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

	@Override
	public String toString() {
		return "Main [noticeno=" + noticeno + ", cid=" + cid + ", ntitle=" + ntitle + ", ndate=" + ndate + ", mno="
				+ mno + ", corpno=" + corpno + ", ename=" + ename + ", pno=" + pno + ", pname=" + pname + ", pstatus="
				+ pstatus + ", pdate=" + pdate + ", wno=" + wno + ", wstatus=" + wstatus + ", wstart=" + wstart
				+ ", wend=" + wend + ", ip=" + ip + ", outsideWork=" + outsideWork + ", wdate=" + wdate + "]";
	}
	
	
	
	
}
