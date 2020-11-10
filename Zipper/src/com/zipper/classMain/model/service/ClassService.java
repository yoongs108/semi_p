package com.zipper.classMain.model.service;

import static com.zipper.common.JDBCTemplate.*;

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

	public ArrayList<Payment> classingList(int mno) {
		
		con = getConnection();
		
		ArrayList<Payment> list = cDAO.classingList(con, mno);
		
		close(con);
		
		return list;
	}
	
	public int insertWrite(ClassList cl, ArrayList<Attachment> alist) {
		con = getConnection();
		int result = 0;

		int result1 = 0;

		if(result1 >0) {
			System.out.println("서비스 정상 작동");
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		// 첨부파일 저장
		int result2 = 0;
		cDAO.insertAttachment(con, alist.get(result));
		
		
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


}
