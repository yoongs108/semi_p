package com.zipper.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zipper.member.model.vo.Member;
import com.zipper.myPage.model.service.MyPageService;
import com.zipper.thumb.model.vo.Thumbnail;

/**
 * 
 * @author JaeHyun Park
 * @when 2020_11_06
 *
 */

@WebServlet("/myZippop.mp")
public class MyZipperPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyZipperPage() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Thumbnail> list = new ArrayList<>();
		
		list = new MyPageService().selectList();
		
		//for (int i = 0; i < list.size(); i++) {
			//System.out.println(list.get(i).getMno());
		//}
		System.out.println(list.size());
		
		HttpSession session = request.getSession();
		
		int mno = ((Member)session.getAttribute("member")).getMno();
		int i = 0;
		
		System.out.println(mno);
		
		ArrayList<Thumbnail> mplist_mno = new ArrayList<Thumbnail>();
		
		for (int j = 0; j < list.size(); j++) {
			if ( mno == list.get(j).getMno()) {
				mplist_mno.add(list.get(j));
			}
		}
		
		//System.out.println(mplist_mno.size());
		
		String page ="";
		
		if (list != null) {
			request.setAttribute("mpZipList", mplist_mno);
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
