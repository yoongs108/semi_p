package com.zipper.video.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.classMain.model.service.ClassService;
import com.zipper.classMain.model.vo.ClassList;
import com.zipper.video.model.service.VideoService;

/**
 * Servlet implementation class VideoInsertFoam
 */
@WebServlet("/InsertFoam.vi")
public class VideoInsertFoam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoInsertFoam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ClassList> list = new ArrayList<>();
		
		list = new VideoService().selectVList();
		
		String page = "";
		
		if(list != null) {
			request.setAttribute("list", list);
			page = "views/writer/classUpload.jsp";
		}else {
			request.setAttribute("error-msg", "클래스 조회 실패");
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
