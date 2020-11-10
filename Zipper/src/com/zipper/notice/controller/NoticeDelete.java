package com.zipper.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.common.exception.NoticeException;
import com.zipper.notice.service.NoticeService;


/**
 * Servlet implementation class NoticeDelete
 */
@WebServlet("/nDelete.no")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		NoticeService ns = new NoticeService();

		try {
			int result = ns.deleteNotice(bno);
			
			response.sendRedirect("selectList.no");
			
		} catch (NoticeException e) {
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
