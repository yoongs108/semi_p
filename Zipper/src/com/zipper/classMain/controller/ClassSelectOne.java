package com.zipper.classMain.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.classMain.model.service.ClassService;
import com.zipper.classMain.model.vo.ClassList;

/**
 * Servlet implementation class ClassDetail
 */
@WebServlet("/selectClass.sc")
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
		int cno = Integer.parseInt(request.getParameter("cno"));

		ClassList classList = new ClassService().selectOne(cno);


	    String page = "";
	    
	    if(classList != null) {
	         request.setAttribute("cList", classList);
	     
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
