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
							.getResource("/config/paymentInfo-sql.properties")
							.getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 결제 목록 조회
	public ArrayList<Payment> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Payment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
						
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Payment p = new Payment();
				
				p.setPno(		rset.getString("pno"));
				p.setMno(		rset.getInt("mno"));
				p.setCno(		rset.getInt("cno"));
				p.setPayinfo(	rset.getString("payinfo"));
				p.setPdate(		rset.getDate("pdate"));
				p.setPstatus(	rset.getString("pstatus"));
				p.setTotal(		rset.getInt("total"));
				
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

	// 결제 수 조회
	public int getListCount(Connection con) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt(1);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

}
