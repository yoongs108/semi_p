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

@WebServlet("/faqUpdateComplete.fq")
public class HelpFAQUpdateSubmit extends HttpServlet {
	private static final long serialVersionUID = 1234L;
       

    public HelpFAQUpdateSubmit() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HelpService hs = new HelpService();
		
		Board b = new Board();
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String btitle = request.getParameter("title");
		String bcontent = request.getParameter("content");
		int faqType = Integer.parseInt(request.getParameter("faqtype"));
		
		//System.out.println(bno + " / " + btitle + " / " + bcontent + " / " + faqType);
		
		b.setBno(bno);
		b.setBtitle(btitle);
		b.setBcontent(bcontent);
		b.setFaqtype(faqType);
		
		try {
			int result = hs.updateFAQ(b);
			
			response.sendRedirect("helpfaq.fq");
			
		} catch (FaqException e) {
			request.setAttribute("error-msg", "FAQ 수정 실패");
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
		
		//System.out.println(b.getBno() + " / " + b.getBtitle() + " / " + b.getBcontent() + " / " + b.getFaqtype());

		
		
		
		//request.getRequestDispatcher("views/help/helpFAQ.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
