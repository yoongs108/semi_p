package com.admin.payment.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.admin.payment.model.dao.paymentDAO;
import com.zipper.payment.model.vo.Payment;

public class PaymentService {
	
	private Connection con;
	private paymentDAO pDAO = new paymentDAO();
	
	// 결제 목록 조회
	public ArrayList<Payment> selectList(int currentPage, int limit) {

		con = getConnection();
		
		ArrayList<Payment> list = pDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
		
	}

	// 결제 목록 수 조회
	public int getListCount() {
		
		con = getConnection();
		
		int result = pDAO.getListCount(con);
		
		close(con);
		
		return result;
	}

}
