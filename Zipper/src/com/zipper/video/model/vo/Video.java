package com.zipper.video.model.vo;

import java.io.Serializable;

public class Video implements Serializable{

	private static final long serialVersionUID = 1234L;
	/*
	 * VNO,VNAME
		VIDEO,VTEXT
	 */
	// 1. 필드
	private int vno;
	private String vname;	
	private String video;
	private String vtext;
	
	public Video() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Video(int vno, String vname, String video, String vtext) {
		super();
		this.vno = vno;
		this.vname = vname;
		this.video = video;
		this.vtext = vtext;
	}

	
	@Override
	public String toString() {
		return "Video [vno=" + vno + ", vname=" + vname + ", video=" + video + ", vtext=" + vtext + "]";
	}

	public int getVno() {
		return vno;
	}

	public void setVno(int vno) {
		this.vno = vno;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getVtext() {
		return vtext;
	}

	public void setVtext(String vtext) {
		this.vtext = vtext;
	}
	
	
	
	
}
	