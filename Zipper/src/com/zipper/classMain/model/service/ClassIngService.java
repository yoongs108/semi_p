package com.zipper.classMain.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.zipper.classMain.model.dao.ClassDAO;
import com.zipper.common.exception.IngException;
import com.zipper.common.exception.ScrapException;

public class ClassIngService {
	
	private Connection con;
	private ClassDAO cDAO = new ClassDAO();
	
	public ArrayList<Class> selectClass() throws IngException {
		
		con = getConnection();
		
		ArrayList<Class> list = cDAO.ClassList(con);
		
		close(con);
		
		return list;
	}
}
