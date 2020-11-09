package com.zipper.classMain.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.classMain.model.service.ScrapService;
import com.zipper.classMain.model.vo.ClassList;

/**
 * Servlet implementation class ScrapClass
 */
@WebServlet("/scrapCl.sc")
public class ScrapClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno =Integer.parseInt(request.getParameter("cno")); 
		
		HashMap<String, Object> scrapList 
		   = new ScrapService().scrapList(cno);
		
		String page = "";
		
		if(scrapList != null && scrapList.get("classList") != null) {
			request.setAttribute("classList", scrapList.get("classList"));
			request.setAttribute("attachment", scrapList.get("scrapList")); // 일단 헀지만 맞는지 아닌지 나는몰라s
		
			page = "views/mypage/classScrap.jsp";
			
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
