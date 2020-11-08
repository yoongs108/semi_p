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
	


	public HashMap<String, Object> selectOne(Connection con, int bno) {
		
		HashMap<String, Object> hmap = new HashMap<>();
		ArrayList<Attachment> aList = new ArrayList<>();
		ArrayList<Kit> kList = new ArrayList<>();
		ArrayList<Board> bList = new ArrayList<>();
		
		ClassList cl = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				cl = new ClassList();
				
				cl.setCno(bno);
				cl.setVno(rset.getInt("vno"));
				cl.setKno(rset.getInt("kno"));
				cl.setBno(rset.getInt("bno"));
				cl.setCname(rset.getString("cname"));
				cl.setCintro(rset.getString("cintro"));
				cl.setCourse(rset.getString("course"));
				cl.setPrice(rset.getInt("price"));

				
				Attachment at = new Attachment();
				
				at.setFno( rset.getInt("fno"));
				at.setBno( bno );
				at.setOriginname( rset.getString("originname"));
				at.setChangename( rset.getString("changename"));
				at.setFilepath(   rset.getString("filepath"));
				at.setUploaddate( rset.getDate("uploaddate"));
				at.setFlevel(     rset.getInt("flevel"));
				
				aList.add(at);
				
				Kit k = new Kit();
				k.setKno(rset.getInt("kno"));
				k.setKname(rset.getString("kdetail"));
				k.setCount(rset.getInt("count"));
				
				kList.add(k);
				
				
				Board b = new Board();
				b.setBno(bno);
				b.setBtype(rset.getInt("btype"));
				b.setMno(rset.getInt("mno"));
				b.setBtitle(rset.getString("btitle"));
				b.setBcontent(rset.getString("bcontent"));
				b.setBview(rset.getInt("bview"));
				b.setBdate(rset.getDate("bdate"));
				b.setBstatus(rset.getString("bstatus"));
				b.setUserId(rset.getString("userId"));
				b.setBwriter(rset.getString("bwriter"));
				b.setBoardfile(rset.getString("boardfile"));

				bList.add(b);
				
			}
		hmap.put("classList", cl);
		hmap.put("attachment", aList);
		hmap.put("kit", kList);
		hmap.put("board", bList);

		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		return hmap;
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

}
