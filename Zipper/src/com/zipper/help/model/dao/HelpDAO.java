package com.zipper.help.model.dao;

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
import static com.zipper.common.JDBCTemplate.*;

public class HelpDAO {

	private Properties prop;
	
	public HelpDAO() {
		prop = new Properties();
		
		String filePath = HelpDAO.class.getResource("/config/helpFAQ-sql.properties")
							.getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Board> selectFAQ(Connection con) {
		
		//System.out.println("DAO 시작");

		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);			
			rset = pstmt.executeQuery();
			//System.out.println("쿼리 실행");
			
			while (rset.next()) {
				Board b = new Board();
				
				b.setBno(rset.getInt("bno"));
				b.setBtitle(rset.getString("btitle"));
				b.setBcontent(rset.getString("bcontent"));
				b.setFaqType(rset.getInt("faqtype"));
				
				//System.out.println(b.getFaqType());
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		//System.out.println("DAO 종료 / " + list.size());
		
		return list;
	}

}
