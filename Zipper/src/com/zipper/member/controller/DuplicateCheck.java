package com.zipper.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.zipper.member.model.service.MemberService;

/**
 * Servlet implementation class IdDuplicateCheck
 */
@WebServlet("/dupCheck.me")
public class DuplicateCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DuplicateCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");	// 중복 확인할 파라미터 유형
		String dupParam = ""; // 중복 확인할 파라미터
		
		switch(type) {
		case "mid" :
			dupParam = request.getParameter("userId_join");
			break;
		case "mnick" :
			dupParam = request.getParameter("mnick");
			break;
		case "memail" :
			dupParam = request.getParameter("memail");
			 break;
		}
		
		MemberService ms = new MemberService();
		
		int result = ms.dupCheck(type, dupParam);
		
		new Gson().toJson(result, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
