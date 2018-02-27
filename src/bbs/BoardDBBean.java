package bbs;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bbs.BoardDataBean;

//BoardDBBean bd = BoardDBBean.getInstance()
public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();

	public static BoardDBBean getInstance() {
		return instance;
	}

	private BoardDBBean() {
	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}

	// writePro.jsp
	@SuppressWarnings("resource")
	public void insertArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 답변글인지 일반글인지를 구분해서 입력시켜주는 로직!!!
		int cnt = 0;

		int number = 0;
		String sql = "";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select max(b_No) from board");
			rs = pstmt.executeQuery();

			if (rs.next())
				number = rs.getInt(1) + 1;// 글번호
			else
				number = 1;

				sql = "insert into board(b_no, emp_no, b_title, emp_nm, b_content, post_date, b_view_cnt, store_no, board_pw) values(BOARD_SEQ.NEXTVAL,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, article.getEmp_no());
				pstmt.setString(2, article.getB_title());
				pstmt.setString(3, article.getEmp_nm());
				pstmt.setString(4, article.getB_content());
				pstmt.setString(5, article.getPost_date());
				pstmt.setInt(6, cnt);
				pstmt.setInt(7, article.getStore_no());
				pstmt.setString(8, article.getBoard_pw());
				pstmt.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}

	}

	// list.jsp : 페이징을 위해서 전체 DB에 입력된 행의수가 필요하다...!!!
	@SuppressWarnings("unused")
	public int getArticleCount(String opt, String condition) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		
		int x = 0;

		try {
			conn = getConnection();
			if (opt == null) {

				pstmt = conn.prepareStatement("select count(*) from board");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					x = rs.getInt(1);
				}

			} else if (opt.equals("T")) {
				pstmt = conn.prepareStatement("select count(*) from board where B_TITLE like '%" + condition + "%'");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					x = rs.getInt(1);
				}
			} else if (opt.equals("C")) {
				pstmt = conn.prepareStatement("select count(*) from board where b_content like '%" + condition + "%'");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					x = rs.getInt(1);
				}

			} else if (opt.equals("A")) {
				pstmt = conn.prepareStatement("select count(*) from board where b_content like '%" + condition + "%' and B_TITLE like '%" + condition + "%'");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					x = rs.getInt(1);
				}
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// list.jsp ==> Paging!!! DB로부터 여러행을 결과로 받는다.
	@SuppressWarnings({ "rawtypes", "unchecked", "null" })
	public List getArticles(int start, int end, String opt, String condition) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		
		/*System.out.println("opt::"+opt);*/
		
		try {
			if (opt == null) {
				
				conn = getConnection();

				pstmt = conn.prepareStatement("select B_NO,EMP_NO,B_TITLE,EMP_NM,B_CONTENT,POST_DATE,B_VIEW_CNT,store_no,board_pw, store_nm,r "
						+ "from (select B_NO,EMP_NO,B_TITLE,EMP_NM,B_CONTENT,POST_DATE,B_VIEW_CNT, store_no, board_pw, store_nm,rownum r "
						+ "from (select b.b_no B_NO,b.emp_no EMP_NO,b.b_title B_TITLE,b.emp_nm EMP_NM,b.b_content B_CONTENT,b.post_date POST_DATE,b.b_view_cnt B_VIEW_CNT, b.store_no store_no, b.board_pw board_pw, s.store_nm store_nm "
						+ "from board b inner join store_list s on b.store_no = s.store_no) order by B_NO desc) where r >= ? and r <= ? ");
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					articleList = new ArrayList(end);
					do {
						BoardDataBean article = new BoardDataBean();

						article.setB_no(rs.getInt("b_no"));
						article.setEmp_no(rs.getInt("emp_no"));
						article.setB_title(rs.getString("b_title"));
						article.setEmp_nm(rs.getString("emp_nm"));
						article.setB_content(rs.getString("b_content"));
						article.setPost_date(rs.getString("post_date"));
						article.setB_view_cnt(rs.getInt("b_view_cnt"));
						article.setStore_no(rs.getInt("store_no"));
						article.setBoard_pw(rs.getString("board_pw"));
						article.setStore_nm(rs.getString("store_nm"));
						articleList.add(article);
					} while (rs.next());
				}
			} else if (opt.equals("T")) {
				
				conn = getConnection();
				/*'%condition%'
				like '%"+condition+"%'*/
				pstmt = conn.prepareStatement("select B_NO,EMP_NO,B_TITLE,EMP_NM,B_CONTENT,POST_DATE,B_VIEW_CNT, store_no, board_pw, store_nm, r "
						+ "from (select B_NO,EMP_NO,B_TITLE,EMP_NM,B_CONTENT,POST_DATE,B_VIEW_CNT,store_no, board_pw, store_nm, rownum r "
						+ "from (select b.b_no B_NO,b.emp_no EMP_NO,b.b_title B_TITLE,b.emp_nm EMP_NM,b.b_content B_CONTENT,b.post_date POST_DATE,b.b_view_cnt B_VIEW_CNT, b.store_no store_no, b.board_pw board_pw, s.store_nm store_nm "
						+ "from board b inner join store_list s on b.store_no = s.store_no where B_TITLE like '%"+condition+"%') order by B_NO desc) where r >= ? and r <= ? ");
				
				/*System.out.println("start::"+start);*/
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					articleList = new ArrayList(end);
					do {
						BoardDataBean article = new BoardDataBean();

						article.setB_no(rs.getInt("b_no"));
						article.setEmp_no(rs.getInt("emp_no"));
						article.setB_title(rs.getString("b_title"));
						article.setEmp_nm(rs.getString("emp_nm"));
						article.setB_content(rs.getString("b_content"));
						article.setPost_date(rs.getString("post_date"));
						article.setB_view_cnt(rs.getInt("b_view_cnt"));
						article.setStore_no(rs.getInt("store_no"));
						article.setBoard_pw(rs.getString("board_pw"));
						article.setStore_nm(rs.getString("store_nm"));
						articleList.add(article);
					} while (rs.next());
				}
			} else if (opt.equals("C")) {
				conn = getConnection();
				pstmt = conn.prepareStatement("select B_NO,EMP_NO,B_TITLE,EMP_NM,B_CONTENT,POST_DATE,B_VIEW_CNT, store_no, board_pw, store_nm,r "
						+ "from (select B_NO,EMP_NO,B_TITLE,EMP_NM,B_CONTENT,POST_DATE,B_VIEW_CNT, store_no, board_pw, store_nm, rownum r "
						+ "from (select b.b_no B_NO,b.emp_no EMP_NO,b.b_title B_TITLE,b.emp_nm EMP_NM,b.b_content B_CONTENT,b.post_date POST_DATE,b.b_view_cnt B_VIEW_CNT, b.store_no store_no, b.board_pw board_pw, s.store_nm store_nm "
						+ "from board b inner join store_list s on b.store_no = s.store_no where B_CONTENT like '%"+condition+"%') order by B_NO desc) where r >= ? and r <= ? ");
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					articleList = new ArrayList(end);
					do {
						BoardDataBean article = new BoardDataBean();

						article.setB_no(rs.getInt("b_no"));
						article.setEmp_no(rs.getInt("emp_no"));
						article.setB_title(rs.getString("b_title"));
						article.setEmp_nm(rs.getString("emp_nm"));
						article.setB_content(rs.getString("b_content"));
						article.setPost_date(rs.getString("post_date"));
						article.setB_view_cnt(rs.getInt("b_view_cnt"));
						article.setStore_no(rs.getInt("store_no"));
						article.setBoard_pw(rs.getString("board_pw"));
						article.setStore_nm(rs.getString("store_nm"));
						articleList.add(article);
					} while (rs.next());
				}

			}else if (opt.equals("A")) {
				conn = getConnection();
				pstmt = conn.prepareStatement("select B_NO,EMP_NO,B_TITLE,EMP_NM,B_CONTENT,POST_DATE,B_VIEW_CNT, store_no, board_pw, store_nm,r "
						+ "from (select B_NO,EMP_NO,B_TITLE,EMP_NM,B_CONTENT,POST_DATE,B_VIEW_CNT, store_no, board_pw, store_nm, rownum r "
						+ "from (select b.b_no B_NO,b.emp_no EMP_NO,b.b_title B_TITLE,b.emp_nm EMP_NM,b.b_content B_CONTENT,b.post_date POST_DATE,b.b_view_cnt B_VIEW_CNT, b.store_no store_no, b.board_pw board_pw, s.store_nm store_nm "
						+ "from board b inner join store_list s on b.store_no = s.store_no where B_CONTENT like '%"+condition+"%' and b_title like '%"+condition+"%') order by B_NO desc) where r >= ? and r <= ? ");
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					articleList = new ArrayList(end);
					do {
						BoardDataBean article = new BoardDataBean();

						article.setB_no(rs.getInt("b_no"));
						article.setEmp_no(rs.getInt("emp_no"));
						article.setB_title(rs.getString("b_title"));
						article.setEmp_nm(rs.getString("emp_nm"));
						article.setB_content(rs.getString("b_content"));
						article.setPost_date(rs.getString("post_date"));
						article.setB_view_cnt(rs.getInt("b_view_cnt"));
						article.setStore_no(rs.getInt("store_no"));
						article.setBoard_pw(rs.getString("board_pw"));
						article.setStore_nm(rs.getString("store_nm"));
						articleList.add(article);
					} while (rs.next());
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return articleList;
	}

	@SuppressWarnings({ "null", "resource" })
	public BoardDataBean getArticle(int bno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("update board set B_VIEW_CNT=B_VIEW_CNT+1 where b_no = ?");
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement("select * from board where b_no = ?");
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				article.setB_no(rs.getInt("b_no"));
				article.setEmp_no(rs.getInt("emp_no"));
				article.setB_title(rs.getString("b_title"));
				article.setEmp_nm(rs.getString("emp_nm"));
				article.setB_content(rs.getString("b_content"));
				article.setPost_date(rs.getString("post_date"));
				article.setB_view_cnt(rs.getInt("b_view_cnt"));
				article.setStore_no(rs.getInt("store_no"));
				article.setBoard_pw(rs.getString("board_pw"));
				article.setStore_nm(rs.getString("store_no"));

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return article;
	}

	// updateForm.jsp : 수정폼에 한줄의 데이터를 가져올때.
	@SuppressWarnings("null")
	public BoardDataBean updateGetArticle(int bno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from board b inner join store_list s on b.store_no= s.store_no where b_no = ?");
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				article = new BoardDataBean();
				article.setB_no(rs.getInt("b_no"));
				article.setEmp_no(rs.getInt("emp_no"));
				article.setB_title(rs.getString("b_title"));
				article.setEmp_nm(rs.getString("emp_nm"));
				article.setB_content(rs.getString("b_content"));
				article.setPost_date(rs.getString("post_date"));
				article.setB_view_cnt(rs.getInt("b_view_cnt"));
				article.setStore_no(rs.getInt("store_no"));
				article.setBoard_pw(rs.getString("board_pw"));
				article.setStore_nm(rs.getString("store_nm"));

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return article;
	}

	// updatePro.jsp : 실제 데이터를 수정하는 메소드.
	@SuppressWarnings("resource")
	public int updateArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpasswd = "";
		String sql = "";
		int x = -1;
		try {
			conn = getConnection();
			System.out.println("----------디비빈------------");
			System.out.println(article.getB_no());

			pstmt = conn.prepareStatement("select board_pw from board where b_no = ?");
			pstmt.setInt(1, article.getB_no());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("board_pw");

				if (dbpasswd.equals(article.getBoard_pw())) {

					sql = "update board set B_TITLE=?,B_CONTENT=?";
					sql += "where b_no=?";
					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, article.getB_title());
					pstmt.setString(2, article.getB_content());
					pstmt.setInt(3, article.getB_no());
					pstmt.executeUpdate();

					x = 1;
				} else {
					x = 0;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// deletePro.jsp : 실제 데이터를 삭제하는 메소드...
	public int deleteArticle(int bno, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select board_pw from board where b_no = ?");
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("board_pw");
				if (dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement("delete from board where b_no=?");
					pstmt.setInt(1, bno);
					pstmt.executeUpdate();
					x = 1; // 글삭제 성공
				} else
					x = 0; // 비밀번호 틀림
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}
}
