package com.zipper.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.board.model.vo.PageInfo;
import com.zipper.board.model.service.BoardService;
import com.zipper.board.model.vo.Board;

/**
 * Servlet implementation class BoardSelectList
 */
@WebServlet("/selectList.bo")
public class BoardSelectList extends HttpServlet {
	private static final long serialVersionUID = 11010L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 게시판 목록 처리용 변수
		ArrayList<Board>list = new ArrayList<>(); // arraylist, board 임포트 처리 ok
		BoardService bs = new BoardService(); // boardservice 임포트 처리 ok 
		
				
				list = bs.selectList(); // create method 처리ok
				
				String page = "";
				
				if( list != null && list.size() > 0) {
					
					request.setAttribute("list", list);
					
					page = "views/community/board.jsp";
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
