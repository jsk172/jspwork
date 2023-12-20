package voter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCUtil;

public class VoterDAO {
	Connection conn = null;         //db연결 및 종료
	PreparedStatement pstmt = null; //sql처리
	ResultSet rs = null;			//검색한 데이터 셋
	
	
	//좋아요 추가
	public void insertVote(Voter v) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "insert into voter(vno, bno, mid) values(seq_vno.nextval, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, v.getBno());
			pstmt.setString(2, v.getMid());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
			
	}


	public int voteCount(int bno) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select count(*) AS total from voter where bno = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			//sql 검색
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //count한 값이 있으면 숫자를 반환
				return rs.getInt("total");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return 0; //count값이 없으면 0을 반환
	}


	public int checkVoter(int bno, String id) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select count(*) AS result from voter where bno = ? AND mid = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, id);
			
			//sql 검색
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("result"); //일치하면 1이 반환
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return 0;
	}


	//좋아요 저장 유무 확인(체크) - 세션아이디, 글번호 일치
	public void deleteVote(Voter v) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "delete from voter where bno=? AND mid=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, v.getBno());
			pstmt.setString(2, v.getMid());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	
	//좋아요 취소
	
	
	//좋아요 총개수
}
