package purchasehistory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;
import product.ProductVO;

public class PurchaseHistoryDAO {
	Connection conn = null; 
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//구매내역 생성
	public void insertPurchaseHistory(PurchaseHistoryVO p) {
		conn=JDBCUtil.getConnection();
		try {
			String sql = "insert into purchasehistory(phno, pcnt, id, pno) values(phno.NEXTVAL, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			//폼에 입력된 데이터를 가져와서 db에 저장함
			pstmt.setInt(1, p.getPcnt());
			pstmt.setString(2, p.getId());
			pstmt.setInt(3, p.getPno());

			//sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}

	//구매내역 리스트 보기
	public List<ProductVO> getHistoryList(String id) {
		List<ProductVO> historyList = new ArrayList();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select p.* from purchasehistory h, product p where h.pno = p.pno AND id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				ProductVO c = new ProductVO();
				c.setPno(rs.getInt("pno"));
				c.setPname(rs.getString("pname"));
				c.setPrice(rs.getInt("price"));
				c.setP_score(rs.getInt("p_score"));
				c.setSal_num(rs.getInt("sal_num"));
				c.setPcontent(rs.getString("pcontent"));
				c.setCategory(rs.getString("category"));
				c.setPfilename(rs.getString("pfilename"));

				historyList.add(c);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return historyList;
	}

	//구매내역 리스트 보기
	public List<PurchaseHistoryDTO> getHistoryList2(String id) {
		List<PurchaseHistoryDTO> historyList = new ArrayList();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select h.phno, h.pdate, h.pcnt, p.price, p.pname, p.pfilename "
					+ "from purchasehistory h, product p where h.pno = p.pno AND id=? order by 1 desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				PurchaseHistoryDTO h = new PurchaseHistoryDTO();
				h.setPhno(rs.getInt("phno"));
				h.setPdate(rs.getTimestamp("pdate"));
				h.setPcnt(rs.getInt("pcnt"));
				h.setPrice(rs.getInt("price"));
				h.setPname(rs.getString("pname"));
				h.setPfilename(rs.getString("pfilename"));
				
				historyList.add(h);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return historyList;
	}
}
