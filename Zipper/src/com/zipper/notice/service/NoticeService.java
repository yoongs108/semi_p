package com.zipper.notice.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.board.model.vo.Board;
import com.zipper.common.exception.NoticeException;
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

	// 공지사항 작성 
	public int insertNotice(Board b) throws NoticeException {
		con = getConnection();
		System.out.println("sass");
		int result = nDAO.insertNotice(con, b);
		
		if(result > 0) {commit(con);
		}else {rollback(con);}
		
		close(con);
		
		return result;
	}
	
	// 공지사항 수정 
	public Board updateNotice(int bno) throws NoticeException {
		con = getConnection();
		
		Board bs = nDAO.selectOne(con, bno);
		
		close(con);
		
		return bs;
	}
	
	// 공지사항 삭제
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

	
	// 게시글 수정
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
	
	// 게시글 리스트 
	public ArrayList<Board> selectList(int currentPage, int limit) {
		con = getConnection();
		
		ArrayList<Board> list = nDAO.selectList(con, currentPage, limit); // create method처리ok
		
		close(con);
		
		return list;
		
	}

	// 게시글 수 조회
	public int getListCount() {
		
		con = getConnection();
		
		int result = nDAO.getListCount(con);
		
		close(con);
		
		return result;
	}
}


