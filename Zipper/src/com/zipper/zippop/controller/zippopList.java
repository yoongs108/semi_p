package com.zipper.zippop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.zippop.model.service.ZippopService;
import com.zipper.thumb.model.vo.Thumbnail;


@WebServlet("/zippop.zp")
public class zippopList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public zippopList() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Thumbnail> list = new ArrayList<>();
		
		list = new ZippopService().selectList();
		
		String page ="";
		
		
		if (list != null) {
			request.setAttribute("list", list);
			page = "views/community/zippopList.jsp";
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
