package com.zipper.classMain.controller;

import java.io.File;
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
import com.zipper.classMain.model.service.ClassService;
import com.zipper.classMain.model.vo.ClassList;
import com.zipper.common.MyRenamePolicy;

/**
 * Servlet implementation class ClassUpdate
 */
@WebServlet("/Update.cl")
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
		
//		HttpSession session = request.getSession();
		
		if (! ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("exception", new Exception("사진 게시글 등록오류"));
			request.setAttribute("error-msg", "멀티파트 전송이 아니네요");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
		String root = request.getServletContext().getRealPath("/resources");
		String savePath = root+ "/images/fileUpload/";
		
		MultipartRequest mre = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new MyRenamePolicy());
		
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
		ClassList cl = cs.selectOne(cno);
		
		cl.setCname(mre.getParameter("cname"));
		cl.setPrice(Integer.parseInt(mre.getParameter("price")));
		cl.setCintro(mre.getParameter("cintro"));
		cl.setCourse(mre.getParameter("course"));
		cl.setFileNewName(mre.getParameter("file_new_name"));
		cl.setKdetail(mre.getParameter("kdetail"));
		cl.setTname(mre.getParameter("tname"));
		
		
		Attachment at = new Attachment();
		if(originFiles != null) {
			// 새로 파일을 등록했다면, 이전의 파일을 삭제하고, 새로운 파일로 저장하기
			new File(savePath + at.getFile_new_name()).delete();
			
			at.setFilepath(savePath);
			at.setFile_origin_name(originFiles);
			at.setFile_new_name(saveFiles);
		}
		
		
		int result = cs.updateClassList(cl, at);
		
		if(result > 0) {
			
			response.sendRedirect("selectList.cl");
		} else {
			request.setAttribute("exception", new Exception("게시글 수정 에러"));
			request.setAttribute("error-msg", "게시글 수정 실패하였습니다 관지라에게 문의");
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
