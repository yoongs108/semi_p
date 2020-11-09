package com.zipper.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.zipper.common.exception.PaymentException;
import com.zipper.payment.model.service.PaymentService;
import com.zipper.payment.model.vo.Payment;
/**
 * Servlet implementation class OrderConfirm
 */
@WebServlet("/insertPayment.pm")
public class InsertPayment extends HttpServlet {
	private static final long serialVersionUID = 123123L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pno = request.getParameter("pno");
		int mno = Integer.parseInt(request.getParameter("mno"));
		int cno = Integer.parseInt(request.getParameter("cno"));
		int total = Integer.parseInt(request.getParameter("price")); 
		String payinfo = request.getParameter("payinfo");
		
		Payment pm = new Payment();
		
		pm.setPno(pno);
		pm.setMno(mno);
		pm.setCno(cno);
		pm.setTotal(total);
		pm.setPayinfo(payinfo);
		
		PaymentService ps = new PaymentService();
		
		try {
			int result = ps.insertPayment(pm);
			new Gson().toJson(result, response.getWriter());
			
		} catch (PaymentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
