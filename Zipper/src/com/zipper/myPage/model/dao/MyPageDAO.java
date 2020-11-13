package com.zipper.myPage.model.dao;

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

import com.zipper.thumb.model.vo.Thumbnail;

public class MyPageDAO {

	private Properties prop = null;
	
	public MyPageDAO() {
		prop = new Properties();
		
		String filePath = MyPageDAO.class.getResource("/config/myPage-sql.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}		
	}
	
	public ArrayList<Thumbnail> selectList(Connection con) {
		
		ArrayList<Thumbnail> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Thumbnail tn = new Thumbnail();
				
				tn.setBno(rset.getInt("bno"));
				tn.setBtitle(rset.getString("btitle"));
				tn.setBcontent(rset.getString("bcontent"));
				tn.setBview(rset.getInt("bview"));
				tn.setBoardfile(rset.getString("file_origin_name"));
				tn.setProfile(rset.getString("profile"));
				tn.setMno(rset.getInt("mno"));
				tn.setUserId(rset.getString("mnick"));
				
				list.add(tn);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

}
