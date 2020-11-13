package com.admin.video.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.admin.video.model.dao.VideoInfoDAO;
import com.zipper.video.model.vo.Video;

public class VideoInfoService {

	private Connection con;
	private VideoInfoDAO vDAO = new VideoInfoDAO();
	
	public int getListCount() {
		
		con = getConnection();
		
		int result = vDAO.getListCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Video> selectList(int currentPage, int limit) {
		
		con = getConnection();
		
		ArrayList<Video> list = vDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

}
