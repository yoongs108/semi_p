package com.zipper.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zipper.common.exception.MemberException;
import com.zipper.member.model.service.MemberService;
import com.zipper.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mUpdate.me")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 인코딩 필터
		// 2. 값 가져오기
		
		String mpwd = request.getParameter("userPwd_join");	// 비밀번호
		//String mnick = request.getParameter("userName");	// 닉네임
		String mcontact = request.getParameter("tel");		// 연락처
		
		String address = request.getParameter("zipCode") + ", "
				+ request.getParameter("address1") + ", "
				+ request.getParameter("address2");			// 주소
		
		String intro = request.getParameter("intro");		// 한줄 소개
		
		HttpSession session = request.getSession(false);	// 세션이 있을경우 가져옴 없으면 null
		
		Member m = (Member)session.getAttribute("member");
		
		m.setMpwd(mpwd);
		m.setMcontact(mcontact);
		m.setAddress(address);
		m.setIntro(intro);
		
		System.out.println("업데이트 정보 : " + m);
		
		MemberService ms = new MemberService();
		
		try {
			int result = ms.updateMember(m);
			
			System.out.println("업데이트 성공!");
			
			session.invalidate();
			
			response.sendRedirect("index.jsp");
			
			
		} catch (MemberException e) {
			e.printStackTrace();
			System.out.println("업데이트 실패!");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			request.setAttribute("error-msg", "회원 정보 수정 실패");
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
