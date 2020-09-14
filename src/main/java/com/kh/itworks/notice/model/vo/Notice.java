package com.kh.itworks.notice.model.vo;

public class Notice implements java.io.Serializable {

//	NOTICE_NO		VARCHAR2(30 BYTE)		공지번호관리코드
//	CID				NUMBER(30,0)			카테고리관리코드
//	NTITLE			VARCHAR2(30 BYTE)		제목
//	NDATE			VARCHAR2(30 BYTE)		작성일
//	NTIME			VARCHAR2(30 BYTE)		작성시간
//	NVIEWS			VARCHAR2(30 BYTE)		조회수
//	NCONTENT		VARCHAR2(3999 BYTE)		내용
//	NSTATUS			VARCHAR2(10 BYTE)		공개여부
//	MNO				NUMBER(20,0)			회원관리코드
//	RID				NUMBER(20,0)			권한관리코드
//	CORP_NO			NUMBER(30,0)			회사코드
	
	private String noticeno;	//공지번호관리코드
	private int cid;			//카테고리관리코드
	private String ntitle;		//제목
	private String ndate;		//작성일
	private String ntime;		//작성시간
	private String nviews;		//조회수
	private String ncontent;	//내용
	private String nstatus;		//공개여부
	private int mno;			//회원관리코드
	private int rid;			//권한관리코드
	private int corpno;			//회사코드
	private String ename;		//이름
	
	public Notice() {
		
	}

	public Notice(String noticeno, int cid, String ntitle, String ndate, String ntime, String nviews, String ncontent,
			String nstatus, int mno, int rid, int corpno, String ename) {
		super();
		this.noticeno = noticeno;
		this.cid = cid;
		this.ntitle = ntitle;
		this.ndate = ndate;
		this.ntime = ntime;
		this.nviews = nviews;
		this.ncontent = ncontent;
		this.nstatus = nstatus;
		this.mno = mno;
		this.rid = rid;
		this.corpno = corpno;
		this.ename = ename;
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

	public String getNtime() {
		return ntime;
	}

	public void setNtime(String ntime) {
		this.ntime = ntime;
	}

	public String getNviews() {
		return nviews;
	}

	public void setNviews(String nviews) {
		this.nviews = nviews;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNstatus() {
		return nstatus;
	}

	public void setNstatus(String nstatus) {
		this.nstatus = nstatus;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
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

	@Override
	public String toString() {
		return "Notice [noticeno=" + noticeno + ", cid=" + cid + ", ntitle=" + ntitle + ", ndate=" + ndate + ", ntime="
				+ ntime + ", nviews=" + nviews + ", ncontent=" + ncontent + ", nstatus=" + nstatus + ", mno=" + mno
				+ ", rid=" + rid + ", corpno=" + corpno + ", ename=" + ename + "]";
	}
	
}
