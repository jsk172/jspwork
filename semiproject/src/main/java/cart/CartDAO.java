package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;
import product.ProductVO;

public class CartDAO {
	Connection conn = null;         //db연결 및 종료
	PreparedStatement pstmt = null; //sql처리
	ResultSet rs = null;			//검색한 데이터 셋

	//카트 담기
	public void insertCart(CartVO c) {
		conn = JDBCUtil.getConnection();
		try {
			String sql = "insert into cart(cartnum, cnt, pno, id) "
					+ "values(seq_cartnum.nextval, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			//폼에 입력된 데이터를 가져와서 db에 저장함
			pstmt.setInt(1, c.getCnt());
			pstmt.setInt(2, c.getPno());
			pstmt.setString(3, c.getId());

			//sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}//카트 담기

	//카트 리스트 보기
	public List<ProductVO> getCartList(String id) {
		List<ProductVO> cartList = new ArrayList();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select p.* from cart c, product p where c.pno = p.pno AND id=?";
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

				cartList.add(c);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return cartList;
	}

	//카트리스트2 보기
	public List<CartVO> getCartList2(String id) {
		List<CartVO> cartList = new ArrayList();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select * from cart where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				CartVO c = new CartVO();
				c.setCartnum(rs.getInt("cartnum"));
				c.setCnt(rs.getInt("cnt"));
				c.setCartDate(rs.getTimestamp("cartdate"));
				c.setPno(rs.getInt("pno"));
				c.setId(rs.getString("id"));

				cartList.add(c);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return cartList;
	}

	//구매 후 장바구니 삭제
	public void deletecart(String id) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "delete from cart where id = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
}
