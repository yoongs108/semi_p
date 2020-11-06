package com.zipper.classMain.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.board.model.service.BoardService;
import com.zipper.board.model.vo.Board;
import com.zipper.classMain.model.service.ClassService;

/**
 * Servlet implementation class ClassDetail
 */
@WebServlet("/selectOne.cd")
public class ClassSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		HashMap<String, Object> classList
        = new ClassService().selectOne(bno);


	    String page = "";
	    
	    if(classList != null && classList.get("") != null) {
	         request.setAttribute("classList", classList.get("classList"));
	         request.setAttribute("classList", classList.get("attachment"));
	         
	         
	         
	         page = "views/class/classDetail.jsp";
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
