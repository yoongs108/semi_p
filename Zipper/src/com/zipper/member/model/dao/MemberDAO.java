package com.zipper.member.model.dao;

import static com.zipper.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.zipper.common.exception.MemberException;
import com.zipper.member.model.vo.Member;

public class MemberDAO {

	// SQL을 별도로 보관하는 Properties 파일 사용하기
	private Properties prop;
	
	public MemberDAO() {
		prop = new Properties();
		
		String filePath = MemberDAO.class // MemberDAO 클래스 기준으로 봤을때
						 .getResource("/config/member-sql.properties") // 최상위 더에서 아래 경로
						 .getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

	// 사용자 정보 조회
	public Member selectMember(Connection con, Member m) {
		
		Member result = null;	// 회원 정보를 반환해 줄 Member
		
		PreparedStatement pstmt = null;	// 실행할 Statement
		
		ResultSet rset = null;	// sql 실행 결과를 담을 ResultSet
		
		String sql = prop.getProperty("selectMember");	// "selectMember" sql 연결
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);	// DB, sql 연결
			
			// sql에 ? 정보 채우기(회원 아이디, 비밀번호)
			pstmt.setString(1, m.getMid());
			pstmt.setString(2, m.getMpwd());
			
			rset = pstmt.executeQuery();	// sql 실행
			
			if(rset.next()) {	// ResultSet에 헤더 다음 행이 있다면..
				
				result = new Member();
				
				result.setMno(		rset.getInt("mno"));
				result.setMgrd(		rset.getString("mgrd"));
				result.setMid(		m.getMid());
				result.setMpwd(		m.getMpwd());
				result.setMnick(	rset.getString("mnick"));
				result.setMcontact(	rset.getString("mcontact"));
				result.setMemail(	rset.getString("memail"));
				result.setMendate(	rset.getDate("mendate"));
				result.setMexdate(	rset.getDate("mexdate"));
				result.setMstatus(	rset.getString("mstatus"));
				result.setAddress(	rset.getString("address"));
				result.setIntro(	rset.getString("intro"));
			}
			
			System.out.println("조회 결과 확인 : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	// 회원가입
	public int insertMember(Connection con, Member m) throws MemberException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getMid());
			pstmt.setString(2, m.getMpwd());
			pstmt.setString(3, m.getMnick());
			pstmt.setString(4, m.getMcontact());
			pstmt.setString(5, m.getMemail());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getIntro());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 회원 정보 수정
	public int updateMember(Connection con, Member m) throws MemberException {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getMpwd());
			pstmt.setString(2, m.getMcontact());
			pstmt.setString(3, m.getAddress());
			pstmt.setString(4, m.getIntro());
			pstmt.setString(5, m.getMid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMember(Connection con, String userId) throws MemberException {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		//sql = "DELETE FROM MEMBER WHERE USERID = ?";
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 아이디 중복 체크
	public int idDupCheck(Connection con, String id) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("idDupCheck");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

}
