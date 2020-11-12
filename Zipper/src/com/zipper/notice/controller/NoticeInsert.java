package com.zipper.notice.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.common.exception.NoticeException;
import com.zipper.notice.service.NoticeService;
import com.zipper.board.model.vo.Board;

/**
 * Servlet implementation class NoticeInsert
 */
@WebServlet("/nInsert.no")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지사항의 제목, 작성일, 내용 
		String btitle = request.getParameter("title");
	
		String bcontent = request.getParameter("content");
		System.out.println("sass");
		
		Board b = new Board();
		
		b.setBtitle(btitle);
		
		b.setBcontent(bcontent);
		
		NoticeService ns = new NoticeService(); // 임포트처리ok
	
		// ns.insertNotice(n); // class 만들러 감  및 try/catch처리ok
		try {
			ns.insertNotice(b);
			response.sendRedirect("selectList.no");
			
		} catch (NoticeException e) {
			
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
