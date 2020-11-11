package com.zipper.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.member.model.vo.Member;
import com.zipper.question.model.service.QuestionService;
import com.zipper.question.model.vo.Question;

/**
 * Servlet implementation class QuestionSelectOne
 */
@WebServlet("/selectOne.qo")
public class QuestionSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionService qs = new QuestionService(); // service를 사용하기 위해서 객체를 생성함 
		Question q = new Question(); // Question 객체를 가지고 오려고 객체를 생성함
		Member m = new Member(); // member 객체를 가지고 오려고 객체를 생성함 
		System.out.println("흠");
		
		int qno = Integer.parseInt(request.getParameter("qno"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		System.out.println("qno는 뭘까"+qno + "mno는 뭘까" + mno);
		
		q = qs.selectOne(qno); // qno로 조회하는 메소드를 호출하여 q로 담는다. 
		m = qs.selectMember(mno); // mno로 조회하는 메소드를 호출 -> 직접 questionservice에서 만들거임. 
		
		System.out.println("q와 m이 조회될까 ? "+ q);
		System.out.println("q와 m이 널이냐"+q!=null);

		String page = "";

		if ( q != null ) {
			request.setAttribute("ms", m);
			request.setAttribute("qs", q);
				System.out.println("q가 널이 아님");
				
			page = "views/help/helpPTPDetail.jsp";
			
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
