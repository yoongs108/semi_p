package com.zipper.help.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.common.exception.FaqException;
import com.zipper.common.exception.NoticeException;
import com.zipper.help.model.service.HelpService;


@WebServlet("/faqDeleteComplete.fq")
public class HelpFAQDelete extends HttpServlet {
	private static final long serialVersionUID = 1987L;
       

    public HelpFAQDelete() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		HelpService hs = new HelpService();
		
		try {
			int result = hs.deleteFAQ(bno);
			
			response.sendRedirect("helpfaq.fq");
			
		} catch (FaqException e) {
			request.setAttribute("error-msg", "FAQ삭제중 오류 발생");
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher("/views/common/errorPage.jsp")
					.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
