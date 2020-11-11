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
	public ArrayList<Board> selectList(int currentPage, int limit) {
		
		con = getConnection();
		
		ArrayList<Board> list = gDAO.selectList(con, currentPage, limit);
		
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

	// 게시글 수 조회
	public int getListCount() {
		
		con = getConnection();
		
		int result = gDAO.getListCount(con);
		
		close(con);
		
		return result;
	}


}
