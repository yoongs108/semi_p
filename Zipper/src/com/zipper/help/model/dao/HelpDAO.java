package com.zipper.help.model.dao;

import static com.zipper.common.JDBCTemplate.close;

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

public class HelpDAO {

	private Properties prop;
	
	public HelpDAO() {
		prop = new Properties();
		
		String filePath = HelpDAO.class.getResource("/config/helpFAQ-sql.properties")
							.getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Board> selectFAQ(Connection con) {
		
		//System.out.println("DAO 시작");

		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);			
			rset = pstmt.executeQuery();
			//System.out.println("쿼리 실행");
			
			while (rset.next()) {
				Board b = new Board();
				
				b.setBno(rset.getInt("bno"));
				b.setBtitle(rset.getString("btitle"));
				b.setBcontent(rset.getString("bcontent"));
				b.setFaqtype(rset.getInt("faqtype"));
				
				//System.out.println(b.getFaqType());
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		//System.out.println("DAO 종료 / " + list.size());
		
		return list;
	}

	public int updateFAQ(Connection con, Board b) throws NoticeException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateFaq");
		
		System.out.println(b.getBno());
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, b.getBtitle());
			pstmt.setString(2, b.getBcontent());
			pstmt.setInt(3, b.getBno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new NoticeException("[DAO] : " + e.getMessage());

		} finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int deleteFAQ(Connection con, int bno) throws NoticeException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFaq");
		
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

	public int insertFAQ(Connection con, Board b) throws NoticeException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFaq");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, b.getMno());
			pstmt.setString(2, b.getBtitle());
			pstmt.setString(3, b.getBcontent());
			pstmt.setInt(4, b.getFaqtype());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new NoticeException("[DAO] : " + e.getMessage());
	
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}

}
