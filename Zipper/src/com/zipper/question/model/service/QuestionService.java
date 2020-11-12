package com.zipper.question.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.zipper.board.model.vo.Board;
import com.zipper.common.exception.QuestionException;
import com.zipper.member.model.vo.Member;
import com.zipper.question.model.dao.QuestionDAO;
import com.zipper.question.model.vo.Question;

public class QuestionService {
	private Connection con;
	private QuestionDAO qDAO = new QuestionDAO();
	
// 1:1문의 리스트를 가지고 오는 메소드 
public ArrayList<Question> selectList() {
		
		con = getConnection();
		
		ArrayList<Question> result = qDAO.selectList(con);
		
		close(con);
		
		return result;
	}

// 1:1문의 테이블 상세페이지 조회
public Question selectOne(int qno) {
	con = getConnection();
	
	Question qs = qDAO.selectOne(con, qno);
	
	close(con);
	
	return qs;
}

// 1:1문의  작성 
public int insertQuestion(Question q) throws QuestionException {
	con = getConnection();
	
	int result = qDAO.insertQuestion(con, q);
	
	if(result > 0) commit(con);
	else rollback(con);
	
	close(con);
	
	return result;
}
// 멤버 조회 
public Member selectMember(int mno) {
	con = getConnection();
	
	Member result = qDAO.selectMember(con, mno);
	
	close(con);
	
	return result;
}
// 답변 작성 
public int insertComment(int qno, String qcomdate, String qcomment) {
	con = getConnection();
	
	int result = qDAO.insertComment(con, qno, qcomdate, qcomment);
	
	close(con);
	
	return result;
}
// 1:1 문의 삭제 
public int deleteQuestion(int qno) throws QuestionException {
	con = getConnection();
	
	int result = qDAO.deleteQuestion(con, qno);
	
	close(con);
	
	return result;
}

// 1:1문의 게시글 수 조회
public int getListCount() {
	con = getConnection();
	
	int result = qDAO.getListCount(con);
	
	close(con);
	
	return result;
}

// 페이징 처리 리스트 
public ArrayList<Question> selectList(int currentPage, int limit) {
	con = getConnection();
	
	ArrayList<Question> list = qDAO.selectList(con, currentPage, limit); // create method처리ok
	
	close(con);
	
	return list;
	}
}



