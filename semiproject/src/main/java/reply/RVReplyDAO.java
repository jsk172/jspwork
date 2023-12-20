package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class RVReplyDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<RVReply> getRVReplyList(int rno){
		List<RVReply> rvreplyList = new ArrayList<>();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM rvreply WHERE rno = ?" 
					+ "ORDER BY redate";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RVReply rvr = new RVReply();
				rvr.setRvrno(rs.getInt("rvrno"));
				rvr.setRno(rs.getInt("rno"));
				rvr.setRecontent(rs.getString("recontent"));
				rvr.setReplyer(rs.getString("replyer"));
				rvr.setRedate(rs.getTimestamp("redate"));
				rvr.setReupdate(rs.getTimestamp("reupdate"));
				
				rvreplyList.add(rvr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return rvreplyList;
	}
	
	public void insertRVReply(RVReply rvr) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO qareply(rvrno, rno, recontent, replyer) "
					+ "VALUES (seq_rvrno.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvr.getRno());
			pstmt.setString(2, rvr.getRecontent());
			pstmt.setString(3, rvr.getReplyer());
		
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	public void deleteRVReply(int rvrno) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "DELETE FROM rvreply WHERE rvrno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvrno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
}