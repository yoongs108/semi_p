package com.zipper.myPage.model.service;

import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

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
	
}
