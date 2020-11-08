package com.zipper.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.board.model.vo.Board;
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
		
		bs = ns.selectOne(bno); // bno로 조회하는 메소드를 호출하여 bs로 담는다. 
		System.out.println("bs가 조회될까 ? "+bs);
		System.out.println("bs가널이냐"+bs!=null);

		String page = "";

		if ( bs != null ) {

			request.setAttribute("bs", bs);

			page = "views/community/noticeDetail.jsp";
			
		} else {

			request.setAttribute("error-msg", "게시글 조회 실패");
			page = "views/common/errorPage.jsp";
		}

		request.getRequestDispatcher(page).forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
