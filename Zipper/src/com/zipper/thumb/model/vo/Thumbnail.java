package com.zipper.thumb.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.zipper.board.model.vo.Board;

public class Thumbnail extends Board implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 827L;
	
	private ArrayList<Attachment> attachment;



	

	public Thumbnail() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Thumbnail(int bno, int btype, int mno, String btitle, String bcontent, int bview, Date bdate, String bstatus,
			String userId, String bwriter, String boardfile) {
		super(bno, btype, mno, btitle, bcontent, bview, bdate, bstatus, userId, bwriter, boardfile);
		// TODO Auto-generated constructor stub
	}



	public Thumbnail(int bno, int btype, int mno, String btitle, String bcontent, int bview, Date bdate,
			String bstatus) {
		super(bno, btype, mno, btitle, bcontent, bview, bdate, bstatus);
		// TODO Auto-generated constructor stub
	}



	@Override
	public String toString() {
		return "Thumbnail [attachment=" + attachment + ", getAttachment()=" + getAttachment() + ", toString()="
				+ super.toString() + ", getBno()=" + getBno() + ", getBtype()=" + getBtype() + ", getBtitle()="
				+ getBtitle() + ", getBcontent()=" + getBcontent() + ", getBwriter()=" + getBwriter() + ", getUserId()="
				+ getUserId() + ", getBcount()=" + getBview() + ", getBoardfile()=" + getBoardfile() + ", getBdate()="
				+ getBdate() + ", getStatus()=" + getBstatus() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + "]";
	}

	public ArrayList<Attachment> getAttachment() {
		return attachment;
	}

	public void setAttachment(ArrayList<Attachment> attachment) {
		this.attachment = attachment;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
}
