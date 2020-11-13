package com.zipper.zippop.model.service;

import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.commit;
import static com.zipper.common.JDBCTemplate.getConnection;
import static com.zipper.common.JDBCTemplate.rollback;
import static com.zipper.common.JDBCTemplate.close;
import static com.zipper.common.JDBCTemplate.commit;
import static com.zipper.common.JDBCTemplate.getConnection;
import static com.zipper.common.JDBCTemplate.rollback;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.zipper.board.model.vo.Attachment;
import com.zipper.board.model.vo.Board;
import com.zipper.thumb.model.vo.Thumbnail;
import com.zipper.zippop.model.dao.ZippopDAO;

public class ZippopService {

	private Connection con;
	private ZippopDAO zDAO = new ZippopDAO();
	
	public ArrayList<Thumbnail> selectList(int currentPage, int limit) {
		
		con = getConnection();
		
		ArrayList<Thumbnail> list = zDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int insertZippop(Thumbnail t, Attachment at) {
		
		con = getConnection();
		
		int result = 0;
		
		int result1 = zDAO.insertZippop(con, t);
		
		//System.out.println("Service Board Insert : " + result1);
		
		if (result1 > 0) {
			int bno = zDAO.getCurrentBno(con);
			
			at.setBno(bno);
		}
		
		int result2 = 0;
		
		result2 = zDAO.insertZipAtt(con, at);
		
		
		//System.out.println("Service Attachment Insert : " + result2);
		
		
		if (result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		
		close(con);
		
		//System.out.println("Service total Insert : " + result);
		
		
		return result;
	}
	
	// 집팝 상세조회
	public Board selectOne(int bno) {
		con = getConnection();
		
		Board b = zDAO.selectOne(con, bno);
		
		close(con);
		
		return b;
	}

	//집팝 삭제
	
	public int deleteZippop(int bno) {
		con = getConnection();
		
		
		int result = zDAO.deleteZippop(con, bno);
		
		if(result > 0) {
			//게시글 삭제가 완료되었다면, 첨부파일도 삭제한다.					
			

			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	public int deleteZipAtt(int bno) {
		con = getConnection();
		
		
		int result = zDAO.deleteZipAtt(con, bno);
		
		if(result > 0) {
			//게시글 삭제가 완료되었다면, 첨부파일도 삭제한다.					
			

			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int getListCount() {
		
		con = getConnection();
		
		int result = zDAO.getListCount(con);
		
		close(con);
		
		return result;
	}
	
}
