package com.zipper.help.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.board.model.vo.Board;
import com.zipper.help.model.dao.HelpDAO;

public class HelpService {
	private Connection con;
	private HelpDAO hDAO = new HelpDAO();

	public ArrayList<Board> selectFAQ() {
		
		//System.out.println("SERVICE 도착");
		
		con = getConnection();
		
		ArrayList<Board> result = hDAO.selectFAQ(con);
		
		close(con);
		
		//System.out.println("SERVICE 출발");
		
		return result;
	}

}
