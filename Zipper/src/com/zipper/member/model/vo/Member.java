package com.zipper.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {

	private static final long serialVersionUID = 1004L;
	
	
	/*
	 * MNO, MGRD, MID, MPWD, MNICK, MCONTACT, MEMAIL, 
	 * MENDATE, MEXDATE, MSTATUS, ADDRESS, INTRO
	 */
	// 1. 필드
	
	private int mno;			// 회원번호
	private String mgrd;		// 등급(A, M)
	private String mid;			// 아이디
	private String mpwd;		// 비밀번호
	private String mnick;		// 닉네임
	private String mcontact;	// 연락처
	private String memail;		// 이메일
	private Date mendate;		// 가입일
	private Date mexdate;		// 탈퇴일
	private String mstatus;		// 회원상태
	private String address;		// 주소
	private String intro;		// 한줄소개
	
	// 2. 생성자
	public Member() {
		super();
	}
	
	// 모든 정보 조회용
	public Member(int mno, String mgrd, String mid, String mpwd, String mnick, String mcontact, String memail,
			Date mendate, Date mexdate, String mstatus, String address, String intro) {
		super();
		this.mno = mno;
		this.mgrd = mgrd;
		this.mid = mid;
		this.mpwd = mpwd;
		this.mnick = mnick;
		this.mcontact = mcontact;
		this.memail = memail;
		this.mendate = mendate;
		this.mexdate = mexdate;
		this.mstatus = mstatus;
		this.address = address;
		this.intro = intro;
	}
	
	
	// 로그인용
	public Member(String mid, String mpwd) {
		super();
		this.mid = mid;
		this.mpwd = mpwd;
	}

	// 회원 가입용
	public Member(String mid, String mpwd, String mnick, String mcontact, String memail, String address, String intro) {
		super();
		this.mid = mid;
		this.mpwd = mpwd;
		this.mnick = mnick;
		this.mcontact = mcontact;
		this.memail = memail;
		this.address = address;
		this.intro = intro;
	}
	
	@Override
	public String toString() {
		return "Member [mno=" + mno + ", mgrd=" + mgrd + ", mid=" + mid + ", mpwd=" + mpwd + ", mnick=" + mnick
				+ ", mcontact=" + mcontact + ", memail=" + memail + ", mendate=" + mendate + ", mexdate=" + mexdate
				+ ", mstatus=" + mstatus + ", address=" + address + ", intro=" + intro + "]";
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMgrd() {
		return mgrd;
	}

	public void setMgrd(String mgrd) {
		this.mgrd = mgrd;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public String getMcontact() {
		return mcontact;
	}

	public void setMcontact(String mcontact) {
		this.mcontact = mcontact;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public Date getMendate() {
		return mendate;
	}

	public void setMendate(Date mendate) {
		this.mendate = mendate;
	}

	public Date getMexdate() {
		return mexdate;
	}

	public void setMexdate(Date mexdate) {
		this.mexdate = mexdate;
	}

	public String getMstatus() {
		return mstatus;
	}

	public void setMstatus(String mstatus) {
		this.mstatus = mstatus;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

}
