package com.zipper.myPage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.board.model.vo.Board;
import com.zipper.myPage.model.dao.MyPageDAO;

import static com.zipper.common.JDBCTemplate.*;

public class MyPageService {
	
	private Connection con;
	private MyPageDAO mpDAO = new MyPageDAO();
	
	public ArrayList<Board> selectList() {
		
		con = getConnection();
		ArrayList<Board> list = mpDAO.selectList(con);
		close(con);
		
		return list;
	}
}
