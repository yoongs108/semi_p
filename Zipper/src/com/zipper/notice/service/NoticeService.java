package com.zipper.notice.service;

import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.board.model.vo.Board;
import com.zipper.notice.dao.NoticeDAO;

public class NoticeService {
	private Connection con;
	private NoticeDAO nDAO = new NoticeDAO();
	
	// 게시글 리스트를 가지고 오는 메소드 
public ArrayList<Board> selectList() {
		
		con = getConnection(); // DB연결
		
		ArrayList<Board> result = nDAO.selectList(con); // DAO에서 받아온 결과가 배열이다.
		
		close(con);
		
		return result;
	}

	// 게시글 테이블에 bno로 조회하는 메소드
public Board selectOne(int bno) {
	con = getConnection(); // DAO에게 줘야 함 
	
	Board bs = nDAO.selectOne(con, bno); // DAO에서 받아오는 결과가 단 하나이다. 
	
	close(con);
	
	return bs; // bno로 조회한 게시글을 bs로 return 
}



}
