package com.zipper.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.payment.model.service.PaymentService;

/**
 * Servlet implementation class PaymentForm
 */
@WebServlet("/payment.pm")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PaymentService ps = new PaymentService();
		
		int result = ps.selectPayment();
		
		String page = "";
		
		if(result > 0) {
			// 결제번호 조회 성공
			request.setAttribute("pay", result);
			page = "views/payment/payment.jsp";
		} else {
			request.setAttribute("error-msg", "sdfasf");
			page = "views/common/errorPage.jsp";
			
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
