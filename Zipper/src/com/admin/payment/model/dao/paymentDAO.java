package com.admin.payment.model.dao;

import static com.zipper.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.zipper.payment.model.vo.Payment;

public class paymentDAO {

	private Properties prop;
	
	public paymentDAO() {
		prop = new Properties();
		
		String filePath = paymentDAO.class
							.getResource("/config/userInfo-sql.properties")
							.getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Payment> selectList(Connection con) {
		
		ArrayList<Payment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Payment p = new Payment();
				
				p.setMno(		rset.getInt("mno"));
//				p.setMgrd(		rset.getString("mgrd"));
//				p.setMid(		rset.getString("mid"));
//				p.setMpwd(		rset.getString("mpwd"));
//				p.setMnick(		rset.getString("mnick"));
//				p.setMcontact(	rset.getString("mcontact"));
//				p.setMemail(	rset.getString("memail"));
				
				list.add(p);
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
