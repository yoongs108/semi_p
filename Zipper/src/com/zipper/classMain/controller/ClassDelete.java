package com.zipper.classMain.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.classMain.model.service.ClassService;

/**
 * Servlet implementation class ClassDelete
 */
@WebServlet("/classDelete.cd")
public class ClassDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		ClassService cs = new ClassService();
		
		String root = request.getServletContext().getRealPath("/resources");
		String savePath = root + "/images/fileUpload/";
		
		int result = cs.deleteClass(cno, savePath);
		
		if(result > 0) {
			response.sendRedirect("classFromMain.cfm");
			
		}else {
			request.setAttribute("exception", new Exception("클래스 삭제오류"));
			request.setAttribute("error-msg", "클래스 삭제 오류 발생");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
