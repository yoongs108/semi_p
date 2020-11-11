package com.admin.payment.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.admin.payment.model.dao.paymentDAO;
import com.zipper.payment.model.vo.Payment;

public class paymentService {
	
	private Connection con;
	private paymentDAO pDAO = new paymentDAO();
	
	public ArrayList<Payment> selectList() {

		con = getConnection();
		
		ArrayList<Payment> list = pDAO.selectList(con);
		
		close(con);
		
		return list;
		
	}

}
