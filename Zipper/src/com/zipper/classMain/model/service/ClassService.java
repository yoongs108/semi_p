package com.zipper.classMain.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.zipper.classMain.model.dao.ClassDAO;

public class ClassService {
	
	private Connection con;
	private ClassDAO cDAO = new ClassDAO();
	
	public HashMap<String, Object> selectOne(int bno) {
		
		con = getConnection();
		
		HashMap<String, Object> hmap = cDAO.selectOne(con, bno);
		
		close(con);
		
		return hmap;
	}

	

}
