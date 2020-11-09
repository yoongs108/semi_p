package com.zipper.question.model.dao;

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
import com.zipper.question.model.vo.Question;

public class QuestionDAO {

private Properties prop;
public QuestionDAO() {
	prop = new Properties();
	
	String filePath = QuestionDAO.class
							  .getResource("/config/question-sql.properties") 
			                  .getPath();
	
	try {
		prop.load(new FileReader(filePath));
		
	} catch (FileNotFoundException e) {
		
		e.printStackTrace();
	} catch (IOException e) {
		
		e.printStackTrace();
	}
}
	public ArrayList<Question> selectList(Connection con) {
		ArrayList<Question> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		System.out.println("아놔");
		
		System.out.println(sql);
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Question q = new Question();
				
				q.setQno(rset.getInt(1));
				q.setMno(rset.getInt(2));
				q.setQcontent(rset.getString(3));
				q.setQdate(rset.getDate(4));
				q.setQtitle(rset.getString(5));
				q.setQstate(rset.getString(6));
				q.setQid(rset.getString(7));
				q.setQcomment(rset.getString(8));
			
				list.add(q);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public Question selectOne(Connection con, int qno) {
		Question qs = new Question();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				qs.setQno(rset.getInt(1));
				qs.setMno(rset.getInt(2));
				qs.setQcontent(rset.getString(3));
				qs.setQdate(rset.getDate(4));
				qs.setQtitle(rset.getString(5));
				qs.setQstate(rset.getString(6));
				qs.setQid(rset.getString(7));
				qs.setQcomment(rset.getString(8));
				
			}
			System.out.println("상세 question : "+qs.toString());
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		return qs;
	}
	
}
