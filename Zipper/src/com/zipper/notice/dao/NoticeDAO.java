package com.zipper.notice.dao;

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


import com.zipper.board.model.vo.Board;

public class NoticeDAO {

	private Properties prop;

	public NoticeDAO() {
		prop = new Properties();
		
		String filePath = NoticeDAO.class
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

		// pstmt = con.prepareStatement(sql); // try/catch 처리ok
		try {
			pstmt = con.prepareStatement(sql); 

			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			// int startRow = (currentPage - 1) * limit + 1;
			// int endRow = startRow + limit - 1;

			// pstmt.setInt(1, endRow);
			// pstmt.setInt(2, startRow);
			rset = pstmt.executeQuery();

			Board date = new Board();

			if (rset.next()) {
				date.setBdate(rset.getDate(1));
			}

			// while(rset.next()) {
			for (int i = 0; i < 8; i++) {
				Board b = new Board();

				b.setBno(i);
				b.setBtype(4);
				b.setBtitle("공지제목" + i);
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

	public Board selectOne(Connection con, int bno) { // connection 과 int는 받아오는 타입이다. 
		Board bs = new Board();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

		System.out.println(sql);

		// pstmt = con.prepareStatement(sql); // try/catch 처리ok
		try {
			pstmt = con.prepareStatement(sql);

			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			// int startRow = (currentPage - 1) * limit + 1;
			// int endRow = startRow + limit - 1;

			// pstmt.setInt(1, endRow);
			// pstmt.setInt(2, startRow);
			rset = pstmt.executeQuery();

			Board date = new Board();

			if (rset.next()) {
				date.setBdate(rset.getDate(1));
			}

			// while(rset.next()) {
		
				bs.setBno(bno);
				bs.setBtype(4);
				bs.setBtitle("공지제목" + bno);
				bs.setBcontent("공지사항입니다." + bno);
				bs.setBdate(date.getBdate());

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return bs;
	}
}
