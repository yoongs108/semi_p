package com.admin.userInfo.model.dao;

import static com.zipper.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.zipper.common.exception.MemberException;
import com.zipper.member.model.vo.Member;

public class UserInfoDAO {

	private Properties prop;
	
	public UserInfoDAO() {
		prop = new Properties();
		
		String filePath = UserInfoDAO.class
							.getResource("/config/userInfo-sql.properties")
							.getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 회원 정보 조회
	public ArrayList<Member> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Member> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Member m = new Member();
				
				m.setMno(		rset.getInt("mno"));
				m.setMgrd(		rset.getString("mgrd"));
				m.setMid(		rset.getString("mid"));
				m.setMpwd(		rset.getString("mpwd"));
				m.setMnick(		rset.getString("mnick"));
				m.setMcontact(	rset.getString("mcontact"));
				m.setMemail(	rset.getString("memail"));
				m.setMendate(	rset.getDate("mendate"));
				m.setMexdate(	rset.getDate("mexdate"));
				m.setMstatus(	rset.getString("mstatus"));
				m.setAddress(	rset.getString("address"));
				m.setIntro(		rset.getString("intro"));
				m.setScrap(		rset.getString("scrap"));
				m.setProfile(	rset.getString("profile"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 회원 등급 변경
	public int updateUserInfo(Connection con, Member m) throws MemberException {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateUserInfo");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getMgrd());
			pstmt.setInt(2, m.getMno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 회원 수 조회
	public int getListCount(Connection con) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
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
