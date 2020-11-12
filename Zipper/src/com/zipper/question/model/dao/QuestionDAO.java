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

import com.zipper.common.exception.QuestionException;
import com.zipper.member.model.vo.Member;
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

	// 1:1 문의내역 리스트
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
				q.setQcomdate(rset.getDate(9));
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
	
	// 1:1 문의 상세페이지
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
				qs.setQcomdate(rset.getDate(9));
				
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
	
	// 1:1 문의 작성
	public int insertQuestion(Connection con, Question q) throws QuestionException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQuestion");
		System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, q.getMno());
			pstmt.setString(2, q.getQcontent());
			pstmt.setString(3, q.getQtitle());
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
			throw new QuestionException("[DAO] : " + e.getMessage()); 
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 회원 아이디를 가지고 오기 위한 조회방법 
	public Member selectMember(Connection con, int mno) {
		Member result = null;
		ResultSet rset = null;

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMember"); // properties만들러 가야함 
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			result = new Member(
				   rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4), 
				   rset.getString(5), rset.getString(6), rset.getString(7), rset.getDate(8), 
				   rset.getDate(9), rset.getString(10), rset.getString(11), rset.getString(12), 
				   rset.getString(13), rset.getString(14));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertComment(Connection con, int qno, String qcomdate, String qcomment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, qcomment);
			pstmt.setInt(2, qno);
			System.out.println("query 준비"+sql);
			result = pstmt.executeUpdate();
			System.out.println("query실행");
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
			
		return result;
	
	}

	public int deleteQuestion(Connection con, int qno) throws QuestionException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQuestion");
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new QuestionException("[DAO] : " + e.getMessage()); 
		}
		
		return 0;
	}
}
