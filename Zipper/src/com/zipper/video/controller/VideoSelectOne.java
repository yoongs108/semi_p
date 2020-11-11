package com.zipper.video.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.video.model.service.VideoService;
import com.zipper.video.model.vo.Video;

/**
 * Servlet implementation class VideoSelectOne
 */
@WebServlet("/selectOne.vi")
public class VideoSelectOne extends HttpServlet {
	private static final long serialVersionUID = 9189L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int vno = Integer.parseInt(request.getParameter("vno"));
		
		Video v = new VideoService().selectOne(vno);
		
		
		String page = "";
		
		if( v != null ) {
			request.setAttribute("video", v);
			
			page = "views/class/classVideoDetail.jsp";
		} else {
			
			request.setAttribute("error-msg", "게시글 상세조회 실패!");
			
			page = "views/common/errorPage.jsp";
			
		}
		
		request.getRequestDispatcher(page)
		       .forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
