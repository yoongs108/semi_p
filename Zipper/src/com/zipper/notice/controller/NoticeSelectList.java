package com.zipper.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.board.model.vo.Board;
import com.zipper.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeSelectList
 */
@WebServlet("/selectList.no")
public class NoticeSelectList extends HttpServlet {
	private static final long serialVersionUID = 11010L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeSelectList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 공지사항 목록 처리용 변수
		ArrayList<Board> list = new ArrayList<>(); 
		NoticeService ns = new NoticeService();

		list = ns.selectList(); 

		String page = "";

		if (list != null && list.size() > 0) {

			request.setAttribute("list", list);

			page = "views/community/notice.jsp";
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
