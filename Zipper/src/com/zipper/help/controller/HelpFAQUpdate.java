package com.zipper.help.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.board.model.vo.Board;
import com.zipper.help.model.service.HelpService;


@WebServlet("/zipUpdate.zp")
public class HelpFAQUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HelpFAQUpdate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("servlet 도착");
		
		ArrayList<Board> list = new ArrayList<Board>();
		
		HelpService hs = new HelpService();
		
		list = hs.selectFAQ();
		
		ArrayList<Board> list1 = new ArrayList<Board>();
		ArrayList<Board> list2 = new ArrayList<Board>();
		ArrayList<Board> list3 = new ArrayList<Board>();
		ArrayList<Board> list4 = new ArrayList<Board>();
		ArrayList<Board> list5 = new ArrayList<Board>();
		
		for ( Board b : list) {
			if (b.getFaqType() == 1) {
				list1.add(b);
			} else if (b.getFaqType() == 2) {
				list2.add(b);
			} else if (b.getFaqType() == 3) {
				list3.add(b);
			} else if (b.getFaqType() == 4) {
				list4.add(b);
			} else {
				list5.add(b);
			}
		}
		System.out.println(list1.size() + " / " + list2.size() + " / " + list3.size() + " / " + list4.size() + " / " + list5.size());

		String page = "";
		
		if (list != null && list.size() > 0) {
			
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("list3", list3);
			request.setAttribute("list4", list4);
			request.setAttribute("list5", list5);
			
			page = "views/help/helpFAQUpdate.jsp";
		} else {
			
			request.setAttribute("error-msg", "FAQ 조회 실패");
			page = "views/common/errorPage.jsp";
		}
		
		System.out.println("servlet 출발");
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
