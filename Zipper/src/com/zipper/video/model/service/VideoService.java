package com.zipper.video.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.classMain.model.vo.ClassList;
import com.zipper.common.exception.VideoException;
import com.zipper.video.model.dao.VideoDAO;
import com.zipper.video.model.vo.Video;

public class VideoService {

	private Connection con;
	private VideoDAO vDAO = new VideoDAO();
	
	public int insertVideo(Video v) {
		
		con = getConnection();
		
		int result = vDAO.insertVideo(con, v);

		
		if(result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
			
		return result;
	}

	public Video selectOne(int vno) {
		con = getConnection();
		
		Video v = vDAO.selectOne(con, vno);
		
		close(con);
		
		return v;
	}

	public ArrayList<Video> selectList(int cno, int currentPage, int limit) throws VideoException {
		con = getConnection();
		
		ArrayList<Video> list = vDAO.selectList(con, cno, currentPage, limit);
		
		close(con);
		
		return list;
	}

	// 비디오 수 조회
	public int getListCount(int cno) {
		
		con = getConnection();
		
		int result = vDAO.getListCount(con, cno);
		
		close(con);
		
		return result;
	}

	public ArrayList<ClassList> selectVList() {
		
		con = getConnection();
	      
	    ArrayList<ClassList> list = vDAO.selectVList(con);
	      
	    close(con);
	      
	    return list;
	}

}
