package com.zipper.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.common.exception.QuestionException;
import com.zipper.question.model.service.QuestionService;

/**
 * Servlet implementation class QuestionDelete
 */
@WebServlet("/qDelete.qo")
public class QuestionDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
			System.out.println("qno" + qno);
		QuestionService qs = new QuestionService();
		
		try {
			int result = qs.deleteQuestion(qno);
			
			response.sendRedirect("selectList.qo");
			
		} catch (QuestionException e) {
			request.setAttribute("error-msg", "공지사항 삭제 실패");
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher("/views/common/errorPage.jsp")
				   .forward(request, response);
			
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
