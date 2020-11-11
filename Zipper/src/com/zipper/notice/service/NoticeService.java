package com.zipper.notice.service;

import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.commit;
import static com.zipper.common.JDBCTemplate.getConnection;
import static com.zipper.common.JDBCTemplate.rollback;
import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.getConnection;
import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;

import com.zipper.common.exception.MemberException;
import com.zipper.member.model.dao.MemberDAO;
import com.zipper.member.model.vo.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.zipper.common.exception.NoticeException;
import com.zipper.board.model.vo.Board;
import com.zipper.notice.dao.NoticeDAO;


public class NoticeService {
	private Connection con;
	private NoticeDAO nDAO = new NoticeDAO();
	
	// 게시글 리스트를 가지고 오는 메소드 
public ArrayList<Board> selectList() {
		
		con = getConnection(); // DB연결
		
		ArrayList<Board> result = nDAO.selectList(con); // DAO에서 받아온 결과가 배열이다.
		
		close(con);
		
		return result;
	}

	// 게시글 테이블에 bno로 조회하는 메소드
public Board selectOne(int bno) throws NoticeException {
	con = getConnection(); // DAO에게 줘야 함 
	
	Board bs = nDAO.selectOne(con, bno); // DAO에서 받아오는 결과가 단 하나이다. 
	
	close(con);
	System.out.println("여기가널인가 "+bs);
	return bs; // bno로 조회한 게시글을 bs로 return 
}

public int insertNotice(Board b) throws NoticeException {
	con = getConnection();
	
	int result = nDAO.insertNotice(con, b);
	
	if(result > 0) {commit(con);
	}else {rollback(con);}
	
	close(con);
	
	return result;
}

public Board updateNotice(int bno) throws NoticeException {
	con = getConnection();
	
	Board bs = nDAO.selectOne(con, bno);
	
	close(con);
	
	return bs;
}

public int deleteNotice(int bno) throws NoticeException {
	con = getConnection();
	
	int result = nDAO.deleteNotice(con, bno);
	
	if(result > 0) {
		commit(con);
	} else {
		rollback(con);
	}
	
	close(con);
	return result;
}

public ArrayList<Board> selectList(int currentPage, int limit) {
	con = getConnection();
	
	ArrayList<Board> list = nDAO.selectList(con, currentPage, limit); // create method처리ok
	
	close(con);
	
	return list;

}


public int updateView(int bno, String btitle, String bcontent) throws NoticeException {
	con = getConnection();
	
	int result = nDAO.updateView(con, bno, btitle, bcontent);
	
	if(result > 0) {
		commit(con);
	} else {
		rollback(con);
	}
	
	close(con);
	return result;
}
}


