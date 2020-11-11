package com.zipper.help.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zipper.board.model.vo.Board;
import com.zipper.common.exception.FaqException;
import com.zipper.help.model.service.HelpService;


@WebServlet("/searchFaq.fq")
public class HelpFAQSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HelpFAQSearch() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		HelpService hs = new HelpService();
		ArrayList<Board> bList = new ArrayList<Board>();
		String page = null;
		
		try {
			bList = hs.searchFAQ(keyword);
			
			ArrayList<Board> list1 = new ArrayList<Board>();
			ArrayList<Board> list2 = new ArrayList<Board>();
			ArrayList<Board> list3 = new ArrayList<Board>();
			ArrayList<Board> list4 = new ArrayList<Board>();
			ArrayList<Board> list5 = new ArrayList<Board>();
			
			for ( Board b : bList) {
				if (b.getFaqtype() == 1) {
					list1.add(b);
				} else if (b.getFaqtype() == 2) {
					list2.add(b);
				} else if (b.getFaqtype() == 3) {
					list3.add(b);
				} else if (b.getFaqtype() == 4) {
					list4.add(b);
				} else {
					list5.add(b);
				}
			}
			
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("list3", list3);
			request.setAttribute("list4", list4);
			request.setAttribute("list5", list5);
			
			page = "views/help/helpFAQ.jsp";
			
			
		} catch (FaqException e) {
			request.setAttribute("error-msg", "공지사항 검색 도중 오류 발생...");
			request.setAttribute("exception", e);
			page = "views/common/errorPage.jsp";
			e.printStackTrace();
			
		} finally {
			request.getRequestDispatcher(page).forward(request, response);
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
