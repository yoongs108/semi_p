package com.zipper.payment.model.dao;

import static com.zipper.common.JDBCTemplate.*;

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

import com.zipper.board.model.vo.Attachment;
import com.zipper.classMain.model.vo.ClassList;
import com.zipper.classMain.model.vo.Kit;
import com.zipper.common.exception.MemberException;
import com.zipper.common.exception.PaymentException;
import com.zipper.payment.model.vo.Payment;

public class PaymentDAO {

	// SQL을 별도로 보관하는 Properties 파일 사용하기
	private Properties prop;
	
	public PaymentDAO() {
		prop = new Properties();
		
		String filePath = PaymentDAO.class // MemberDAO 클래스 기준으로 봤을때
						 .getResource("/config/payment-sql.properties") // 최상위 더에서 아래 경로
						 .getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

	public ClassList beforePayment(Connection con, int cno) {
		
		ClassList cl = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("beforePayment");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cl = new ClassList();
				
				cl.setCno(cno);
				cl.setCname(rset.getString("cname"));
				cl.setPrice(rset.getInt("price"));
				cl.setFileNewName(rset.getString("file_new_name"));
				// 강사명
//				cl.setPayinfo(rset.getString("payinfo"));
//				cl.setPdate(rset.getDate("pdate"));
//				cl.setPstatus(rset.getString("pstatus"));
//				cl.setTotal(rset.getInt("total"));
				System.out.println(cl);
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cl;
	}

	public int insertPayment(Connection con, Payment pm) throws PaymentException {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPayment");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pm.getPno());
			pstmt.setInt(2,  pm.getMno());
			pstmt.setInt(3,  pm.getCno());
			pstmt.setString(4,  pm.getPayinfo());
			pstmt.setInt(5, pm.getTotal());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new PaymentException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		return result;
	}

}
