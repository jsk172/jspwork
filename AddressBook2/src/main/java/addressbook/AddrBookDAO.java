package addressbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

//AddrBook 자료형을 이용하여 주소를 생성, 검색, 수정, 삭제 클래스
public class AddrBookDAO {
	//JDBC 관련 변수
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//주소 추가
	public void addAddrBook(AddrBook addrBook) {
		//연결
		conn = JDBCUtil.getConnection();
		
		//sql 처리
		
		try {
			String sql = "INSERT INTO addrbook(bnum, username, tel, email, gender) "
					+ "VALUES (seq_bnum.NEXTVAL, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			//폼에 입력된 자료를 가져와서 DB에 저장
			pstmt.setString(1, addrBook.getUsername());
			pstmt.setString(2, addrBook.getTel());
			pstmt.setString(3, addrBook.getEmail());
			pstmt.setString(4, addrBook.getGender());
			
			//sql 실행
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	} //addAddrBook(AddrBook addrBook)
	
	//주소 전체 목록
	public List<AddrBook> getListAll(){
		//db연결
		conn = JDBCUtil.getConnection();
		List<AddrBook> addrList = new ArrayList<>();
		
		try {
			//sql처리
			String sql = "SELECT * FROM addrbook order by bnum";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AddrBook addrBook = new AddrBook(); //빈 객체 생성
//				db에 있는 주소를 가져와서 주소 객체에 저장.
				addrBook.setBnum(rs.getInt("bnum"));
				addrBook.setUsername(rs.getString("username"));
				addrBook.setTel(rs.getString("tel"));
				addrBook.setGender(rs.getString("gender"));
				addrBook.setEmail(rs.getString("email"));
				addrBook.setRegDate(rs.getTimestamp("regdate"));
				
//				리스트에 1개 객체를 저장(순서에 따라)
				addrList.add(addrBook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {//db종료
			JDBCUtil.close(conn, pstmt, rs);
		}
		return addrList;
	} //getListAll();
	
	//주소 정보 보기
	public AddrBook getAddrBook(int bnum){
		//db연결
		conn = JDBCUtil.getConnection();
		AddrBook addrBook = new AddrBook(); //빈 객체 생성
		
		try {
			//sql처리
			String sql = "SELECT * FROM addrbook WHERE bnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			//bnum에 일치하는 1개의 주소 가져옴
			rs = pstmt.executeQuery();
			if(rs.next()) {
//				db에 있는 주소를 가져와서 주소 객체에 저장.
				addrBook.setBnum(rs.getInt("bnum"));
				addrBook.setUsername(rs.getString("username"));
				addrBook.setTel(rs.getString("tel"));
				addrBook.setGender(rs.getString("gender"));
				addrBook.setEmail(rs.getString("email"));
				addrBook.setRegDate(rs.getTimestamp("regdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return addrBook;
	} //getAddrBook(int bnum)
	
	//로그인 체크
	public boolean checkLogin(String email) {
		conn = JDBCUtil.getConnection();
	
		try {
			String sql ="SELECT email FROM addrbook "
					+ "WHERE email =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) { //검색한 이메일이 있으면 true 리턴
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return false;
	}
	//주소 삭제
	public void deleteAddrBook(int bnum) {
		//db연결
		conn = JDBCUtil.getConnection();
		try {
			//sql처리
			String sql = "DELETE FROM addrbook WHERE bnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum); //외부에서 번호를 입력함.
			
			//sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //db종료
			JDBCUtil.close(conn, pstmt);
		}
	}//주소삭제
	
	//주소 수정
	public void updateAddrBook(AddrBook addrBook) {
		//db연결
		conn = JDBCUtil.getConnection();
		
		try {
			//sql 처리
			String sql = "UPDATE addrbook "
					+ "SET username = ?, tel=?, email=?, gender=? "
					+ "WHERE bnum  = ?";
			pstmt = conn.prepareStatement(sql);
			//폼에 입력된 데이터를 가져와서 db에 저장
			pstmt.setString(1, addrBook.getUsername());
			pstmt.setString(2, addrBook.getTel());
			pstmt.setString(3, addrBook.getEmail());
			pstmt.setString(4, addrBook.getGender());
			pstmt.setInt(5, addrBook.getBnum());
			//sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //db종료
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	//세션으로 사용할 이름 가져오기
	public String getNameByEmail(String email) {
		//db연결
		conn = JDBCUtil.getConnection();
		String name = "";
		try {
			//sql 처리 및 실행
			String sql = "SELECT * FROM addrbook WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//db에서 이름을 꺼내옴
				name = rs.getString("username");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //db 종료
			JDBCUtil.close(conn, pstmt, rs);
		}
		return name;
	}
}
