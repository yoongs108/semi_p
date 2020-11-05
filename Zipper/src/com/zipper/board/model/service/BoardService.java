package com.zipper.board.model.service;

import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.board.model.dao.BoardDAO;
import com.zipper.board.model.vo.Board;

public class BoardService {
	private Connection con;
	private BoardDAO bDAO = new BoardDAO();

	public int getListCount() {
		con = getConnection();
		
		int result = bDAO.getListCount(con); // create method 처리ok (dao에)
		
		
		return 0;
	}

	public ArrayList<Board> selectList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

}
