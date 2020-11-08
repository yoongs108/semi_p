package com.zipper.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.board.model.vo.Board;
import com.zipper.myPage.model.service.MyPageService;

/**
 * 
 * @author JaeHyun Park
 * @when 2020_11_06
 *
 */

@WebServlet("/selectList.tn")
public class MyZipperPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyZipperPage() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Board> list = new ArrayList<>();
		
		list = new MyPageService().selectList();
		
		String page ="";
		
		
		if (list != null) {
			request.setAttribute("list", list);
			page = "views/myPage/myZippop.jsp";
		} else {
			request.setAttribute("error-msg", "사진게시글 목록 조회 실패");
			page = "views/common/errorPage.jsp";
		}
		
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
