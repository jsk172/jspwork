package qa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class QABoardDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//게시글 목록 조회
	public List<QABoard> getQABoardList(){
		List<QABoard> qaboardList = new ArrayList<>();

		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM qa ORDER BY qno";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				QABoard qab = new QABoard();
				qab.setQno(rs.getInt("qno"));
				qab.setQtitle(rs.getString("qtitle"));
				qab.setQcontent(rs.getString("qcontent"));
				qab.setQfilename(rs.getString("qfilename"));
				qab.setQdate(rs.getTimestamp("qdate"));
				qab.setQupdate(rs.getTimestamp("qupdate"));
				qab.setQhit(rs.getInt("qhit"));
				qab.setId(rs.getString("id"));

				qaboardList.add(qab);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return qaboardList;
	}

	public List<QABoard> getQABoardList(int page){
		List<QABoard> qaboardList = new ArrayList<>();

		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * "
					+ "FROM (SELECT ROWNUM RN, q.* FROM (SELECT * FROM qa ORDER BY rno DESC) q) "
					+ "WHERE RN >= ? AND RN <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page-1)*20+1);
			pstmt.setInt(2, page*20);	//페이지당 게시글수

			rs = pstmt.executeQuery();
			while(rs.next()) {
				QABoard qab = new QABoard();
				qab.setQno(rs.getInt("qno"));
				qab.setQtitle(rs.getString("qtitle"));
				qab.setQcontent(rs.getString("qcontent"));
				qab.setQfilename(rs.getString("qfilename"));
				qab.setQdate(rs.getTimestamp("qdate"));
				qab.setQupdate(rs.getTimestamp("qupdate"));
				qab.setQhit(rs.getInt("qhit"));
				qab.setId(rs.getString("id"));

				qaboardList.add(qab);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return qaboardList;
	}

	//게시물 목록(페이지와 검색 처리)
	public List<QABoard> getQABoardList(String field, String kw, int page){
		List<QABoard> qaboardList = new ArrayList<>();
		try {
			//db연결
			conn = JDBCUtil.getConnection();
			//sql 처리 : field에 "title", "id"가 입력됨
			String sql = "SELECT * "
					+ "FROM (SELECT ROWNUM RN, q.* FROM (SELECT * FROM qa " 
					+ "WHERE " + field + " LIKE ? ORDER BY qno DESC) q) "
					+ "WHERE RN >= ? AND RN <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + kw + "%");
			pstmt.setInt(2, (page-1)*20+1);
			pstmt.setInt(3, page * 20);

			rs = pstmt.executeQuery();	//검색한 데이터셋(모음)
			while(rs.next()) {
				QABoard qab = new QABoard();
				qab.setQno(rs.getInt("qno"));
				qab.setQtitle(rs.getString("qtitle"));
				qab.setQcontent(rs.getString("qcontent"));
				qab.setQfilename(rs.getString("qfilename"));
				qab.setQdate(rs.getTimestamp("qdate"));
				qab.setQupdate(rs.getTimestamp("qupdate"));
				qab.setQhit(rs.getInt("qhit"));
				qab.setId(rs.getString("id"));

				qaboardList.add(qab);	//list에 b객체 저장
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return qaboardList;
	}

	public int getQABoardCount() {
		int total = 0;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT COUNT(*) AS total FROM qa";
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

	//문의게시판 글쓰기
	public void qaWrite(QABoard qab) {

		try {
			conn = JDBCUtil.getConnection();
			String sql = "insert into qa(qno, qtitle, qcontent, qfilename, id) "
					+ "VALUES (seq_qno.NEXTVAL, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qab.getQtitle());
			pstmt.setString(2, qab.getQcontent());
			pstmt.setString(3, qab.getQfilename());
			pstmt.setString(4, qab.getId());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}

	public QABoard getQABoard(int qno) {
		QABoard qab = new QABoard();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM qa WHERE qno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				qab.setQno(rs.getInt("qno"));
				qab.setQtitle(rs.getString("qtitle"));
				qab.setQcontent(rs.getString("qcontent"));
				qab.setQfilename(rs.getString("qfilename"));
				qab.setQdate(rs.getTimestamp("qdate"));
				qab.setQupdate(rs.getTimestamp("qupdate"));
				qab.setQhit(rs.getInt("qhit"));
				qab.setId(rs.getString("id"));

				//int qhit = rs.getInt() + 1;
				sql = "UPDATE qa SET qhit = qhit + 1 WHERE qno = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, qno);

				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return qab;
	}

	public void deleteQABoard(int qno) {

		try {
			conn = JDBCUtil.getConnection();
			String sql = "delete from qa where qno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}

	public void updateQABoard(QABoard qab) {
		Timestamp now = new Timestamp(System.currentTimeMillis());
		try {
			conn = JDBCUtil.getConnection();
			//수정일 처리는 현재 날짜와 시간으로 입력
			String sql = "UPDATE qa SET qtitle = ?, qcontent = ?, qupdate = ? "
					+ "WHERE qno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qab.getQtitle());
			pstmt.setString(2, qab.getQcontent());
			pstmt.setTimestamp(3, now);
			pstmt.setInt(4, qab.getQno());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
}
