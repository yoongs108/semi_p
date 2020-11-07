package com.zipper.classMain.model.vo;

import java.io.Serializable;

public class Teacher implements Serializable{

	private static final long serialVersionUID = 1404L;
	/*
	 * TNO, TNAME, HISTORY
	 */
	// 1. 필드
	
	private int tno;		// 강사 번호
	private String tname;	// 강사 이름
	private String history; // 강사 연혁
	
	// 2. 생성자
	public Teacher() {
		super();
	}
	
	// 모든 정보 조회용
	public Teacher(int tno, String tname, String history) {
		super();
		this.tno = tno;
		this.tname = tname;
		this.history = history;
	}
	
	// 클래스 스크랩페이지에서 강사이름 부르기용
	public Teacher(int tno, String tname) {
		super();
		this.tno = tno;
		this.tname = tname;
	}

	@Override
	public String toString() {
		return "teacher [tno=" + tno + ", tname=" + tname + ", history=" + history + "]";
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}
	
	
	
}