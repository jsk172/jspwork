package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

//회언을 추가, 검색, 수정, 삭제할 클래스
public class MemberDAO {
	Connection conn = null;         //db연결 및 종료
	PreparedStatement pstmt = null; //sql처리
	ResultSet rs = null;			//검색한 데이터 셋
	
	//회원 목록
	public List<Member> getMemberList(){
		List<Member> memberList = new ArrayList();
		
		try {
			//db연결
			conn = JDBCUtil.getConnection();
			//sql처리
			String sql = "select * from member order by mno";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//빈 회원을 생성해서 db에서 정보를 가져와서 세팅
				Member m = new Member();
				m.setMno(rs.getInt("mno"));
				m.setId(rs.getString("id"));
				m.setPasswd(rs.getString("passwd"));
				m.setName(rs.getString("name"));
				m.setEmail(rs.getString("email"));
				m.setGender(rs.getString("gender"));
				m.setJoinDate(rs.getTimestamp("joindate"));
				
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
	}
	
	//회원 가입
	public void insertMember(Member m) {
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "insert into member(mno, id, passwd, name, email, gender) "
					+ "values(seq_mno.NEXTVAL, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			//폼에 입력된 데이터를 가져와서 db에 저장함
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPasswd());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getGender());
			
			//sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	//회원정보(상세보기)
	public Member getMember(String id) {
		
		Member m = new Member();
		
		try {
			conn = JDBCUtil.getConnection();
			
			String sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m.setMno(rs.getInt("mno"));
				m.setId(rs.getString("id"));
				m.setPasswd(rs.getString("passwd"));
				m.setName(rs.getString("name"));
				m.setEmail(rs.getString("email"));
				m.setGender(rs.getString("gender"));
				m.setJoinDate(rs.getTimestamp("joindate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return m;
	}
	//로그인 인증(객체 : member로 반환)
	public Member checkLogin(Member m) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select * from member where id = ? and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPasswd());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//이름을 DB에서 가져옴
				m.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return m;
	}
	
	
	/*
	public boolean checkLogin(Member m) {
		
		try {
			conn = JDBCUtil.getConnection();
			
			
			String sql = "select * from member where id = ? and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPasswd());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return false;
	}
	*/
	
	
	//ID 중복검사
	public boolean getDuplicatedId(String id) {
		boolean result = false;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select decode(count(*),1,'true','false') as result "
					+ "from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//별칭을 칼럼으로 db에서 데이터를 가져옴
				result = rs.getBoolean("result");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
}
