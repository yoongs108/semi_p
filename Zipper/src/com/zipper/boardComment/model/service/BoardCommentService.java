package com.zipper.boardComment.model.service;

import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.commit;
import static com.zipper.common.JDBCTemplate.getConnection;
import static com.zipper.common.JDBCTemplate.rollback;
import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.zipper.boardComment.model.dao.BoardCommentDAO;
import com.zipper.boardComment.model.vo.BoardComment;

public class BoardCommentService {

	private Connection con;
	
	private BoardCommentDAO bcDAO = new BoardCommentDAO();
	
	public ArrayList<BoardComment> selectList(int bno) {
		
		con = getConnection();
		
		ArrayList<BoardComment> clist = bcDAO.selectList(con, bno);
		
		close(con);
		
		return clist;
	}
	
	public int insertComment(BoardComment comment) {
		con = getConnection();
		
		int result = bcDAO.insertComment(con, comment);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	

}
 