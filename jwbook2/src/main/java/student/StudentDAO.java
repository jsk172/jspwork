package student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

//Student 자료형으로 추가, 목록을 보여줄 클래스
public class StudentDAO {
	//db연결 및 종료, sql 처리를 하는 매서드 생성
	Connection conn = null;
	PreparedStatement pstmt = null; //sql 처리 클래스
	ResultSet rs = null; //검색한 데이터 셋
	
	//학생 목록 보기
	public List<Student> getStudentList() {
		conn = JDBCUtil.getConnection();
		List<Student> students = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM student ORDER BY sid";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Student s = new Student();
				s.setSid(rs.getInt("sid"));
				s.setUsername(rs.getString("username"));
				s.setUniv(rs.getString("univ"));
				s.setBirth(rs.getString("birth"));
				s.setEmail(rs.getString("email"));
				
				students.add(s); // 어레이리스트에 객체 1명 저장
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}
	//학생 추가 등록
	public void insertStudent(Student s) {
		conn = JDBCUtil.getConnection();
		
		try {
			String sql = "insert into student (sid, username, univ, birth, email) "
					+ "values(seq_sid.NEXTVAL, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getUsername());
			pstmt.setString(2, s.getUniv());
			pstmt.setString(3, s.getBirth());
			pstmt.setString(4, s.getEmail());
			//sql 실행 처리
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //db종료
			JDBCUtil.close(conn, pstmt);
		}
	}
}
