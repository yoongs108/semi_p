package com.zipper.boardComment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zipper.boardComment.model.service.BoardCommentService;
import com.zipper.boardComment.model.vo.BoardComment;
import com.zipper.member.model.vo.Member;

/**
 * Servlet implementation class CommentInsert
 */
@WebServlet("/insertComment.co")
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
		System.out.println("aaa");
		// 작성자, 게시글 번호, 댓글 내용, 참조하는 댓글 번호, 댓글레벨
		HttpSession session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
	    
	    
		int bno = Integer.parseInt(request.getParameter("bno"));
		String comContent = request.getParameter("comContent");
				
		BoardComment comment = new BoardComment(bno, m.getMno(), comContent, m.getProfile(), m.getMnick());
		
		int result = new BoardCommentService().insertComment(comment);
		
		if( result > 0 ) {
			response.sendRedirect("zippopSelectOne.zp?bno="+ bno);
		} else {
			// 에러 페이지 작성 . . . 생략
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
