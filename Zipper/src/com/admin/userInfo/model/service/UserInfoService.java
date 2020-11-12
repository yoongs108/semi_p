package com.admin.userInfo.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.admin.userInfo.model.dao.UserInfoDAO;
import com.zipper.common.exception.MemberException;
import com.zipper.member.model.vo.Member;

public class UserInfoService {

	private Connection con;
	private UserInfoDAO uDAO = new UserInfoDAO();
	
	// 회원 정보 조회
	public ArrayList<Member> selectList(int currentPage, int limit) {
		
		con = getConnection();
		
		ArrayList<Member> list = uDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	// 회원 등급 수정
	public int updateUserInfo(Member m) throws MemberException {
		
		con = getConnection();
		
		int result = uDAO.updateUserInfo(con, m);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	// 회원 수 조회
	public int getListCount() {
		
		con = getConnection();
		
		int result = uDAO.getListCount(con);
		
		close(con);
		
		return result;
	}

}
