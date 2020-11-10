package com.zipper.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.zipper.common.Encryptor;
import com.zipper.common.MyRenamePolicy;
import com.zipper.board.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;
import com.zipper.common.exception.MemberException;
import com.zipper.member.model.service.MemberService;
import com.zipper.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mUpdate.me")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 전달받을 파일의 크기 설정
		int maxSize = 1024 * 1024 * 10; // 10MB
		
		// 2. 멀티파트 전달 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("exception", new Exception("프로필 등록 오류"));
			request.setAttribute("error-mgs", "멀티파트 전송이 아니네요!");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		// 3. 저장할 경로 설정
		String root = request.getServletContext().getRealPath("/");
		String savePath = root + "resources/images/profile/";
		
		// 4. 멀티파트 객체 준비
		MultipartRequest mre = new MultipartRequest(request, savePath, maxSize, "UTF-8",
													new MyRenamePolicy());
		
		// 다중 파일 업로드 처리하기
		// 원본 파일 명과 변경된 파일 명 담기
		String originNames = "";
		String changeNames = "";
		
		// 화면에서 전달할 파일 이름 가져오기
		Enumeration<String> files = mre.getFileNames();
		
		System.out.println(mre.getFileNames());
		
		if(files.hasMoreElements()) {
			// 가져온 파일 하나씩 꺼내옴
			String tagName = files.nextElement();
			
			originNames = mre.getOriginalFileName(tagName);
			changeNames = mre.getFilesystemName(tagName);
			
//			 System.out.println("tagName : " + tagName);
//			 System.out.println(originNames);
//			 System.out.println(changeNames);
		}
		
		// ---------------- 사진 이름 변경 문제 없음 -------------- //
		
		String mpwd = Encryptor.getSHA512(mre.getParameter("userPwd_join"));	// 비밀번호
		String mcontact = mre.getParameter("tel");		// 연락처
		
		String address = mre.getParameter("zipCode") + ", "
				+ mre.getParameter("address1") + ", "
				+ mre.getParameter("address2");			// 주소
		
		String intro = mre.getParameter("intro");		// 한줄 소개
		// String profile = mre.getParameter("profile");	// 프로필사진
		
		HttpSession session = request.getSession(false);	// 세션이 있을경우 가져옴 없으면 null
		
		Member m = (Member)session.getAttribute("member");

		System.out.println(m);

		m.setMpwd(mpwd);
		m.setMcontact(mcontact);
		m.setAddress(address);
		m.setIntro(intro);
		
		// 파일 새로 등록 시 기존이미지 삭제, 새파일 등록
		if(originNames != null) {
			// 기존 이미지 파일이 디폴트가 아닐 시 파일 삭제
			if(!m.getProfile().equals("profile.png")) {
				new File(savePath + m.getProfile()).delete();				
			}
			m.setProfile(changeNames);	
		}
		
		System.out.println("업데이트 정보 : " + m);
		
		MemberService ms = new MemberService();
		
		
		try {
			int result = ms.updateMember(m);
			
			System.out.println("업데이트 성공!");
			
			session.invalidate();
			
			response.sendRedirect("index.jsp");
			
			
		} catch (MemberException e) {
			e.printStackTrace();
			System.out.println("업데이트 실패!");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			request.setAttribute("error-msg", "회원 정보 수정 실패");
			request.setAttribute("exception", e);
			
			view.forward(request, response);
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
