package com.zipper.classMain.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.zipper.classMain.model.dao.ClassDAO;
import com.zipper.classMain.model.vo.ClassList;
import com.zipper.payment.model.vo.Payment;

public class ClassService {
	
	private Connection con;
	private ClassDAO cDAO = new ClassDAO();
	
	// 클래스 리스트 조회
	public ArrayList<ClassList> selectList() {
		
		con = getConnection();
		
		ArrayList<ClassList> list = cDAO.selectList(con);
		
		close(con);
		
		return list;
	}

	
	
	public ClassList selectOne(int cno) {
		
		con = getConnection();

		ClassList cList = cDAO.selectOne(con, cno);
		
		close(con);
		
		return cList;
	}



	public ArrayList<Payment> classingList(int mno) {
		
		con = getConnection();
		
		ArrayList<Payment> list = cDAO.classingList(con, mno);
		
		close(con);
		
		return list;
	}
	


	

}
