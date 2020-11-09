package com.zipper.payment.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.payment.model.service.PaymentService;
import com.zipper.payment.model.vo.Payment;

/**
 * Servlet implementation class PaymentForm
 */
@WebServlet("/beforePayment.pm")
public class BeforePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BeforePayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		Payment payment = new PaymentService().beforePayment(cno);
		
		String page = "";
		
	    if(payment != null) {
	         request.setAttribute("pm", payment);
	     
	         page = "views/payment/payment.jsp";
	      } else {
	         request.setAttribute("exception", new Exception("결제 정보 불러오기 실패"));
	         request.setAttribute("error-msg", "불러오기 실패!!");
	         
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
