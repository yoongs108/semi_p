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
 * Servlet implementation class NoticeSelectOne
 */
@WebServlet("/selectOne.no")
public class NoticeSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService ns = new NoticeService(); // service를 사용하기 위해서 객체를 생성함 
		Board bs = new Board(); // Board 객체를 가지고 오려고 객체를 생성함
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("bno는 뭘까"+bno);

		String page = null;
		
		try {
			bs = ns.selectOne(bno);
			request.setAttribute("board", bs);
			page = "views/community/noticeDetail.jsp";
			
			System.out.println("그럼여기?"+bs);

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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
