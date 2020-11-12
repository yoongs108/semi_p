package com.zipper.help.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.board.model.vo.Board;
import com.zipper.common.exception.FaqException;
import com.zipper.help.model.service.HelpService;

/**
 * Servlet implementation class HelpFAQInsert
 */
@WebServlet("/insertFaq.fq")
public class HelpFAQInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HelpFAQInsert() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int mno = Integer.parseInt(request.getParameter("mno"));
		int faqType = Integer.parseInt(request.getParameter("faqtype"));
		String btitle = request.getParameter("title");
		String bcontent = request.getParameter("content");
		
		Board b = new Board();
		
		b.setMno(mno);
		b.setFaqtype(faqType);
		b.setBtitle(btitle);
		b.setBcontent(bcontent);
		
		HelpService hs = new HelpService();
		
		try {
			hs.insertFaq(b);
			response.sendRedirect("helpfaq.fq");
			
		} catch (FaqException e) {
			e.printStackTrace();
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "공지사항 등록 실패!");
			request.getRequestDispatcher("/views/common/errorPage.jsp")
					.forward(request, response);

			
		}
		
		//System.out.println(mno + " / " + faqType);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
