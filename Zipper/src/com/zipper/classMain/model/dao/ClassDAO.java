package com.zipper.classMain.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.zipper.thumb.model.vo.Attachment;
import com.zipper.board.model.vo.Board;
import com.zipper.classMain.model.vo.ClassList;
import com.zipper.classMain.model.vo.Kit;
import com.zipper.classMain.model.vo.Video;

import static com.zipper.common.JDBCTemplate.*;


public class ClassDAO {
	
	private Properties prop = null;
	
	public ClassDAO() {
		prop = new Properties();
		
		String filePath = ClassDAO.class // MemberDAO 클래스 기준으로 봤을때
						 .getResource("/config/class-sql.properties") // 최상위 더에서 아래 경로
						 .getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	

	// 공주
	public ClassList selectOne(Connection con, int cno) {
		
		ClassList classList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				classList = new ClassList();
				
				classList.setCno(cno);
				classList.setVno(rset.getInt("vno"));
				classList.setKno(rset.getInt("kno"));
				classList.setCname(rset.getString("cname"));
				classList.setPrice(rset.getInt("price"));
				classList.setCintro(rset.getString("cintro"));
				classList.setCourse(rset.getString("course"));
				classList.setFileNewName(rset.getString("FILE_NEW_NAME"));
				classList.setKdetail(rset.getString("kdetail"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	

		return classList;
	}

	// 윤진 작성

	public HashMap<String, Object> IngClass(Connection con, int bno) {
		HashMap<String, Object> hmap = new HashMap<>();
		ArrayList<Attachment> list = new ArrayList<>();		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectClass");
		
		try {
			pstmt = con.prepareStatement(sql);
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	// 클래스 리스트 조회
	public ArrayList<ClassList> selectList(Connection con) {
		ArrayList<ClassList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ClassList cl = new ClassList();
				
				cl.setCno(rset.getInt("cno"));
				cl.setCname(rset.getString("cname"));
				cl.setPrice(rset.getInt("price"));
				cl.setFileNewName(rset.getString("FILE_NEW_NAME")); // 클래스 사진
				
				list.add(cl);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
