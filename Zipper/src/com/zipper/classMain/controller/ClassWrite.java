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
import com.zipper.board.model.vo.Attachment;
import com.zipper.classMain.model.service.ClassService;
import com.zipper.classMain.model.vo.ClassList;
import com.zipper.common.MyRenamePolicy;


/**
 * Servlet implementation class ClassWrite
 */
@WebServlet("/classWrite.cw")
public class ClassWrite extends HttpServlet {
	private static final long serialVersionUID = 11111111111111111L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024 * 1024 * 10;
		
		HttpSession session = request.getSession();
		
		if (! ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("exception", new Exception("사진 게시글 등록오류"));
			request.setAttribute("error-msg", "멀티파트 전송이 아니네요");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
		String root = request.getServletContext().getRealPath("/resources");
		String savePath = root+ "/images/fileUpload/";
		
		MultipartRequest mre = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyRenamePolicy());
		
		String originNames = new String();
		String changeNames = new String();

		// 화면에서 전달한 파일 이름 가져오기
		Enumeration<String> files = mre.getFileNames();
		
		if(files.hasMoreElements()) { // 없을때까지 반복해라
			String tagName = files.nextElement(); 
			
			originNames = mre.getOriginalFileName(tagName);
			changeNames = mre.getFilesystemName(tagName);
			
//			System.out.println(tagName);
//			System.out.println(originNames);
//			System.out.println(changeNames);
		}
			
			// 썸네일 게시글 저장하기
			ClassList cl = new ClassList();
			
			cl.setCname(mre.getParameter("cname"));
			cl.setPrice(Integer.parseInt(mre.getParameter("price")));
			cl.setCintro(mre.getParameter("cintro"));
			cl.setCourse(mre.getParameter("course"));
			cl.setKdetail(mre.getParameter("kdetail"));

			System.out.println(cl);
			
			// 파일 정보 저장하기
			Attachment at = new Attachment();
			
			at.setFilepath(savePath); // 파일경로
			at.setFile_origin_name(originNames);
			at.setFile_new_name(changeNames);
			
			
			ClassService cs = new ClassService();
			
			int result = cs.insertWrite(cl, at);
			if(result > 0) { // 저장이 잘 됐다면
				response.sendRedirect("classFromMain.cfm");
			} else {
				request.setAttribute("exception", new Exception("사진 추가 에러"));
				request.setAttribute("error-msg", "사진 추가에 실패하였습니다 관지라에게 문의");
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
