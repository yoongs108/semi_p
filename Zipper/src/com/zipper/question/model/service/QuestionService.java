package com.zipper.question.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.board.model.vo.Board;
import com.zipper.question.model.dao.QuestionDAO;
import com.zipper.question.model.vo.Question;

import java.sql.Connection;

public class QuestionService {
	private Connection con;
	private QuestionDAO qDAO = new QuestionDAO();
	
public ArrayList<Question> selectList() {
		
		con = getConnection();
		
		ArrayList<Question> result = qDAO.selectList(con);
		
		close(con);
		
		return result;
	}
}
