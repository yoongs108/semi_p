package com.zipper.classMain.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.zipper.classMain.model.service.ClassService;
import com.zipper.common.MyRenamePolicy;
import com.zipper.member.model.vo.Member;
import com.zipper.payment.model.vo.Payment;
import com.zipper.thumb.model.vo.Attachment;
import com.zipper.thumb.model.vo.Thumbnail;
import com.zipper.zippop.model.service.ZippopService;

/**
 * Servlet implementation class ClassIngSelectList
 */
@WebServlet("/classInsert.cl")
public class ClassInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 집합인서트에서 일단 복사해옴 글올리기 끝내고 작업예정
		int maxSize = 1024 * 1024 * 10;
		
		HttpSession session = request.getSession();
		
		int mno = ((Member)session.getAttribute("member")).getMno();
		
		if (! ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("exception", new Exception("CLASS 등록 실패"));
			request.setAttribute("error-msg", "멀티파트로 전송해주세요");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		String root = request.getServletContext().getRealPath("/resources");
		String savePath = root + "/images/fileUploadFiles/";
		
		MultipartRequest mre = new MultipartRequest(request, savePath, maxSize, "UTF-8"
													, new MyRenamePolicy());
		
		String originNames = new String();
		
		Enumeration<String> files = mre.getFileNames();

		originNames = mre.getOriginalFileName(files.nextElement());
	
		System.out.println("originNames : " + originNames);

		// -------------------------- 여기까진 ㅇㅋ.... --------
		
		Thumbnail t = new Thumbnail();
		
		t.setBcontent( mre.getParameter("content"));
		t.setMno(mno);
		
		System.out.println("servlet thumbnail chk: " + t.getBcontent() + " / " + t.getMno());
		
		Attachment at = new Attachment();
			
		at.setFilepath(savePath);
		at.setOriginname(originNames);
		
		System.out.println("servlet Attachment chk: " + at.getFilepath() + " / " + at.getOriginname());
		
		ZippopService zs = new ZippopService();
		int result = zs.insertZippop(t, at);
		
		if (result > 0) {
			response.sendRedirect("zippop.zp");
		} else {
			request.setAttribute("exception", new Exception("사진 추가 에러!"));
			request.setAttribute("error-msg", "사진게시글 저장 실패, 관리자에게 문의바랍니다");
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
