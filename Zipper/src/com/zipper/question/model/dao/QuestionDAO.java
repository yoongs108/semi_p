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
			
			Question date = new Question();
			
			if(rset.next()) {
				date.setQdate(rset.getDate(1));
			}
			
			for(int i = 0 ; i < 8 ; i++) {
				Question q = new Question();
				
				q.setQno(i);
				q.setMno(404+i);
				q.setQtitle("1:1 문의내역 입니다.");
				q.setQdate(date.getQdate());
				
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
	
}
