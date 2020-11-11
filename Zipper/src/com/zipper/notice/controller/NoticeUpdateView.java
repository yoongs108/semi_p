package com.zipper.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.board.model.vo.Board;
import com.zipper.common.exception.NoticeException;
import com.zipper.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeUpdateView
 */
@WebServlet("/nUpdate.no")
public class NoticeUpdateView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeUpdateView() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno")); // 여기에 적은 내용들은 noticeUpdate에서 주는 내용임

		NoticeService ns = new NoticeService(); // import처리ok

		String page = null;

		Board b = new Board();

		try {
			b = ns.updateNotice(bno);
			System.out.println("노티스업데이트서블릿"+b);
			request.setAttribute("board", b);
			page = "views/community/noticeUpdate.jsp";

		} catch (NoticeException e) {
			request.setAttribute("error-msg", "공지사항 수정 실패");
			request.setAttribute("exception", e);

			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);

			e.printStackTrace();

		} finally {
			request.getRequestDispatcher(page).forward(request, response);
		}
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
