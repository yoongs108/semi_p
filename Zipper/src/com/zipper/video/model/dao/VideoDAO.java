package com.zipper.video.model.dao;

import static com.zipper.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.zipper.common.exception.VideoException;
import com.zipper.video.model.vo.Video;

public class VideoDAO {

	private Properties prop = null;
	
	public VideoDAO() {
		prop = new Properties();
		
		String filePath = VideoDAO.class
				           .getResource("/config/video-sql.properties")
				           .getPath();
		
		try {
			prop.load( new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int insertVideo(Connection con, Video v) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertVideo");
		
		System.out.println(sql);
		System.out.println(v);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, v.getVname());
			pstmt.setString(2, v.getVideo());
			pstmt.setString(3, v.getVtext());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public Video selectOne(Connection con, int vno) {
		Video v = new Video();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, vno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				v.setVno(rset.getInt("vno"));
				v.setVname(rset.getString("vname"));
				v.setVideo(rset.getString("video"));
				v.setVtext(rset.getString("vtext"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return v;
	}

	public ArrayList<Video> selectList(Connection con, int cno, int currentPage, int limit) throws VideoException {
		
		ArrayList<Video> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, cno);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				Video v = new Video();
				
				v.setVno(rset.getInt(1));
				v.setVname(rset.getString(2));
				v.setVideo(rset.getString(3));
				v.setVtext(rset.getString(4));
				v.setPrice(rset.getInt(5));
				v.setCname(rset.getString(6));
				v.setFileNewName(rset.getString(7));
				v.setTname(rset.getString("tname"));
				
				list.add(v);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new VideoException("[DAO] : " + e.getMessage());
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getListCount(Connection con, int cno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt(1);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

}
