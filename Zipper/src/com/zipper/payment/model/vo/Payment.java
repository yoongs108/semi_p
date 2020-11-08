package com.zipper.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.zipper.classMain.model.vo.Kit;
import com.zipper.member.model.vo.Member;


public class Payment extends Member implements Serializable{
	
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1818L;
	
	private String pno;
	private Date pdate;
	private int totalPrice;
	
	
	public Payment(String pno, String cname, int totalPrice, String mnick) {
		super(mnick);
		// TODO Auto-generated constructor stub
	}


	public Payment(String pno, Date pdate, int totalPrice) {
		super();
		this.pno = pno;
		this.pdate = pdate;
		this.totalPrice = totalPrice;
	}


	@Override
	public String toString() {
		return "Payment [pno=" + pno + ", pdate=" + pdate + ", totalPrice=" + totalPrice + "]";
	}


	public String getPno() {
		return pno;
	}


	public void setPno(String pno) {
		this.pno = pno;
	}


	public Date getPdate() {
		return pdate;
	}


	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
	
	
}