package com.zipper.video.controller;

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
import com.zipper.common.MyRenamePolicy;
import com.zipper.video.model.service.VideoService;
import com.zipper.video.model.vo.Video;

/**
 * Servlet implementation class ClassIngSelectList
 */
@WebServlet("/videoInsert.vi")
public class VideoInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024 * 1024 * 10;

		// 2. 멀티파트 전달 확인
		if(! ServletFileUpload.isMultipartContent(request)) {
			
			request.setAttribute("exception", new Exception("비디오 등록 오류"));
			request.setAttribute("error-msg", "멀티파트 전송이 아니네요!");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		// 3. 저장할 경로 설정
		String root = request.getServletContext().getRealPath("/");
		String savePath = root + "/resources/images/fileUpload/video";
		
		// 4. 멀티파트 객체 준비
		MultipartRequest mre = new MultipartRequest(
				                   request, savePath, maxSize, "UTF-8",
				                   new MyRenamePolicy() );
		
		// 다중 파일 업로드 처리하기
		// 원본 파일 명과 변경된 파일 명 담기
		String originNames = null;
		String changeNames = null;
		
		// 화면에서 전달한 파일 이름 가져오기
		Enumeration<String> files = mre.getFileNames();
		
		if(files.hasMoreElements()) {
			// 가져온 파일 하나씩 꺼내옴
			String tagName = files.nextElement();
			
			originNames = mre.getOriginalFileName(tagName);
			changeNames = mre.getFilesystemName(tagName);
			
			
			System.out.println("tagName : " + tagName);
			System.out.println(originNames);
			System.out.println(changeNames);
			
		}
		
		// --------------- 여기까지 문제 없었음! ( 중간 토나오는 시점 ) ---------------- //
		
		// 썸네일 게시글 저장하기
		Video v = new Video();
		
		v.setVname(mre.getParameter("title"));
		v.setVideo(changeNames);
		v.setVtext(mre.getParameter("content"));
			
		VideoService vs = new VideoService();
		int result = vs.insertVideo(v);
		
		if( result > 0 ) { 
			response.sendRedirect("selectList.vi"); // 리스트 아직 안만들었음--> 관리자페이지?
		} else {
			request.setAttribute("exception", new Exception("비디오 추가 에러!"));
			request.setAttribute("error-msg", "비디오 추가에 실패하였습니다. 관리자에게 문의하세요.");
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
