package com.zipper.classMain.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

import com.zipper.thumb.model.vo.Attachment;

public class ClassList implements Serializable {
	
	private int cno;
	private int vno;
	private int kno;
	private int bno; 
	private	String cname;
	private String cintro; // 소개
	private String course; // 커리큘럼
	private int price;
	
	private ArrayList<Attachment> attachment;
	
	
	public ClassList() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ClassList(int cno, int vno, int kno, int bno, String cname, String cintro, String course, int price) {
		super();
		this.cno = cno;
		this.vno = vno;
		this.kno = kno;
		this.bno = bno;
		this.cname = cname;
		this.cintro = cintro;
		this.course = course;
		this.price = price;
	}
	
	


	public ClassList(int cno, int vno, int kno, int bno, String cname, String cintro, String course, int price,
			ArrayList<Attachment> attachment) {
		super();
		this.cno = cno;
		this.vno = vno;
		this.kno = kno;
		this.bno = bno;
		this.cname = cname;
		this.cintro = cintro;
		this.course = course;
		this.price = price;
		this.attachment = attachment;
	}


	@Override
	public String toString() {
		return "ClassList [cno=" + cno + ", vno=" + vno + ", kno=" + kno + ", bno=" + bno + ", cname=" + cname
				+ ", cintro=" + cintro + ", course=" + course + ", price=" + price + "]";
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


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getCname() {
		return cname;
	}


	public void setCname(String cname) {
		this.cname = cname;
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


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public ArrayList<Attachment> getAttachment() {
		return attachment;
	}


	public void setAttachment(ArrayList<Attachment> attachment) {
		this.attachment = attachment;
	}
	
	
	
	
	
}
