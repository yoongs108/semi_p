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

		try {
			pstmt = con.prepareStatement(sql); 

			rset = pstmt.executeQuery(); // 조회한 결과값을 담겼다. 

			while(rset.next()) {
				Board bs = new Board();
				
				bs.setBno(rset.getInt(1));
				bs.setBtype(rset.getInt(2));
				bs.setMno(rset.getInt(3));
				bs.setBtitle(rset.getString(4));
				bs.setBcontent(rset.getString(5));
				bs.setBview(rset.getInt(6));
				bs.setBdate(rset.getDate(7));
				bs.setBstatus(rset.getString(8));
		
				list.add(bs);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}


	public Board selectOne(Connection con, int bno) { // connection 과 int는 받아오는 타입이다. 
		Board bs = new Board();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");

		System.out.println(sql);

		
		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				
				bs.setBno(rset.getInt(1));
				bs.setBtype(rset.getInt(2));
				bs.setMno(rset.getInt(3));
				bs.setBtitle(rset.getString(4));
				bs.setBcontent(rset.getString(5));
				bs.setBview(rset.getInt(6));
				bs.setBdate(rset.getDate(7));
				bs.setBstatus(rset.getString(8));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}

		return bs;
	}
}
