package com.zipper.classMain.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.zipper.board.model.vo.Board;
import com.zipper.thumb.model.vo.Attachment;

public class ClassList implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 181818L;
	
	private ArrayList<Attachment> attachment;
	
	private int cno;
	private int vno;
	private int kno;
	private	String cname;
	private int price;
	private String cintro; // 소개
	private String course; // 커리큘럼
	
	private String fileNewName; // 클래스 사진
	private String kdetail; // 키트 디테일
	
	
	public ClassList() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	public ClassList(ArrayList<Attachment> attachment, int cno, String cname, int price, String fileNewName) {
		super();
		this.attachment = attachment;
		this.cno = cno;
		this.cname = cname;
		this.price = price;
		this.fileNewName = fileNewName;
	}

	public ClassList(ArrayList<Attachment> attachment, int cno, int vno, int kno, String cname, int price,
			String cintro, String course, String fileNewName, String kdetail) {
		super();
		this.attachment = attachment;
		this.cno = cno;
		this.vno = vno;
		this.kno = kno;
		this.cname = cname;
		this.price = price;
		this.cintro = cintro;
		this.course = course;
		this.fileNewName = fileNewName;
		this.kdetail = kdetail;
	}



	@Override
	public String toString() {
		return "ClassList [attachment=" + attachment + ", cno=" + cno + ", vno=" + vno + ", kno=" + kno + ", cname="
				+ cname + ", price=" + price + ", cintro=" + cintro + ", course=" + course + ", fileNewName=" + fileNewName + "]";
	}



	public ArrayList<Attachment> getAttachment() {
		return attachment;
	}



	public void setAttachment(ArrayList<Attachment> attachment) {
		this.attachment = attachment;
	}



	public int getCno() {
		return cno;
	}



	public void setCno(int cno) {
		this.cno = cno;
	}



	public int getVno() {
		return vno;
	}



	public void setVno(int vno) {
		this.vno = vno;
	}



	public int getKno() {
		return kno;
	}



	public void setKno(int kno) {
		this.kno = kno;
	}



	public String getCname() {
		return cname;
	}



	public void setCname(String cname) {
		this.cname = cname;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getCintro() {
		return cintro;
	}



	public void setCintro(String cintro) {
		this.cintro = cintro;
	}



	public String getCourse() {
		return course;
	}


	public void setCourse(String course) {
		this.course = course;
	}
	
	public String getFileNewName() {
		return fileNewName;
	}

	public void setFileNewName(String fileNewName) {
		this.fileNewName = fileNewName;
	}

	public String getKdetail() {
		return kdetail;
	}
	public void setKdetail(String kdetail) {
		this.kdetail = kdetail;
	}
	
}
