package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class NoticeBoardDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//게시글 목록 조회
	public List<NBoard> getNBoardList(){
		List<NBoard> nboardList = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM notice ORDER BY nno";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NBoard nb = new NBoard();
				nb.setNno(rs.getInt("nno"));
				nb.setNtitle(rs.getString("ntitle"));
				nb.setNcontent(rs.getString("ncontent"));
				nb.setNfilename(rs.getString("nfilename"));
				nb.setNdate(rs.getTimestamp("ndate"));
				nb.setNupdate(rs.getTimestamp("nupdate"));
				nb.setNhit(rs.getInt("nhit"));
				
				nboardList.add(nb);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return nboardList;
	}
	
	public List<NBoard> getNBoardList(int page){
		List<NBoard> nboardList = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * "
					+ "FROM (SELECT ROWNUM RN, n.* FROM (SELECT * FROM notice ORDER BY nno DESC) n) "
					+ "WHERE RN >= ? AND RN <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page-1)*10+1);
			pstmt.setInt(2, page*10);	//페이지당 게시글수
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NBoard nb = new NBoard();
				nb.setNno(rs.getInt("nno"));
				nb.setNtitle(rs.getString("ntitle"));
				nb.setNcontent(rs.getString("ncontent"));
				nb.setNfilename(rs.getString("nfilename"));
				nb.setNdate(rs.getTimestamp("ndate"));
				nb.setNupdate(rs.getTimestamp("nupdate"));
				nb.setNhit(rs.getInt("nhit"));
				
				nboardList.add(nb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return nboardList;
	}
	
	public int getNBoardCount() {
		int total = 0;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT COUNT(*) AS total FROM notice";
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
	public void nWrite(NBoard nb) {
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "insert into notice(nno, ntitle, ncontent) "
					+ "VALUES (seq_nno.NEXTVAL, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nb.getNtitle());
			pstmt.setString(2, nb.getNcontent());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	public NBoard getNBoard(int nno) {
		NBoard nb = new NBoard();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM notice WHERE nno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {	//검색한 데이터가 있으면
				nb.setNno(rs.getInt("nno"));
				nb.setNtitle(rs.getString("ntitle"));
				nb.setNcontent(rs.getString("ncontent"));
				nb.setNfilename(rs.getString("nfilename"));
				nb.setNdate(rs.getTimestamp("ndate"));
				nb.setNupdate(rs.getTimestamp("nupdate"));
				nb.setNhit(rs.getInt("nhit"));
				nb.setId(rs.getString("id"));
				
				sql = "UPDATE notice SET nhit = nhit + 1 WHERE nno = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, nno);
				
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return nb;
	}
}