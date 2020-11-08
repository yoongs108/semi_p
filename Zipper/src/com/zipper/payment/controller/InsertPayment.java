package com.zipper.payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String pno = request.getParameter("merchant_uid");
		String cname = request.getParameter("cName");
		int totalPrice = Integer.parseInt(request.getParameter("price")); 
		String mnick = request.getParameter("name");
		
		Payment pm = new Payment(pno, cname, totalPrice, mnick);
		
		PaymentService ps = new PaymentService();
		
		try {
			ps.insertPayment(pm);

		} catch (PaymentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			request.setAttribute("error-msg", "결제정보 저장 실패");
			request.setAttribute("exception", e);
			
			view.forward(request, response);
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
