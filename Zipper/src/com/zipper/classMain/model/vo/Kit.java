package com.zipper.classMain.model.vo;

import java.io.Serializable;

public class Kit implements Serializable{

	private static final long serialVersionUID = 1500L;
	/*
	 * KNO, KNAME, KDETAIL, KCOUNT
	 */
	// 1. 필드
	
	private int kno;  		// 키트 번호
	private String kname;	// 키트 이름
	private String kdetail; // 구성품
	private int count; 		// 재고
	private int kprice; // 키트 가격
	
	//2. 생성자
	public Kit() {
		super();
	}
	
	public Kit(int kno, String kname, String kdetail, int count, int kprice) {
		super();
		this.kno = kno;
		this.kname = kname;
		this.kdetail = kdetail;
		this.count = count;
		this.kprice = kprice;
	}

	// 클래스 디테일에 넣을 키트 구성품

	public Kit(int kno, String kname, String kdetail, int kprice) {
		super();
		this.kno = kno;
		this.kname = kname;
		this.kdetail = kdetail;
		this.kprice = kprice;
	}



	@Override
	public String toString() {
		return "Kit [kno=" + kno + ", kname=" + kname + ", kdetail=" + kdetail + ", count=" + count + ", kprice="
				+ kprice + "]";
	}

	public int getKno() {
		return kno;
	}

	public void setKno(int kno) {
		this.kno = kno;
	}

	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}

	public String getKdetail() {
		return kdetail;
	}

	public void setKdetail(String kdetail) {
		this.kdetail = kdetail;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getKprice() {
		return kprice;
	}

	public void setKprice(int kprice) {
		this.kprice = kprice;
	}
	
	
	
}
