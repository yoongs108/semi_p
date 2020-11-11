package com.zipper.video.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

	public ArrayList<Video> selectList() throws VideoException {
		con = getConnection();
		
		ArrayList<Video> list = vDAO.selectList(con);
		
		close(con);
		
		return list;
	}

}
