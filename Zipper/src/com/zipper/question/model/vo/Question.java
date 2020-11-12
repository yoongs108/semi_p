package com.zipper.question.model.vo;

import java.sql.Date;

public class Question {

	private static final long serialVersionUID = 0404L;
	
	private int qno;   			// 문의번호 
	private int mno;   			// 회원번호
	private String qcontent;  	// 문의내용
	private Date qdate;  		// 문의글 작성일
	private String qtitle;  	// 문의제목
	private String qstate;  	// 문의글 처리상태
	private String qid;   		// 문의글 작성자
	private String qcomment;  	// 문의 답변 
	private Date qcomdate; 		// 답변 작성일 
	
	// 부모 생성자
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Question [qno=" + qno + ", mno=" + mno + ", qcontent=" + qcontent + ", qdate=" + qdate + ", qtitle="
				+ qtitle + ", qstate=" + qstate + ", qid=" + qid + ", qcomment=" + qcomment + ", qcomdate=" + qcomdate
				+ "]";
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public Date getQdate() {
		return qdate;
	}

	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQstate() {
		return qstate;
	}

	public void setQstate(String qstate) {
		this.qstate = qstate;
	}

	public String getQid() {
		return qid;
	}

	public void setQid(String qid) {
		this.qid = qid;
	}

	public String getQcomment() {
		return qcomment;
	}

	public void setQcomment(String qcomment) {
		this.qcomment = qcomment;
	}

	public Date getQcomdate() {
		return qcomdate;
	}

	public void setQcomdate(Date qcomdate) {
		this.qcomdate = qcomdate;
	}


}
