package com.zipper.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.zipper.board.model.dao.BoardDAO;
import com.zipper.board.model.vo.Board;
import static com.zipper.common.JDBCTemplate.*;


public class BoardDAO {

private Properties prop;
	
	public BoardDAO() {
		prop = new Properties();
		
		String filePath = BoardDAO.class
								  .getResource("/config/board-sql.properties") // config에 파일 생성해야함 
				                  .getPath();
		} // prop.load(new FileReader(filePath)가 try/catch처리가 안되서 임시로 해 놓음 ㅠㅠ 
		
		// prop.load(new FileReader(filePath));  // try/catch처리ok
		
		
	public int getListCount(Connection con) {
	
		
		return 0;
	}

}
