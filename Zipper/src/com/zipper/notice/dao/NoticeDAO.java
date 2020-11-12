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
import com.zipper.common.exception.NoticeException;

public class NoticeDAO {

	private Properties prop;

	public NoticeDAO() {
		prop = new Properties();

		String filePath = NoticeDAO.class.getResource("/config/notice-sql.properties") // config에 파일 생성해야함
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

			while (rset.next()) {
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

	public Board selectOne(Connection con, int bno) throws NoticeException { // connection 과 int는 받아오는 타입이다.
		Board bs = new Board();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectOne");

		System.out.println(sql);

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bno);

			rset = pstmt.executeQuery();

			while (rset.next()) {

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
			throw new NoticeException("[DAO] : " + e.getMessage());

		} finally {
			close(rset);
			close(pstmt);
		}

		return bs;
	}

	public int insertNotice(Connection con, Board b) throws NoticeException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		System.out.println(sql);
		// pstmt = con.prepareStatement(sql); try/catch 처리ok
		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, b.getBtitle());
			pstmt.setString(2, b.getBcontent());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw new NoticeException("[DAO] : " + e.getMessage());
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int deleteNotice(Connection con, int bno) throws NoticeException {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteNotice");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			throw new NoticeException("[DAO] : " + e.getMessage());
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");
		
		System.out.println(sql);

		try {
			pstmt = con.prepareStatement(sql);

			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				Board b = new Board();

				b.setBno(rset.getInt("bno"));
				b.setBtype(rset.getInt("btype"));
				b.setMno(rset.getInt("mno"));
				b.setBtitle(rset.getString("btitle"));
				b.setBcontent(rset.getString("bcontent"));
				b.setBdate(rset.getDate("bdate"));
//				b.setBview(rset.getInt("bview"));
//				b.setBstatus(rset.getString("bstatus"));
//				b.setCno(rset.getInt("cno"));
//				b.setFaqtype(rset.getInt("faqtype")); 
				
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


	public int updateView(Connection con, int bno, String btitle, String bcontent) throws NoticeException {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateNotice");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, btitle);
			pstmt.setString(2, bcontent);
			pstmt.setInt(3, bno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			throw new NoticeException("[DAO] : " + e.getMessage());
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int getListCount(Connection con) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt(1);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
		
}
