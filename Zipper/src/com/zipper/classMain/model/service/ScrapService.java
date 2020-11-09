package com.zipper.classMain.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.zipper.classMain.model.dao.ClassDAO;
import com.zipper.classMain.model.vo.ClassList;
import com.zipper.common.exception.ScrapException;
import com.zipper.member.model.dao.MemberDAO;
import com.zipper.member.model.vo.Member;

public class ScrapService {
	
	private Connection con;	// 데이터베이스 연결할 connection 생성
	private ClassDAO cDAO = new ClassDAO();		// 서비스 공통으로 사용 될 DAO 생성
	private MemberDAO mDAO = new MemberDAO();	// 서비스 공통으로 사용 될 DAO 생성
	
	// 스크랩한 클래스 조회
	public HashMap<String, Object> scrapList(int cno) {
		con = getConnection();
		
		HashMap<String,Object> hmap = cDAO.scrapList(con,cno);
		
		close(con);
		
		return hmap;
	}
}
