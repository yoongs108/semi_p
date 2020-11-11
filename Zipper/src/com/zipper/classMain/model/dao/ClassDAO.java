package com.zipper.classMain.model.dao;

import static com.zipper.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.zipper.board.model.vo.Attachment;
import com.zipper.classMain.model.vo.ClassList;
import com.zipper.payment.model.vo.Payment;

public class ClassDAO {

	private Properties prop = null;

	public ClassDAO() {
		prop = new Properties();

		String filePath = ClassDAO.class // MemberDAO 클래스 기준으로 봤을때
				.getResource("/config/class-sql.properties") // 최상위 더에서 아래 경로
				.getPath();

		try {
			prop.load(new FileReader(filePath));

		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	// 공주 클래스 상세보기
	public ClassList selectOne(Connection con, int cno) {

		ClassList classList = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectOne");

		System.out.println(sql);

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cno);

			rset = pstmt.executeQuery();

			if (rset.next()) {

				classList = new ClassList();

				classList.setCno(cno);
				classList.setVno(rset.getInt("vno"));
				classList.setCname(rset.getString("cname"));
				classList.setPrice(rset.getInt("price"));
				classList.setCintro(rset.getString("cintro"));
				classList.setCourse(rset.getString("course"));
				classList.setFileNewName(rset.getString("FILE_NEW_NAME"));
				classList.setKdetail(rset.getString("kdetail"));
				classList.setTname(rset.getString("tname"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return classList;
	}

	// 윤진 작성
	// 스크랩기능 도전한다.
//   public HashMap<String, Object> scrapList(Connection con, int cno) {
//      HashMap<String, Object> hmap = new HashMap<>();
//      
//      ArrayList<ClassList> cList = new ArrayList<>();
//      
//      PreparedStatement pstmt = null;
//      ResultSet rset = null;
//      
//      String sql = prop.getProperty("#"); 
//      // sql 구문 필요
//      // 해당 mno가 가지고있는 scrap에 저장된 고유번호를 가져오기
//      
//      try {
//         pstmt = con.prepareStatement(sql);
//         
//         rset = pstmt.executeQuery();
//         
//         while(rset.next()) { // 스크랩 내용이 없을때 까지 계속 정보 가져오기
//            
//            ClassList cl = new ClassList();
//            
//            cl.setCno(rset.getInt("cno"));
//            cl.setCname(rset.getString("cname"));
//            cl.setCintro(rset.getString("cintro"));
//            cl.setPrice(rset.getInt("price"));
//            
//            cList.add(cl);
//            
//            // 여기까지 리스트 내용
//            
////            Attachment at = new Attachment();
////            at.setFno( rset.getInt("fno"));
////            // at.setCno( rset.getInt("cno")); // 클래스 번호 가져오기
////            at.setOriginname( rset.getString("originname"));
////            at.setFilepath(   rset.getString("filepath"));
////             
////            aList.add(at);
//         }
//         
////         hmap.put("classList", cList);
////         hmap.put("attachment", aList);
//      
//      } catch (SQLException e) {
//         // TODO Auto-generated catch block
//         e.printStackTrace();
//      } finally {
//         close(rset);
//         close(pstmt);
//      }
//      
//      return hmap;
//      
//   }

	// 공주 클래스 리스트 조회
	public ArrayList<ClassList> selectList(Connection con) {
		ArrayList<ClassList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");

		System.out.println(sql);

		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				ClassList cl = new ClassList();

				cl.setCno(rset.getInt("cno"));
				cl.setCname(rset.getString("cname"));
				cl.setPrice(rset.getInt("price"));
				cl.setFileNewName(rset.getString("FILE_NEW_NAME")); // 클래스 사진

				list.add(cl);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 공주 클래스 소개 작성
	public int insertWrite(Connection con, ClassList cl) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertWrite");

		System.out.println(sql);

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, cl.getCname());
			pstmt.setInt(2, cl.getPrice());
			pstmt.setString(3, cl.getCintro());
			pstmt.setString(4, cl.getCourse());
			pstmt.setString(5, cl.getKdetail());
			pstmt.setString(6, cl.getTname());

			result = pstmt.executeUpdate();

			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int getCurrentCno(Connection con) {
		int result = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// System.out.println("getCurrentBno : " + result);

		String sql = prop.getProperty("currentCno");

		try {
			pstmt = con.prepareStatement(sql);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt(1);
			}

			System.out.println(result);

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close(rset);
			close(pstmt);
		}

		System.out.println(result);

		return result;
	}

	public int insertAttachment(Connection con, Attachment at) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertAttachment");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, at.getCno());
			pstmt.setString(2, at.getFile_origin_name());
			pstmt.setString(3, at.getFile_new_name());
			pstmt.setString(4, at.getFilepath());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close(pstmt);

		}

		return result;
	}

	// 수강중 클래스
	public ArrayList<Payment> classingList(Connection con, int mno, int currentPage, int limit) {

		ArrayList<Payment> list = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("classingList");

		System.out.println(sql);

		try {

			pstmt = con.prepareStatement(sql);

			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, mno);
			
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Payment pm = new Payment();

				pm.setFileNewName(rset.getString("FILE_NEW_NAME"));
				pm.setPdate(rset.getDate("pdate"));
				pm.setCname(rset.getString("cname"));
				pm.setTotal(rset.getInt("price"));
				pm.setCno(rset.getInt("cno"));

				list.add(pm);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int deletdClass(Connection con, int cno) {
		int result = 0;

		return result;
	}

	// 회원 클래싱 갯수 조회
	public int getListCount(Connection con, int mno) {

		int result = 0;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("listCount");

		System.out.println(sql);

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, mno);

			rset = pstmt.executeQuery();

			if (rset.next()) {

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
	
	// rrrrrrrrrrrrrrrrrrrr 
	public int deleteClass(Connection con, int cno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteClass");
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}