package com.zipper.guide.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.board.model.vo.Board;
import com.zipper.guide.model.DAO.GuideDAO;

public class GuideService {
	
	private Connection con;
	
	private GuideDAO gDAO = new GuideDAO();

	// 가이드 목록 조회
	public ArrayList<Board> selectList() {
		
		con = getConnection();
		
		ArrayList<Board> list = gDAO.selectList(con);
		
		close(con);
		
		return list;
	}
	
	// 가이드 상세 조회
	public Board selectOne(int bno) {
		
		con = getConnection();
		
		Board board = gDAO.selectOne(con, bno);
		
		close(con);
		
		return board;
	}


}
