package com.zipper.payment.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;

import com.zipper.payment.model.dao.PaymentDAO;

public class PaymentService {
	
	private Connection con;	// 데이터베이스 연결할 connection 생성
	private PaymentDAO pDAO = new PaymentDAO(); // 서비스 공통으로 사용 될 DAO 생성

	public int selectPayment() {
		
		con = getConnection();
		
		int result = pDAO.selectPayment(con); // 연결 정보 con
		
		close(con);
		
		return result;
	}
	
	
}
