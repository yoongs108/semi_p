package com.zipper.classMain.controller;

import java.io.IOException;
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

/**
 * Servlet implementation class ClassUpdate
 */
@WebServlet("/classUpdate.cu")
public class ClassUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassUpdate() {
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
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		ClassService cs = new ClassService();
		
		String originFiles = new String();
		String saveFiles = new String();

		// 화면에서 전달한 파일 이름 가져오기
		Enumeration<String> files = mre.getFileNames();
		
		if(files.hasMoreElements()) {
			
			String tagName = files.nextElement();
			
			originFiles = mre.getOriginalFileName(tagName);
			saveFiles = mre.getFilesystemName(tagName);

		}
		
		
		// 이전 게시글 내용 변경
		ClassList cl = 
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
