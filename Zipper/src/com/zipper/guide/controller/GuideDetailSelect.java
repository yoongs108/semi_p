package com.zipper.guide.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.board.model.vo.Board;
import com.zipper.guide.model.service.GuideService;

/**
 * Servlet implementation class GuideDetailSelect
 */
@WebServlet("/selectOne.gu")
public class GuideDetailSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuideDetailSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		int bno = Integer.parseInt(request.getParameter("bno"));
	      
		Board board = new GuideService().selectOne(bno);
		
		String page = "";
		System.out.println(board);
		if(board != null) {
			request.setAttribute("board", board);
			
			page = "views/community/guideDetail.jsp";
		} else {
			request.setAttribute("exception", new Exception("게시글 상세 조회 실패"));
			request.setAttribute("error-msg", "게시글 상세 조회 실패!!");
			
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
