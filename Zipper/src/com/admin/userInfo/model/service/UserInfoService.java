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
	
	public ArrayList<Member> selectList() {
		
		con = getConnection();
		
		ArrayList<Member> list = uDAO.selectList(con);
		
		close(con);
		
		return list;
	}

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

}
