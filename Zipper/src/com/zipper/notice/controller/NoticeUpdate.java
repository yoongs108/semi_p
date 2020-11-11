package com.zipper.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.zipper.board.model.vo.Board;
import com.zipper.common.exception.NoticeException;
import com.zipper.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeUpdate
 */
@WebServlet("/nUpView.no")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("hㅡㅗㅗㅡㅗㅡㅡ");
		String btitle = request.getParameter("title");
		//String bdate = request.getParameter("date");
		String bcontent = request.getParameter("content");
		System.out.println("bno가 들어옴?" + bno + "btitle?"+ btitle + "content" + bcontent );
		
		Board bs = new Board();
		String page = null;
		NoticeService ns = new NoticeService();
// 진짜로 업데이트  하는 메소드
		
		try {
			
			int res = ns.updateView(bno, btitle, bcontent);
			
			request.setAttribute("res", res);
			if(res>0) {
			System.out.println("업데이트 성공");
			}else {
			System.out.println("업데이트 실패");
			}
			response.sendRedirect("selectList.no");			
		} catch (NoticeException e) {
			
			request.setAttribute("error-msg", "공지사항 수정 페이지 이동 실패!");
			page = "views/common/errorPage.jsp";
		
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
