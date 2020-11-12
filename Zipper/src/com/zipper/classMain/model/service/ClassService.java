package com.zipper.classMain.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.classMain.model.dao.ClassDAO;
import com.zipper.classMain.model.vo.ClassList;
import com.zipper.board.model.vo.Attachment;
import com.zipper.payment.model.vo.Payment;

public class ClassService {
   
   private Connection con;
   private ClassDAO cDAO = new ClassDAO();
   
   // 클래스 리스트 조회
   public ArrayList<ClassList> selectList() {
      
      con = getConnection();
      
      ArrayList<ClassList> list = cDAO.selectList(con);
      
      close(con);
      
      return list;
   }

   
   
   public ClassList selectOne(int cno) {
      
      con = getConnection();

      ClassList cList = cDAO.selectOne(con, cno);
      
      close(con);
      
      return cList;
   }
   
   // 수강중인 페이지 조회용
   public ArrayList<Payment> classingList(int mno, int currentPage, int limit) {
      
      con = getConnection();
      
      ArrayList<Payment> list = cDAO.classingList(con, mno, currentPage, limit);
      
      close(con);
      
      return list;
   }
   
   
   public int insertWrite(ClassList cl, Attachment at) {
      con = getConnection();
      int result = 0;
      
      // 클래스 등록
      int result1 = cDAO.insertWrite(con, cl);

      if(result1 >0) { // 등록이 성공했으면
    	  // 등록된 클래스 번호 불러옴
		int cno = cDAO.getCurrentCno(con);
		at.setCno(cno); // 불러온 번호 at에 추가
      }   
      
      // 첨부파일 저장
      int result2 = cDAO.insertAttachment(con, at);
      
      if(result1 >0 && result2 >0) {// 둘다 잘 실행 됐다면
         System.out.println("서비스 정상 작동");
         commit(con);
         result =1;
         
      }else {
         rollback(con);
      }
      close(con);
      return result;
   }

	// 회원 클래싱 갯수 조회
	public int getListCount(int mno) {
		
		con = getConnection();
		
		int result = cDAO.getListCount(con, mno);
		
		close(con);
		
		return result;
	}
	
	public int deleteClass(int cno, String savePath)   {
		con = getConnection();
		
		String filename = cDAO.searchFileName(con, cno); // 파일이름 조회
		int result = 0;
		
		int result2 = cDAO.deleteAtt(con, cno);
		
		int result1 = cDAO.deleteClass(con, cno); // 클래스 게시글 삭제
		
		
		
		if(result1 >0 && result2>0) {
			File f = new File(savePath + filename); // 물리 경로

			f.delete(); // 물리경로 삭제
			
			result = 1;
			commit(con);
		}else {
			rollback(con);
		}
	
		close(con);
		
		return result;
	}


	public int updateClassList(ClassList cl, Attachment at) {
		con = getConnection();
		
		
		return 0;
	}

}
 