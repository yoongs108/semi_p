package com.zipper.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.zipper.classMain.model.vo.Kit;
import com.zipper.member.model.vo.Member;


public class Payment implements Serializable{
	
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1818L;
	
	private String pno;
	private int mno;
	private int cno;
	private String payinfo;
	private Date pdate;
	private String pstatus;
	private int total;
	
	
	
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Payment(String pno, int mno, int cno, String payinfo, Date pdate, String pstatus, int total) {
		super();
		this.pno = pno;
		this.mno = mno;
		this.cno = cno;
		this.payinfo = payinfo;
		this.pdate = pdate;
		this.pstatus = pstatus;
		this.total = total;
	}
	
	@Override
	public String toString() {
		return "Payment [pno=" + pno + ", mno=" + mno + ", cno=" + cno + ", payinfo=" + payinfo + ", pdate=" + pdate
				+ ", pstatus=" + pstatus + ", total=" + total + "]";
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getPayinfo() {
		return payinfo;
	}
	public void setPayinfo(String payinfo) {
		this.payinfo = payinfo;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

	
	
	
}