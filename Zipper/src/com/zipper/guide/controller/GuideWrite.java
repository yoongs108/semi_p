package com.zipper.guide.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.zipper.board.model.vo.Attachment;
import com.zipper.board.model.vo.Board;
import com.zipper.common.MyRenamePolicy;
import com.zipper.guide.model.service.GuideService;


/**
 * Servlet implementation class ClassWrite
 */
@WebServlet("/gInsert.gu")
public class GuideWrite extends HttpServlet {
	private static final long serialVersionUID = 11111111111111111L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuideWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024 * 1024 * 10;
			

			if (! ServletFileUpload.isMultipartContent(request)) {
				request.setAttribute("exception", new Exception("GUIDE 등록오류"));
				request.setAttribute("error-msg", "멀티파트 전송이 아니네요");
				
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response); //에러페이지 전송
				
			}
			
			String root = request.getServletContext().getRealPath("/");
			String savePath = root+ "resources/images/fileUpload/";
			
			MultipartRequest mre = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyRenamePolicy());
			
			String originNames = "";
			String changeNames = "";

			// 화면에서 전달한 파일 이름 가져오기
			
			Enumeration<String> files = mre.getFileNames();
			
			if(files.hasMoreElements()) { // 없을때까지 반복하기
				String tagName = files.nextElement(); 
				
				originNames = mre.getOriginalFileName(tagName);
				changeNames = mre.getFilesystemName(tagName);
				
				// System.out.println(tagName);
				// System.out.println(originNames);
				// System.out.println(changeNames);
			}
			
			// ---------------- 사진 이름 변경 문제 없음 -------------- //
			
			Board b = new Board();
			
			b.setBtype(3); // 임시 하드 코딩, 가이드btype(3)
			b.setMno(Integer.parseInt(mre.getParameter("mno")));
			b.setBtitle(mre.getParameter("btitle"));
			b.setBcontent(mre.getParameter("bcontent"));
			b.setGtype(1); // Integer.parseInt(mre.getParameter("gtype"))
			
			// 파일 정보 저장하기
			Attachment at = new Attachment();
			
			at.setFilepath(savePath); // 파일경로
			at.setFile_origin_name(originNames);
			at.setFile_new_name(changeNames);
			
			// 가이드 게시글 저장하기
			GuideService gs = new GuideService();
			
			System.out.println(b);
			System.out.println(at);
			
			int result = gs.insertGuide(b, at); // 게시글 저장
			
			if( result > 0) {
				response.sendRedirect("selectList.gu");				
			} else {
				request.setAttribute("error-msg", "가이드 추가에 실패하였습니다 관지라에게 문의");
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
