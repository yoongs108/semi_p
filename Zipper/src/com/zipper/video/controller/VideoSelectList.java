package com.zipper.video.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.common.exception.VideoException;
import com.zipper.video.model.service.VideoService;
import com.zipper.video.model.vo.Video;

/**
 * Servlet implementation class VideoSelectList
 */
@WebServlet("/selectList.vi")
public class VideoSelectList extends HttpServlet {
	private static final long serialVersionUID = 8585L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 공지사항 여러 개 조회를 위한 배열(ArrayList)
				ArrayList<Video> list = new ArrayList<>();
				
				VideoService vs = new VideoService();
				
				String page = null; // 이동할 페이지 정보
				
				try {
					list = vs.selectList();
					
					request.setAttribute("video", list);
					
					page = "views/class/videoList.jsp";
					
				} catch (VideoException e) {
					
					request.setAttribute("exception", e);
					request.setAttribute("error-msg", "비디오 조회 실패!");
					
					page = "views/common/errorPage.jsp";
					
				} finally {
					
					request.getRequestDispatcher(page).forward(request, response);
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
