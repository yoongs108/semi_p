package com.zipper.zippop.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.zipper.board.model.vo.Board;
import com.zipper.myPage.model.dao.MyPageDAO;
import com.zipper.thumb.model.vo.Thumbnail;

import static com.zipper.common.JDBCTemplate.close;

public class ZippopDAO {
	
	private Properties prop = null;
	
	public ZippopDAO() {
		prop = new Properties();
		
		String filePath = MyPageDAO.class.getResource("/config/zippop-sql.properties").getPath();
		
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
				System.out.println("...");
				Thumbnail tn = new Thumbnail();
				
				tn.setUserId(rset.getString("mid"));
				tn.setBno(rset.getInt("bno"));
				tn.setBcontent(rset.getString("bcontent"));
				tn.setBoardfile(rset.getString("file_origin_name"));
				
				list.add(tn);
			}
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
