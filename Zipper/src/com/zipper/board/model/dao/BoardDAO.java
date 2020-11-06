package com.zipper.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.zipper.board.model.dao.BoardDAO;
import com.zipper.board.model.vo.Board;

import static com.zipper.common.JDBCTemplate.*;


public class BoardDAO {

private Properties prop;
	
	public BoardDAO() {
		prop = new Properties();
		
		String filePath = BoardDAO.class
								  .getResource("/config/notice-sql.properties") // config에 파일 생성해야함 
				                  .getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	public ArrayList<Board> selectList(Connection con) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		System.out.println(sql);
		
		 //pstmt = con.prepareStatement(sql); // try/catch 처리ok
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			//int startRow = (currentPage - 1) * limit + 1; 
			//int endRow = startRow + limit - 1;
			
			//pstmt.setInt(1, endRow);
			//pstmt.setInt(2, startRow);
			rset = pstmt.executeQuery();
			Board date = new Board();
			if(rset.next()) {
				date.setBdate(rset.getDate(1));
			}
			
			//while(rset.next()) {
			for(int i = 0 ; i < 3 ; i++) {
				Board b = new Board();
				
				b.setBno(i);
				b.setBtype(4);
				b.setBtitle("공지제목" +i);
				b.setBdate(date.getBdate());
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	/*
	 * public int getListCount(Connection con) { ArrayList<Board> list = new
	 * ArrayList<>(); PreparedStatement pstmt = null; ResultSet rset = null;
	 * 
	 * try { Board b = new Board(); b.setBno("Bno"); } catch{
	 * 
	 * }
	 * 
	 * 
	 * return 0; }
	 */

}
