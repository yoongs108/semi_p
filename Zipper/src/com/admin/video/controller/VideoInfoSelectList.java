package com.admin.video.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.video.model.service.VideoInfoService;
import com.zipper.board.model.vo.PageInfo;
import com.zipper.video.model.vo.Video;

/**
 * Servlet implementation class VideoInfoSelectList
 */
@WebServlet("/vSelectList.ad")
public class VideoInfoSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoInfoSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Video> list = new ArrayList<>();
		VideoInfoService vs = new VideoInfoService();
		
		// 페이징 처리에 필요한 변수들 
		// 1, 2, 3, 4 
		int startPage;
		
		// 마지막 페이지
		// 1 ... 10 // 11 ... 20 
		int endPage;
		
		// 전체 게시글 갯수 기준 마지막 페이지 
		int maxPage; 
	
		// 현재 사용자가 보는 페이지 
		int currentPage;
		
		// 한 페이지 당 보여줄 게시글 수 
		int limit = 20;
		
		// 페이징 최대 갯수
		int limitP = 10;
		
		// 만약 사용자가 처음 목록을 조회했다면 
		// 페이지는 1페이지가 되어야 함 
		currentPage = 1; 
		
		// 만약 사용자가 특정 페이지 번호를 가지고 있다면 
		if(request.getParameter("currentPage") != null) {
			currentPage = 
					Integer.parseInt(request.getParameter("currentPage"));
		}

		// 총 게시글 수 가져오기 
		int listCount = vs.getListCount();
		
		System.out.println("총 게시글 수 : " + listCount);
	
		// 총 게시글 수 300개 ! 
		// 페이지 수는 30개 !
		// 만약 게시글 수 301개 ! 
		// 페이지 수는 31개 ! 
		// 게시글					페이지
		// 13 ---> 1.2 (올림) --> 2 
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		// 한 번에 보일 시작 페이지와 끝페이지
		// 1 ~ 10
		// 시작 : 1 / 끝 : 10
		// 11 ~ 20
		// 시작 : 11 / 끝 : 20
		startPage = (int)(((double)currentPage/limitP + 0.9) -1) * limitP + 1;
		
		endPage = startPage + limitP -1; // 10 개 씩
		
		// 만약 마지막 페이지가 끝페이지 보다 적다면 
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// ----------- 페이지 처리 끝 ---------------- //

		list = vs.selectList(currentPage,limit);
		
		String page ="";
		
		if( list != null ) { //  && list.size() > 0

			PageInfo pi = new PageInfo(currentPage, listCount, limit, 
									   maxPage, startPage, endPage); // create method 만듦 
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			page = "views/admin/userInfo.jsp";
		} else {
			request.setAttribute("error-msg", "조회 실패!");
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
