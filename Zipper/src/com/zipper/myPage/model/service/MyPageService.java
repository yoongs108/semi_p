package com.zipper.myPage.model.service;

import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.myPage.model.dao.MyPageDAO;
import com.zipper.thumb.model.vo.Thumbnail;

public class MyPageService {
	
	private Connection con;
	private MyPageDAO mpDAO = new MyPageDAO();
	
	public ArrayList<Thumbnail> selectList() {
		
		con = getConnection();
		ArrayList<Thumbnail> list = mpDAO.selectList(con);
		close(con);
		
		return list;
	}
}
