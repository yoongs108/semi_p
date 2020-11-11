package com.zipper.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.common.exception.QuestionException;
import com.zipper.question.model.service.QuestionService;
import com.zipper.question.model.vo.Question;

/**
 * Servlet implementation class QuestionInsert
 */
@WebServlet("/PTPUpdate.po") 
public class QuestionInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 문의내역의 제목, 작성일, 내용 
		String qcontent = request.getParameter("content");
		String qtitle = request.getParameter("title");
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		Question q = new Question();
		
		q.setMno(mno);
		q.setQtitle(qtitle);
		q.setQcontent(qcontent);
		
		QuestionService qs = new QuestionService();
		
		try {
			qs.insertQuestion(q);
			response.sendRedirect("selectList.qo");
			
		} catch (QuestionException e) {
			e.printStackTrace();
			
			request.setAttribute("exception", e);
			
			request.setAttribute("error-msg", "공지사항 등록 실패!");
			
			request.getRequestDispatcher("/views/common/errorPage.jsp")
					.forward(request, response);

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
