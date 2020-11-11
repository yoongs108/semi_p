package com.zipper.guide.model.DAO;

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

public class GuideDAO {
	
private Properties prop;
	
	public GuideDAO() {
		
		prop = new Properties();
		
		String filePath = GuideDAO.class
				          .getResource("/config/guide-sql.properties")
				          .getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		
	}

	// 가이드 목록 조회
	public ArrayList<Board> selectList(Connection con) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null; //임포트
		ResultSet rset = null; //임포트
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);  //임포트
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Board bo = new Board();
				
				bo.setBno(		rset.getInt("bno"));
				bo.setBtitle(	rset.getString("btitle"));
				bo.setBcontent(	rset.getString("bcontent"));
				bo.setBoardfile(rset.getString("boardfile"));
				
				list.add(bo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); // 임포트 스태틱(import static com.kh.jsp.common.JDBCTemplate.*;) 해주기
			close(pstmt);
		}
		
		return list;
	}
	
	// 가이드 상세 조회
	public Board selectOne(Connection con, int bno) {
		
		Board board = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				board = new Board();
				
				board.setBno(		bno);
				board.setBtitle(	rset.getNString("btitle"));
				board.setBcontent(	rset.getNString("bcontent"));
				board.setBoardfile(	rset.getNString("boardfile"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return board;
	}


}
