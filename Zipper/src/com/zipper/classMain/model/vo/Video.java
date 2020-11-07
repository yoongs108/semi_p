package com.zipper.classMain.model.vo;

import java.io.Serializable;

public class Video implements Serializable{

	private static final long serialVersionUID = 1234L;
	/*
	 * VNO,TNO,VNAME,VPRICE, VIDEO
	 */
	// 1. 필드
	private int vno;
	private int tno;
	private String vname;
	private int vprice;
	private String video;
	
	// 2. 생성자
	public Video() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// 3. 모든 정보 조회용
	public Video(int vno, int tno, String vname, int vprice, String video) {
		super();
		this.vno = vno;
		this.tno = tno;
		this.vname = vname;
		this.vprice = vprice;
		this.video = video;
	}

	@Override
	public String toString() {
		return "Video [vno=" + vno + ", tno=" + tno + ", vname=" + vname + ", vprice=" + vprice + ", video=" + video
				+ "]";
	}

	public int getVno() {
		return vno;
	}

	public void setVno(int vno) {
		this.vno = vno;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public int getVprice() {
		return vprice;
	}

	public void setVprice(int vprice) {
		this.vprice = vprice;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}
	
	
	
}