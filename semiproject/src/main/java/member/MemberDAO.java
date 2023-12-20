package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class MemberDAO {
	Connection conn = null;         //db연결 및 종료
	PreparedStatement pstmt = null; //sql처리
	ResultSet rs = null;			//검색한 데이터 셋

	//회원 목록
	public List<MemberVO> getMemberList(){
		List<MemberVO> memberList = new ArrayList();
		try {
			//db연결
			conn = JDBCUtil.getConnection();
			//sql처리
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//빈 회원을 생성해서 db에서 정보를 가져와서 세팅
				MemberVO m = new MemberVO();
				m.setId(rs.getString("id"));
				m.setPasswd(rs.getString("passwd"));
				m.setName(rs.getString("name"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setJoinDate(rs.getTimestamp("joindate"));
				m.setZip_code(rs.getString("zip_code"));
				m.setAddress(rs.getString("address"));
				m.setDetailaddress(rs.getString("detailaddress"));

				//리스트에 회원을 추가
				memberList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //db종료
			JDBCUtil.close(conn, pstmt, rs);
		}

		//db종료
		return memberList;
	} //회원목록

	//회원 가입
	public void insertMember(MemberVO m) {

		try {
			conn = JDBCUtil.getConnection();
			String sql = "insert into member(id, passwd, name, email, phone, zip_code, address, detailaddress) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			//폼에 입력된 데이터를 가져와서 db에 저장함
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPasswd());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getZip_code());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getDetailaddress());

			//sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}//회원가입

	//로그인 인증
	public MemberVO checkLogin(MemberVO m) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select * from member where id = ? and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPasswd());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m.setName(rs.getString("name"));
				System.out.println("Login successful. Name: " + m.getName());
			}else {
				System.out.println("Login failed.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return m;
	}

	//회원상세조회
	public MemberVO getMember(String id) {
		MemberVO m = new MemberVO();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m.setId(rs.getString("id"));
				m.setPasswd(rs.getString("passwd"));
				m.setName(rs.getString("name"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setJoinDate(rs.getTimestamp("joindate"));
				m.setZip_code(rs.getString("zip_code"));
				m.setAddress(rs.getString("address"));
				m.setDetailaddress(rs.getString("detailaddress"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return m;
	}
	
	//회원정보 수정
	public void updateMember(String id, MemberVO m) {
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "update member set passwd = ?, email = ?, phone = ? , zip_code = ? , address = ? , detailaddress = ? "
					+ "  where id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getPasswd());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getZip_code());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getDetailaddress());
			pstmt.setString(7, id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	//회원 탈퇴
	public void deletemember(String id) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "delete from member where id = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
}
