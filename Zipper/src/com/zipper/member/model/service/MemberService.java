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
	
/*
	public int insertMember(Member m) throws MemberException {

		con = getConnection();
		
		int result = mDAO.insertMember(con, m);
		
		if( result > 0 ) { // 회원 가입 성공!
			commit(con);			
		} else {		   // 회원 가입 실패...
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int updateMember(Member m) throws MemberException {
		int result = 0;
		
		con = getConnection();
		
		result = mDAO.updateMember(con, m);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
		
	}

	public int deleteMember(String userId) throws MemberException {

		int result = 0;
		
		con = getConnection();
		
		result = mDAO.deleteMember(con, userId);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
*/
	public int idDupCheck(String id) {
		
		con = getConnection();
		
		int result = mDAO.idDupCheck(con, id);
		
		close(con);
		
		return result;
	}

}
