package com.admin.video.model.dao;

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

import com.admin.userInfo.model.dao.UserInfoDAO;
import com.zipper.member.model.vo.Member;
import com.zipper.video.model.vo.Video;

public class VideoInfoDAO {

	private Properties prop;
	
	public VideoInfoDAO() {
		prop = new Properties();
		
		String filePath = VideoInfoDAO.class
							.getResource("/config/videoInfo-sql.properties")
							.getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount(Connection con) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
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

	public ArrayList<Video> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Video> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		System.out.println(sql);
		
//		try {
//			pstmt = con.prepareStatement(sql);
//			
//			// 1. 마지막 행의 번호
//			// 2. 첫 행의 번호
//			int startRow = (currentPage - 1) * limit + 1;
//			int endRow = startRow + limit - 1;
//
//			pstmt.setInt(1, endRow);
//			pstmt.setInt(2, startRow);
//			
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				
//				Member m = new Member();
//				
//				m.setMno(		rset.getInt("mno"));
//				m.setMgrd(		rset.getString("mgrd"));
//				m.setMid(		rset.getString("mid"));
//				m.setMpwd(		rset.getString("mpwd"));
//				m.setMnick(		rset.getString("mnick"));
//				m.setMcontact(	rset.getString("mcontact"));
//				m.setMemail(	rset.getString("memail"));
//				m.setMendate(	rset.getDate("mendate"));
//				m.setMexdate(	rset.getDate("mexdate"));
//				m.setMstatus(	rset.getString("mstatus"));
//				m.setAddress(	rset.getString("address"));
//				m.setIntro(		rset.getString("intro"));
//				m.setScrap(		rset.getString("scrap"));
//				m.setProfile(	rset.getString("profile"));
//				
//				list.add(m);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
		
		return list;
	}

}
