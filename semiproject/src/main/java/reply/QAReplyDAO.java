package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class QAReplyDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<QAReply> getQAReplyList(int qno){
		List<QAReply> qareplyList = new ArrayList<>();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM qareply WHERE qno = ?" 
					+ "ORDER BY redate";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QAReply qr = new QAReply();
				qr.setQreno(rs.getInt("qreno"));
				qr.setQno(rs.getInt("qno"));
				qr.setRecontent(rs.getString("recontent"));
				qr.setReplyer(rs.getString("replyer"));
				qr.setRedate(rs.getTimestamp("redate"));
				qr.setReupdate(rs.getTimestamp("reupdate"));
				
				qareplyList.add(qr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return qareplyList;
	}
	
	public void insertQAReply(QAReply qr) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO qareply(qreno, qno, recontent, replyer) "
					+ "VALUES (seq_qreno.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qr.getQno());
			pstmt.setString(2, qr.getRecontent());
			pstmt.setString(3, qr.getReplyer());
		
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	public void deleteQAReply(int qreno) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "DELETE FROM qareply WHERE qreno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qreno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
}