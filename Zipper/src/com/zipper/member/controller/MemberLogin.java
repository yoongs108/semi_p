package com.zipper.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.zipper.member.model.service.MemberService;
import com.zipper.member.model.vo.Member;

/**
 * Servlet implementation class MemberLogin
 */
@WebServlet("/login.me")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩 필터
		// 2. request 데이터 가져오기
		String mid = request.getParameter("userId");
		String mpwd = request.getParameter("userPwd");
		
		// vo에 데이터 담기
		Member m = new Member(mid, mpwd);
		
		// 실행할 서비스 생성
		MemberService ms = new MemberService();
		
		// 사용자 정보 조회 서비스 호출
		m = ms.selectMember(m); // 로그인정보 담기
		
		//로그인 성공 / 실패 시 이동할 페이지
		String page = "";
		
		int result = 0;
		
		if(m != null) {
			// 로그인 성공
			
			// 세션 생성
			HttpSession session = request.getSession();
			
			// 세션에 회원정보 저장
			session.setAttribute("member", m);

			result = 1;
			
			System.out.println("로그인 성공");
		} else {
			// 로그인 실패

			result = 0;
			
			System.out.println("로그인 실패");
		}

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
