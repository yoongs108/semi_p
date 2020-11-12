package com.zipper.zippop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.zippop.model.service.*;

/**
 * Servlet implementation class ThumbnailDelete
 */
@WebServlet("/delete.tn")
public class zippopDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public zippopDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		ZippopService zs = new ZippopService();  // 임포트
		
		String root = request.getServletContext().getRealPath("/resources");
		
		zs.deleteZipAtt(bno);
		int result = zs.deleteZippop(bno);
		
		if( result > 0) {  //result가 0보다 크다면 = 삭제가 잘 되었을때
			response.sendRedirect("zippop.zp");
		} else {
			request.setAttribute("exception", new Exception("게시글 삭제 오류!"));
			request.setAttribute("error-msg", "사진 게시글 삭제오류 발생");
			
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
