package com.zipper.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable {

	private static final long serialVersionUID = 1200L; // 오늘은 바빠요!
	
	private int fno;
	private int cno;
	private int qno;
	private int bno;
	private String file_origin_name;
	private String file_new_name;
	private String filepath;
	private Date upload_date;
	private int mno;
	private String status;
	
	public Attachment() {
		super();
	}

	public Attachment(int fno, int cno, int qno, int bno, String file_origin_name, String file_new_name,
			String filepath, Date upload_date, int mno, String status) {
		super();
		this.fno = fno;
		this.cno = cno;
		this.qno = qno;
		this.bno = bno;
		this.file_origin_name = file_origin_name;
		this.file_new_name = file_new_name;
		this.filepath = filepath;
		this.upload_date = upload_date;
		this.mno = mno;
		this.status = status;
	}

	public Attachment(String file_origin_name, String file_new_name, String filepath, String status) {
		super();
		this.file_origin_name = file_origin_name;
		this.file_new_name = file_new_name;
		this.filepath = filepath;
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fno=" + fno + ", cno=" + cno + ", qno=" + qno + ", bno=" + bno + ", file_origin_name="
				+ file_origin_name + ", file_new_name=" + file_new_name + ", filepath=" + filepath + ", upload_date="
				+ upload_date + ", mno=" + mno + ", status=" + status + "]";
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getFile_origin_name() {
		return file_origin_name;
	}

	public void setFile_origin_name(String file_origin_name) {
		this.file_origin_name = file_origin_name;
	}

	public String getFile_new_name() {
		return file_new_name;
	}

	public void setFile_new_name(String file_new_name) {
		this.file_new_name = file_new_name;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}
	
}
