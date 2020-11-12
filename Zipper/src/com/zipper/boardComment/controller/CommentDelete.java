package com.zipper.boardComment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.boardComment.model.service.BoardCommentService;

/**
 * Servlet implementation class CommentDelete
 */
@WebServlet("/deleteComment.co")
public class CommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int comNo = Integer.parseInt(request.getParameter("comNo"));
		
		int result = new BoardCommentService().deleteComment(comNo);  //�엫�룷�듃. cno�쓽 踰덊샇瑜� �꽆寃⑥쨲
		System.out.println(bno+comNo);
		if ( result > 0) {
			response.sendRedirect("zippopSelectOne.zp?bno=" + bno);
		} else {
			// �뿉�윭 硫붿떆吏�
			
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
