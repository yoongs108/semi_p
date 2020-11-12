package com.zipper.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.question.model.service.QuestionService;
import com.zipper.question.model.vo.Question;

/**
 * Servlet implementation class CommentInsert
 */
@WebServlet("/insertComment.qo")
public class CommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));
		int qno = Integer.parseInt(request.getParameter("qno"));
		String qcomdate = request.getParameter("qcomdate");
		String qcomment = request.getParameter("qcomment");
		System.out.println("qno들어옴?" + qno + "qcomdate ? " + qcomdate + "qcomment" + qcomment);
		
		QuestionService qs = new QuestionService();
		
		int result = qs.insertComment(qno, qcomdate, qcomment);
		
		if(result > 0) {
			System.out.println("답변 완료");
			response.sendRedirect("selectOne.qo?qno=" + qno+"&mno="+mno);
		} else {
			// 에러 페이지 작성 . . . 생략 
			request.setAttribute("error-msg", "게시글 수정 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp")
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
