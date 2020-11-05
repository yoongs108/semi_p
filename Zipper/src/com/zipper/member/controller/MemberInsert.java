package com.zipper.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.common.exception.MemberException;
import com.zipper.member.model.service.MemberService;
import com.zipper.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/mInsert.me")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 인코딩 필터
		// 2. 값 가져오기
		String mid = request.getParameter("userId_join");	// 아이디
		String mpwd = request.getParameter("userPwd_join");	// 비밀번호
		String mnick = request.getParameter("userName");	// 닉네임
		String mcontact = request.getParameter("tel");		// 연락처
		
		String address = request.getParameter("zipCode") + ", "
				+ request.getParameter("address1") + ", "
				+ request.getParameter("address2");			// 주소
		
		String memail = request.getParameter("email")
				+ request.getParameter("domain");			// 이메일
		
		String intro = request.getParameter("intro");		// 한줄 소개
		
		//String hobby = String.join(", ", request.getParameterValues("hobby"));
		
		Member m = new Member(mid, mpwd, mnick, mcontact, memail, address, intro);
		
		System.out.println("가입 정보 확인 : " + m);
		
		MemberService ms = new MemberService();
		
		try {
			ms.insertMember(m);
			
			System.out.println("회원 가입 성공!");
			response.sendRedirect("index.jsp");
			
		} catch (MemberException e) {
			e.printStackTrace();
			
			System.out.println("회원 가입 실패!");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			request.setAttribute("error-msg", "회원 가입 실패");
			request.setAttribute("exception", e);
			
			view.forward(request, response);
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
