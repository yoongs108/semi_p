package com.zipper.boardComment.model.dao;

import static com.zipper.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.zipper.boardComment.model.dao.BoardCommentDAO;
import com.zipper.boardComment.model.vo.BoardComment;

public class BoardCommentDAO {

	private Properties prop;
	
	public BoardCommentDAO() {
		prop = new Properties();
		
		String filePath = BoardCommentDAO.class
				          .getResource("/config/comment-sql.properties")
				          .getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		
	}
	
	public ArrayList<BoardComment> selectList(Connection con, int bno) {
		
		ArrayList<BoardComment> clist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardComment bco = new BoardComment();
				
				bco.setComNo( 	  	rset.getInt("COM_NO") );
				bco.setMno(			rset.getInt("mno"));
				bco.setBno(			bno);
				bco.setMnick(		rset.getString("MNICK"));
				bco.setProfile(		rset.getString("PROFILE"));
				bco.setComContent(	rset.getString("COM_CONTENT"));
				bco.setComLevel(	rset.getInt("COM_LEVEL"));
				
				clist.add(bco);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return clist;
	}
	
	public int insertComment(Connection con, BoardComment comment) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, comment.getBno());
			pstmt.setInt(2, comment.getMno());
			pstmt.setInt(3, 1);
			// 첫 댓글은 참조하는 댓글이 없다.
			// 따라서 refcno 가 0으로 온다.
			
			pstmt.setString(4, "Y");
						
			pstmt.setString(5, comment.getComContent());
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteComment(Connection con, int comNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteComment");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, comNo);
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

 
}
