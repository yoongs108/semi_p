package com.zipper.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.question.model.service.QuestionService;
import com.zipper.question.model.vo.Question;


/**
 * Servlet implementation class QuestionSelectList
 */
@WebServlet("/selectList.qo")
public class QuestionSelectList extends HttpServlet {
	private static final long serialVersionUID = 0404L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuestionSelectList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 게시판 목록 처리용 변수
		ArrayList<Question> list = new ArrayList<>();
		QuestionService qs = new QuestionService();
		System.out.println("여기인가?");
		list = qs.selectList(); 

		String page = "";

		if (list != null && list.size() > 0) {
			System.out.println("여기");
			request.setAttribute("list", list);

			page = "views/help/helpPTP.jsp";
		} else {

			request.setAttribute("error-msg", "게시글 조회 실패");
			page = "views/common/errorPage.jsp";
		}

		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
