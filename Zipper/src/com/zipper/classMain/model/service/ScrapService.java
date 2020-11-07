package com.zipper.classMain.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.zipper.classMain.model.dao.ClassDAO;
import com.zipper.common.exception.ScrapException;

public class ScrapService {
	
	private Connection con;
	private ClassDAO cDAO = new ClassDAO();

	public ArrayList<Class> selectClass() throws ScrapException {
		
		con = getConnection();
		
		ArrayList<Class> list = cDAO.scrapList(con);
		
		close(con);
		
		return list;
	
	}
	
}
