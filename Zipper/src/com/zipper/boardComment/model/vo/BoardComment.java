package com.zipper.boardComment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardComment implements Serializable {

	private static final long serialVersionUID = 1001L;
	
	// 필드
	private int comNo;
	private int bno;
	private int mno;
	private int comLevel;
	private Date comDate;
	private String comStatus;
	private String comContent;
	
	private String profile; // 댓글 사용자 프로필
	private String mnick; // 댓글 사용자 닉네임
	
	// 생성자
	public BoardComment() {
		super();
	}

	public BoardComment(int comNo, int bno, int mno, int comLevel, Date comDate, String comStatus, String comContent,
			String profile, String mnick) {
		super();
		this.comNo = comNo;
		this.bno = bno;
		this.mno = mno;
		this.comLevel = comLevel;
		this.comDate = comDate;
		this.comStatus = comStatus;
		this.comContent = comContent;
		this.profile = profile;
		this.mnick = mnick;
	}
	
	
	

	public BoardComment(int bno, int mno, String comContent, String profile, String mnick) {
		super();
		this.bno = bno;
		this.mno = mno;
		this.comContent = comContent;
		this.profile = profile;
		this.mnick = mnick;
	}

	@Override
	public String toString() {
		return "BoardComment [comNo=" + comNo + ", bno=" + bno + ", mno=" + mno + ", comLevel=" + comLevel
				+ ", comDate=" + comDate + ", comStatus=" + comStatus + ", comContent=" + comContent + ", profile="
				+ profile + ", mnick=" + mnick + "]";
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getComLevel() {
		return comLevel;
	}

	public void setComLevel(int comLevel) {
		this.comLevel = comLevel;
	}

	public Date getComDate() {
		return comDate;
	}

	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}

	public String getComStatus() {
		return comStatus;
	}

	public void setComStatus(String comStatus) {
		this.comStatus = comStatus;
	}

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

} 
