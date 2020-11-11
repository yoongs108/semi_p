package com.zipper.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{

	private static final long serialVersionUID = 11010L; // 훙!
	
	/**
	 * 만약 DB 테이블의 정보와 다르게
	 * VO에 더 많은 값을 담아야 하거나,
	 * DB의 JOIN한 결과를 담고자 한다면
	 * VO의 필드 변수는 관련 테이블과 반드시 1:1 
	 * 로 연결 시키지 않아도 된다.
	 * 즉, 컬럼 : 필드 변수 != 1 : 1
	 */
	
	// 필드
	private int bno;			// 게시글 번호
	private int btype;			// 게시글 유형 (1: zippop / 2: 클래스 / 3: 가이드 / 4: 공지사항 / 5: FAQ)
	private int mno;			// 회원번호
	private String btitle;		// 게시글 제목
	private String bcontent;	// 게시글 내용
	private int bview;			// 게시글 조회수
	private Date bdate;			// 작성일
	private String bstatus;		// 삭제 여부 ( Y: 삭제 X, N: 삭제됨 )
	private int cno;			// 클래스 번호
	private int faqtype;		// 질문 유형(1 ~ 5)
	
	private String profile;
	private String userId;		// 게시글 작성자 아이디
	private String bwriter;		// 게시글 작성자(닉네임, 이름)
	private String boardfile;	// 첨부 파일
	
	
	// 생성자
	public Board() {
		super();
	}


	public Board(int bno, int btype, int mno, String btitle, String bcontent, int bview, Date bdate, String bstatus,
			int cno, int faqtype, String profile, String userId, String bwriter, String boardfile) {
		super();
		this.bno = bno;
		this.btype = btype;
		this.mno = mno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bview = bview;
		this.bdate = bdate;
		this.bstatus = bstatus;
		this.cno = cno;
		this.faqtype = faqtype;
		this.profile = profile;
		this.userId = userId;
		this.bwriter = bwriter;
		this.boardfile = boardfile;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", btype=" + btype + ", mno=" + mno + ", btitle=" + btitle + ", bcontent="
				+ bcontent + ", bview=" + bview + ", bdate=" + bdate + ", bstatus=" + bstatus + ", cno=" + cno
				+ ", faqtype=" + faqtype + ", profile=" + profile + ", userId=" + userId + ", bwriter=" + bwriter
				+ ", boardfile=" + boardfile + "]";
	}
	
	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public int getBtype() {
		return btype;
	}


	public void setBtype(int btype) {
		this.btype = btype;
	}


	public int getMno() {
		return mno;
	}


	public void setMno(int mno) {
		this.mno = mno;
	}


	public String getBtitle() {
		return btitle;
	}


	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}


	public String getBcontent() {
		return bcontent;
	}


	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}


	public int getBview() {
		return bview;
	}


	public void setBview(int bview) {
		this.bview = bview;
	}


	public Date getBdate() {
		return bdate;
	}


	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}


	public String getBstatus() {
		return bstatus;
	}


	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}


	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public int getFaqtype() {
		return faqtype;
	}


	public void setFaqtype(int faqtype) {
		this.faqtype = faqtype;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getBwriter() {
		return bwriter;
	}


	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}


	public String getBoardfile() {
		return boardfile;
	}


	public void setBoardfile(String boardfile) {
		this.boardfile = boardfile;
	}
	
}
