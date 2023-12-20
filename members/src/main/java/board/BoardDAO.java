package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class BoardDAO {
	Connection conn = null;         //db연결 및 종료
	PreparedStatement pstmt = null; //sql처리
	ResultSet rs = null;			//검색한 데이터 셋
	
	//게시글 목록
	public List<Board> getBoardList(){
		List<Board> boardList = new ArrayList<>();
		
		try {
			//db 연결
			conn = JDBCUtil.getConnection();
			//sql 처리
			String sql = "SELECT * FROM board ORDER BY bno DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //검색한 데이터셋(모음)
			while(rs.next()) {
				Board b = new Board();
				b.setBno(rs.getInt("bno"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setCreateDate(rs.getTimestamp("createdate"));
				b.setModifyDate(rs.getTimestamp("modifydate"));
				b.setHit(rs.getInt("hit"));
				b.setFilename(rs.getString("filename"));
				b.setId(rs.getString("id"));
				
				boardList.add(b); //List에 b객체 저장
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return boardList;
	}
	
	//게시판 페이지클릭할때
	public List<Board> getBoardList(int page){
		List<Board> boardList = new ArrayList<>();
		
		try {
			//db 연결
			conn = JDBCUtil.getConnection();
			//sql 처리
			String sql = "select * "
					+ "from (select rownum RN, bo.* from (select * from board order by bno desc) bo) "
					+ "where RN >= ? and RN <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page-1)*10+1); //시작행(start row)
			pstmt.setInt(2, page*10); //페이지당 게시글 끝번호
			rs = pstmt.executeQuery(); //검색한 데이터셋(모음)
			while(rs.next()) {
				Board b = new Board();
				b.setBno(rs.getInt("bno"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setCreateDate(rs.getTimestamp("createdate"));
				b.setModifyDate(rs.getTimestamp("modifydate"));
				b.setHit(rs.getInt("hit"));
				b.setFilename(rs.getString("filename"));
				b.setId(rs.getString("id"));
				
				boardList.add(b); //List에 b객체 저장
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return boardList;
	}
	
	//게시글 목록(검색처리)
	public List<Board> getBoardList(String field, String kw){
		List<Board> boardList = new ArrayList<>();
		
		try {
			//db 연결
			conn = JDBCUtil.getConnection();
			//sql 처리 : field에 title이나 id가 입력됨
			String sql = "select * from board where "+ field + " LIKE ? order by bno desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + kw + "%");
			rs = pstmt.executeQuery(); //검색한 데이터셋(모음)
			while(rs.next()) {
				Board b = new Board();
				b.setBno(rs.getInt("bno"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setCreateDate(rs.getTimestamp("createdate"));
				b.setModifyDate(rs.getTimestamp("modifydate"));
				b.setHit(rs.getInt("hit"));
				b.setFilename(rs.getString("filename"));
				b.setId(rs.getString("id"));
				
				boardList.add(b); //List에 b객체 저장
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return boardList;
	}
	
	//게시글 목록(페이지와 검색 처리)
	public List<Board> getBoardList(String field, String kw, int page){
		List<Board> boardList = new ArrayList<>();
		
		try {
			//db 연결
			conn = JDBCUtil.getConnection();
			//sql 처리 : field에 title이나 id가 입력됨
			String sql = "select * "
					+ "from (select rownum RN, bo.* from (select * from board where " 
					+ field + " LiKE ? ORDER BY bno desc) bo) "
					+ "where RN >= ? and RN <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + kw + "%");
			pstmt.setInt(2, (page-1)*10 + 1);
			pstmt.setInt(3, page*10);
			rs = pstmt.executeQuery(); //검색한 데이터셋(모음)
			while(rs.next()) {
				Board b = new Board();
				b.setBno(rs.getInt("bno"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setCreateDate(rs.getTimestamp("createdate"));
				b.setModifyDate(rs.getTimestamp("modifydate"));
				b.setHit(rs.getInt("hit"));
				b.setFilename(rs.getString("filename"));
				b.setId(rs.getString("id"));
				
				boardList.add(b); //List에 b객체 저장
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return boardList;
	}
	
	//총 게시글 수
	public int getBoardCount() {
		int total = 0;
		try {
			//db 연결
			conn = JDBCUtil.getConnection();
			//sql 처리
			String sql = "select count(*) as total from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //검색한 데이터셋(모음)
			if(rs.next()) {
				total = rs.getInt("total");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return total;
	}
	
	
	//글쓰기 처리
	public void write(Board b) {
		try {
			//db 연결
			conn = JDBCUtil.getConnection();
			//sql 처리
			String sql = "insert into board(bno, title, content, filename, id) "
					+ "values(seq_bno.NEXTVAL, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setString(3, b.getFilename());
			pstmt.setString(4, b.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	//게시글 상세보기
	public Board getBoard(int bno) {
		Board b = new Board();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select * from  board where bno = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) { //검색한 데이터가 있으면
				b.setBno(rs.getInt("bno"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setCreateDate(rs.getTimestamp("createdate"));
				b.setModifyDate(rs.getTimestamp("modifydate"));
				b.setHit(rs.getInt("hit"));
				b.setFilename(rs.getString("filename"));
				b.setId(rs.getString("id"));
				
				//조회수 증가
				sql = "update board set hit = hit+1 where bno = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bno);
				pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return b;
	}
	
	//게시글 삭제
	public void deleteboard(int bno) {
		try {
			//db 연결
			conn = JDBCUtil.getConnection();
			//sql 처리
			String sql = "delete from board where bno = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	//게시글 수정 : 가입과 비슷하나 수정해서 가입시킨다고 이해하면 편함.
	public void updateboard(Board b) {
		//현재 시간 객체 생성
		Timestamp now = new Timestamp(System.currentTimeMillis());
		try {
			//db 연결
			conn = JDBCUtil.getConnection();
			//sql 처리
			String sql = "update board set title = ?, content= ?, modifydate = ?, filename=? where bno = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setTimestamp(3, now);
			pstmt.setString(4, b.getFilename());
			pstmt.setInt(5, b.getBno());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	//파일이 없는경우 게시글 수정
	public void updateboardNoFile(Board b) {
		//현재 시간 객체 생성
		Timestamp now = new Timestamp(System.currentTimeMillis());
		try {
			//db 연결
			conn = JDBCUtil.getConnection();
			//sql 처리
			String sql = "update board set title = ?, content= ?, modifydate = ? where bno = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setTimestamp(3, now);
			pstmt.setInt(4, b.getBno());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
}
