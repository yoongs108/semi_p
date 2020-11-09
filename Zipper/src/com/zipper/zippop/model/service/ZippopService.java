package com.zipper.zippop.model.service;

import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.getConnection;
import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.thumb.model.vo.Attachment;
import com.zipper.thumb.model.vo.Thumbnail;
import com.zipper.zippop.model.dao.ZippopDAO;

public class ZippopService {

	private Connection con;
	private ZippopDAO zDAO = new ZippopDAO();
	
	public ArrayList<Thumbnail> selectList() {
		
		con = getConnection();
		ArrayList<Thumbnail> list = zDAO.selectList(con);
		close(con);
		
		return list;
	}

	public int insertZippop(Thumbnail t, Attachment at) {
		
		con = getConnection();
		
		int result = 0;
		
		int result1 = zDAO.insertZippop(con, t);
		//
		System.out.println("Service Board Insert : " + result1);
		//
		if (result1 > 0) {
			int bno = zDAO.getCurrentBno(con);
			
			at.setBno(bno);
		}
		
		int result2 = 0;
		
		result2 = zDAO.insertZipAtt(con, at);
		
		//
		System.out.println("Service Attachment Insert : " + result2);
		//
		
		if (result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		
		close(con);
		//
		System.out.println("Service total Insert : " + result);
		//
		
		return result;
	}
	
}
