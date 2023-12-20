package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class ReviewBoardDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//게시글 목록 조회
	public List<RBoard> getRBoardList(){
		List<RBoard> rboardList = new ArrayList<>();

		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM review ORDER BY rno DESC";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				RBoard rb = new RBoard();
				rb.setRno(rs.getInt("rno"));
				rb.setRtitle(rs.getString("rtitle"));
				rb.setRcontent(rs.getString("rcontent"));
				rb.setRdate(rs.getTimestamp("rdate"));
				rb.setRfilename(rs.getString("rfilename"));
				rb.setRupdate(rs.getTimestamp("rupdate"));
				rb.setRrate(rs.getInt("rrate"));
				rb.setLikes(rs.getInt("likes"));
				rb.setRhit(rs.getInt("rhit"));
				rb.setId(rs.getString("id"));

				rboardList.add(rb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return rboardList;
	}

	public List<RBoard> getRBoardList(int page){
		List<RBoard> rboardList = new ArrayList<>();

		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * "
					+ "FROM (SELECT ROWNUM RN, rv.* FROM (SELECT * FROM review ORDER BY rno DESC) rv) "
					+ "WHERE RN >= ? AND RN <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page-1)*20+1);
			pstmt.setInt(2, page*20);	//페이지당 게시글수

			rs = pstmt.executeQuery();
			while(rs.next()) {
				RBoard rb = new RBoard();
				rb.setRno(rs.getInt("rno"));
				rb.setRtitle(rs.getString("rtitle"));
				rb.setRcontent(rs.getString("rcontent"));
				rb.setRdate(rs.getTimestamp("rdate"));
				rb.setRfilename(rs.getString("rfilename"));
				rb.setRupdate(rs.getTimestamp("rupdate"));
				rb.setRrate(rs.getInt("rrate"));
				rb.setLikes(rs.getInt("likes"));
				rb.setRhit(rs.getInt("rhit"));
				rb.setId(rs.getString("id"));

				rboardList.add(rb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return rboardList;
	}

	//게시물 목록(페이지와 검색 처리)
	public List<RBoard> getRBoardList(String field, String kw, int page){
		List<RBoard> rboardList = new ArrayList<>();
		try {
			//db연결
			conn = JDBCUtil.getConnection();
			//sql 처리 : field에 "title", "id"가 입력됨
			String sql = "SELECT * "
					+ "FROM (SELECT ROWNUM RN, r.* FROM (SELECT * FROM review " 
					+ "WHERE " + field + " LIKE ? ORDER BY rno DESC) r) "
					+ "WHERE RN >= ? AND RN <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + kw + "%");
			pstmt.setInt(2, (page-1)*20+1);
			pstmt.setInt(3, page * 20);

			rs = pstmt.executeQuery();	//검색한 데이터셋(모음)
			while(rs.next()) {
				RBoard rb = new RBoard();
				rb.setRno(rs.getInt("rno"));
				rb.setRtitle(rs.getString("rtitle"));
				rb.setRcontent(rs.getString("rcontent"));
				rb.setRdate(rs.getTimestamp("rdate"));
				rb.setRfilename(rs.getString("rfilename"));
				rb.setRupdate(rs.getTimestamp("rupdate"));
				rb.setRrate(rs.getInt("rrate"));
				rb.setLikes(rs.getInt("likes"));
				rb.setRhit(rs.getInt("rhit"));
				rb.setId(rs.getString("id"));

				rboardList.add(rb);	//list에 b객체 저장
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return rboardList;
	}

	public int getRBoardCount() {
		int total = 0;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT COUNT(*) AS total FROM review";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt("total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return total;
	}

	//공지사항 글쓰기
	public void rWrite(RBoard rb) {

		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO review(rno, rtitle, rcontent, rfilename, id) "
					+ "VALUES (seq_rno.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rb.getRtitle());
			pstmt.setString(2, rb.getRcontent());
			pstmt.setString(3, rb.getRfilename());
			pstmt.setString(4, rb.getId());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}

	public RBoard getRBoard(int rno) {
		RBoard rb = new RBoard();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM review WHERE rno = ?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, rno);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				rb.setRno(rs.getInt("rno"));
				rb.setRtitle(rs.getString("rtitle"));
				rb.setRcontent(rs.getString("rcontent"));
				rb.setRdate(rs.getTimestamp("rdate"));
				rb.setRfilename(rs.getString("rfilename"));
				rb.setRupdate(rs.getTimestamp("rupdate"));
				rb.setRrate(rs.getInt("rrate"));
				rb.setLikes(rs.getInt("likes"));
				rb.setRhit(rs.getInt("rhit"));
				rb.setId(rs.getString("id"));

				sql = "UPDATE review SET rhit = rhit + 1 WHERE rno = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rno);

				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return rb;
	}

	public void deleteRBoard(int rno) {

		try {
			conn = JDBCUtil.getConnection();
			String sql = "DELETE FROM review WHERE rno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}

	public void updateRBoard(RBoard rb) {
		Timestamp now = new Timestamp(System.currentTimeMillis());
		try {
			conn = JDBCUtil.getConnection();
			//수정일 처리는 현재 날짜와 시간으로 입력
			String sql = "UPDATE review SET rtitle = ?, rcontent = ?, rupdate = ? "
					+ "WHERE rno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rb.getRtitle());
			pstmt.setString(2, rb.getRcontent());
			pstmt.setTimestamp(3, now);
			pstmt.setInt(4, rb.getRno());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
}
