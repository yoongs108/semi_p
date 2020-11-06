package com.zipper.payment.model.dao;

import static com.zipper.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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

	public int selectPayment(Connection con) {
		
		int result = 0;	// 결과를 담을 변
		
		PreparedStatement pstmt = null;	// 실행할 Statement
		
		ResultSet rset = null;	// sql 실행 결과를 담을 ResultSet
		
		String sql = prop.getProperty("selectPayment");	// "selectPayment" sql 연결
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);	// DB, sql 연결
			
			rset = pstmt.executeQuery();	// sql 실행
			
			if(rset.next()) {	// ResultSet에 헤더 다음 행이 있다면..
				
				result = rset.getInt("pay");

			}
			
			System.out.println("조회 결과 확인 : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

}
