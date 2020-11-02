package com.zipper.member.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;

import com.zipper.member.model.dao.MemberDAO;
import com.zipper.member.model.vo.Member;

public class MemberService {

	private Connection con;	// 데이터베이스 연결할 connection 생성
	private MemberDAO mDAO = new MemberDAO(); // 서비스 공통으로 사용 될 DAO 생성
	
	// 사용자 정보 조회
	public Member selectMember(Member m) {

		con = getConnection();
		
		Member result = mDAO.selectMember(con, m); // 연결 정보 con과 로그인 정보 m을 담아 DAO 실행
		
		close(con);
		
		return result;
	}

}
