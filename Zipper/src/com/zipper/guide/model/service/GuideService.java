package com.zipper.guide.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.board.model.vo.Attachment;
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

	// 가이드 글 작성
	public int insertGuide(Board b, Attachment at) {
		con = getConnection();
		
		int result = 0;
		
		int result1 = gDAO.insertGuide(con, b);
		
		System.out.println(result1);
		
		if(result1 > 0) {
			int bno = gDAO.getCurrentBno(con);
			at.setBno(bno);
		}
		
		int result2 = gDAO.insertAttachment(con, at);
		
		System.out.println(result2);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


}
