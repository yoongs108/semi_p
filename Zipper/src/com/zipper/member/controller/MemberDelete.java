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
@WebServlet("/mDelete.me")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);	// 세션이 있을경우 가져옴 없으면 null
		
		Member m = (Member)session.getAttribute("member");
		
		String mid = m.getMid();
		
		MemberService ms = new MemberService();
		
		try {
			int result = ms.deleteMember(mid);
			
			System.out.println("회원탈퇴 성공!");
			
			session.invalidate();
			
			response.sendRedirect("index.jsp");
			
			
		} catch (MemberException e) {
			e.printStackTrace();
			System.out.println("회원탈퇴 실패!");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			request.setAttribute("error-msg", "회원 탈퇴 실패");
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
