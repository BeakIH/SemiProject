package board;

import java.sql.*; 

import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class BoardDBBean {
	// 미리 객체를 생성해놓음 private 를 통해서 접근허용 x
	private static BoardDBBean instance = new BoardDBBean();

	// 싱글턴패턴을 사용하기 위해 해당 메서드로 접근해서 사용하도록함
	public static BoardDBBean getInstance() {
		return instance; // 객체를 리턴함
	}

	private BoardDBBean() {

	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}

	// writePro.jsp 정보를 담고있는 article 객체를 매개변수로 받음
	/*
	 * public void insertArticle(BoardDataBean article) throws Exception {
	 * Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * // 답변글인지 일반글인지를 구분해서 입력시켜주는 로직 !!! int num = article.getNum(); int ref =
	 * article.getRef(); int re_step = article.getRe_step(); int re_level =
	 * article.getRe_level(); int number = 0;
	 * 
	 * String sql = "";
	 * 
	 * try { conn = getConnection();
	 * 
	 * // 마지막 글번호를 구함 ( 다음 쓰여질글은 마지막글번호+1 이므로 ) pstmt =
	 * conn.prepareStatement("select max(store_no) from store_list"); rs =
	 * pstmt.executeQuery();
	 * 
	 * if (rs.next()) { number = rs.getInt(1) + 1;// 위의 쿼리문을 통해서 구한 마지막 글번호의 값에 +1 한
	 * 값을 number에 저장 => 다음쓰여질글의 번호가 되야하므로 } else { number = 1; }
	 * 
	 * if (num != 0) { sql =
	 * "update store_list set re_step=re_step+1 where ref=? and re_step>?"; pstmt =
	 * conn.prepareStatement(sql); pstmt.setInt(1, ref); pstmt.setInt(2, re_step);
	 * pstmt.executeUpdate(); re_step = re_step + 1; re_level = re_level + 1; } else
	 * { ref = number; re_step = 0; re_level = 0; }
	 * 
	 * // 쿼리를 작성 sql =
	 * "insert into store_list(store_no,rv_no,menu_no,store_nm,store_exp,store_plc,"
	 * ; sql +=
	 * "store_tel,cate_nm,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt) values(?,?,?,?,?,?,?,?,?,?,?,?)"
	 * ;
	 * 
	 * pstmt = conn.prepareStatement(sql); pstmt.setInt(1, article.getStore_no());
	 * pstmt.setInt(2, article.getRv_no()); pstmt.setInt(3, article.getMenu_no());
	 * pstmt.setString(4, article.getStore_nm()); pstmt.setString(5,
	 * article.getStore_exp()); pstmt.setString(6, article.getStore_plc());
	 * pstmt.setString(7, article.getStore_tel()); pstmt.setString(8,
	 * article.getCate_nm()); pstmt.setString(9, article.getStore_info());
	 * pstmt.setString(10, article.getStore_exp_dt()); pstmt.setInt(11,
	 * article.getTot_tbl_cnt()); pstmt.setInt(12, article.getAvl_tbl_cnt());
	 * 
	 * pstmt.executeUpdate();
	 * 
	 * } catch (Exception ex) { ex.printStackTrace(); } finally { if (rs != null)
	 * try { rs.close(); } catch (SQLException ex) { } if (pstmt != null) try {
	 * pstmt.close(); } catch (SQLException ex) { } if (conn != null) try {
	 * conn.close(); } catch (SQLException ex) { } } }
	 */

	// list.jsp : 페이징을 위해서 전체 DB에 입력된 행의 수가 필요
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select count(*) from store_list");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
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

	// 검색을 하기위해 추가한 메서드
	// 검색창인 경우 매개변수가 두개지만 좌측 카테고리나 조회수관련 정렬시 해당 메서드와 같은 타입이지만
	// 매개변수의 개수가 다른 메서드가 더 추가되야함

	// 매개변수 n은 카테고리 선택시 각각의 카테고리가 가진 int 값을 받아오고, 매개변수 searchKeyword 는 유저가 검색한 키워드를
	// 받아온다
	public int getArticleCount(int n, String searchKeyword) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 음식 , 가게명, 층별
		String[] column_name = { "store_info", "store_nm", "store_floor" };
		int x = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select count(*) from store_list where " + column_name[n] + " like '%" + searchKeyword + "%'");

			rs = pstmt.executeQuery();
			if (rs.next())
				x = rs.getInt(1);
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

	// 기준
	// 검사하기위해 추가된 메서드
	//												카테고리,         입력한검색어
	public List getArticles(int start, int end, int searhn, String searchKeyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		// 음식 , 가게명
		String[] column_name = { "store_info", "store_nm", "store_floor" };

		try {
			conn = getConnection();

			// 이부분 생각해봐야함
			// 남은좌석을 내림차순으로 정렬 ( 남은 좌석이 많을수록 위쪽에 보여지도록 )
			String sql = "select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,rownum r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score "
					+ "from store_list order by avl_tbl_cnt desc) where " + column_name[searhn] + " like '%" + searchKeyword
					+ "%' order by avl_tbl_cnt desc ) where r >= ? and r <= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);

				do {
					BoardDataBean article = new BoardDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_owner(rs.getString("store_owner"));
					article.setStore_octime(rs.getString("store_octime"));
					article.setStore_info(rs.getString("Store_info"));
					article.setStore_dinfo(rs.getString("store_dinfo"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setStore_uri(rs.getString("store_uri"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setStore_avgsal(rs.getInt("store_avgsal"));
					article.setStore_score(rs.getInt("store_score"));

					articleList.add(article); //// 여기~~~
				} while (rs.next());
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

	// 셀렉트박스 관련 메서드
	public List getArticles(int start, int end, int selectValue) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = "";
		// 낮은 가격순 미정 if 문 써서 selectValue 값이 2 이면 asc 하도록 하면될듯
		// 여기고치는중~~~~~~~~~~ // 높은가격순, 낮은가격순 , 인기순, 잔여석 순 (맨앞 0번째 인덱스는 빈값)
		String[] column_name = { "store_avgsal", "store_avgsal", "store_score", "avl_tbl_cnt" };

		try {
			conn = getConnection();

			// 이부분 생각해봐야함
			// 남은좌석을 내림차순으로 정렬 ( 남은 좌석이 많을수록 위쪽에 보여지도록 )
			if (selectValue == 1) {// 낮은가격순 정렬인 경우 정렬을 오름차순으로 해야하므로
				sql = "select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,r "
						+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,rownum r "
						+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score "
						+ "from store_list order by avl_tbl_cnt desc) order by avl_tbl_cnt ) order by "
						+ column_name[selectValue] + " asc";
			} else {
				sql = "select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,r "
						+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,rownum r "
						+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score "
						+ "from store_list order by avl_tbl_cnt desc) order by avl_tbl_cnt ) order by "
						+ column_name[selectValue] + " desc";
			}
			// 여기서 sql 한번 찍어봐야함
			pstmt = conn.prepareStatement(sql);
			/*
			 * pstmt.setInt(1, start); pstmt.setInt(2, end);
			 */

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);

				do {
					BoardDataBean article = new BoardDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_owner(rs.getString("store_owner"));
					article.setStore_octime(rs.getString("store_octime"));
					article.setStore_info(rs.getString("Store_info"));
					article.setStore_dinfo(rs.getString("store_dinfo"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setStore_uri(rs.getString("store_uri"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setStore_avgsal(rs.getInt("store_avgsal"));
					article.setStore_score(rs.getInt("store_score"));

					articleList.add(article); //// 여기~~~
				} while (rs.next());
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

	// 셀렉트박스 관련 메서드
	public List getArticles(int cate_nm) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = "";
		String[] column_name = { "'한식'", "'양식'", "'중식'", "'일식'" };

		try {
			conn = getConnection();

			sql = "select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,rownum r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score "
					+ "from store_list order by avl_tbl_cnt desc) order by avl_tbl_cnt ) where cate_nm="
					+ column_name[cate_nm];

			// 여기서 sql 한번 찍어봐야함
			pstmt = conn.prepareStatement(sql);
			/*
			 * pstmt.setInt(1, start); pstmt.setInt(2, end);
			 */

			rs = pstmt.executeQuery();

			if (rs.next()) {
				/* articleList = new ArrayList(end); 매개변수로 start값과 end값을 받아와서 여기줘야함 */
				articleList = new ArrayList(10);

				do {
					BoardDataBean article = new BoardDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_owner(rs.getString("store_owner"));
					article.setStore_octime(rs.getString("store_octime"));
					article.setStore_info(rs.getString("Store_info"));
					article.setStore_dinfo(rs.getString("store_dinfo"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setStore_uri(rs.getString("store_uri"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setStore_avgsal(rs.getInt("store_avgsal"));
					article.setStore_score(rs.getInt("store_score"));

					articleList.add(article); //// 여기~~~
				} while (rs.next());
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

	// 값 입력에 따른 정렬 메서드
	public List getSortSal(int start, int end, int iminSal, int imaxSal) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;

		try {
			conn = getConnection();

			// 이부분 생각해봐야함
			// 남은좌석을 내림차순으로 정렬 ( 남은 좌석이 많을수록 위쪽에 보여지도록 )
			String sql = "select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,rownum r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score "
					+ "from store_list order by avl_tbl_cnt desc) where store_avgsal>=? and store_avgsal<=?) where r >= ? and r <= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iminSal);
			pstmt.setInt(2, imaxSal);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);

				do {
					BoardDataBean article = new BoardDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_owner(rs.getString("store_owner"));
					article.setStore_octime(rs.getString("store_octime"));
					article.setStore_info(rs.getString("Store_info"));
					article.setStore_dinfo(rs.getString("store_dinfo"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setStore_uri(rs.getString("store_uri"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setStore_avgsal(rs.getInt("store_avgsal"));
					article.setStore_score(rs.getInt("store_score"));

					articleList.add(article); //// 여기~~~
				} while (rs.next());
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
	

	// list.jsp ==> Paging!!! DB로부터 여러행을 결과로 받는다.
	public List getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;

		try {
			conn = getConnection();

			// from 절에 select 문이 있는 경우 : 인라인 뷰라고 함
			// where 절에 select 문이 있는 경우 : 서브쿼리라 함
			// select * 로 해도 됨
			// rownum : 가상 번호

			// 여기~~~~~
			pstmt = conn.prepareStatement(
					"select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,r "
							+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score,rownum r "
							+ "from (select store_no,emp_no,cate_nm,store_nm,store_owner,store_octime,store_info,store_dinfo,store_floor,store_tel,tot_tbl_cnt,avl_tbl_cnt,cur_tbl_cnt,store_uri,simg_root,pimg_root,store_avgsal,store_score "
							+ "from store_list order by avl_tbl_cnt desc) order by avl_tbl_cnt ) where r >= ? and r <= ?"); // 한페이지
																															// (11~20)
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_owner(rs.getString("store_owner"));
					article.setStore_octime(rs.getString("store_octime"));
					article.setStore_info(rs.getString("Store_info"));
					article.setStore_dinfo(rs.getString("store_dinfo"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setStore_uri(rs.getString("store_uri"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setStore_avgsal(rs.getInt("store_avgsal"));
					article.setStore_score(rs.getInt("store_score"));

					articleList.add(article);
				} while (rs.next());
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

	// 리스트에서 목록 선택시 관련 정보를 뿌려주기 위한 검색 메서드
	public List getInfo(int store_no) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(
					"select s.store_no,s.emp_no,s.cate_nm,s.store_nm,s.store_owner,s.store_octime,s.store_info,s.store_dinfo,s.store_floor,s.store_tel,s.tot_tbl_cnt,s.avl_tbl_cnt,s.cur_tbl_cnt,s.store_uri,s.simg_root,s.pimg_root,s.store_avgsal,s.store_score,p.menu_no,p.menu_nm1,p.menu_nm1_sal,p.menu_nm2,p.menu_nm2_sal from store_list s inner join preorder p on s.store_no = p.store_no where s.store_no = ?");
			pstmt.setInt(1, store_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				articleList = new ArrayList(20);// end 자리에 10을 가라로 넣어둠
				do {
					BoardDataBean article = new BoardDataBean();
					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_owner(rs.getString("store_owner"));
					article.setStore_octime(rs.getString("store_octime"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_dinfo(rs.getString("store_dinfo"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setStore_uri(rs.getString("store_uri"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setStore_avgsal(rs.getInt("store_avgsal"));
					article.setStore_score(rs.getInt("store_score"));
					
					// 메뉴관련정보
					article.setMenu_no(rs.getInt("menu_no"));
					article.setMenu_nm1(rs.getString("menu_nm1"));
					article.setMenu_nm1_sal(rs.getInt("menu_nm1_sal"));
					article.setMenu_nm2(rs.getString("menu_nm2"));
					article.setMenu_nm2_sal(rs.getInt("menu_nm2_sal"));
					
					articleList.add(article);
					
				} while (rs.next());
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

	// 다중검색 메서드, 하나의 메서드로 모든 검색, 정렬을 대응
	/*public List getTotalArticles(List list) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		List plist = list;// 모든파라미터를 담은 List 객체
		
		try {
			conn = getConnection();

			// 이부분 생각해봐야함
			// 남은좌석을 내림차순으로 정렬 ( 남은 좌석이 많을수록 위쪽에 보여지도록 )
			String sql = "select store_no,rv_no,emp_no,cate_nm,store_nm,store_exp,store_plc,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_uri,img_root,store_avgsal,store_score,r "
					+ "from (select store_no,rv_no,emp_no,cate_nm,store_nm,store_exp,store_plc,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_uri,img_root,store_avgsal,store_score,rownum r "
					+ "from (select store_no,rv_no,emp_no,cate_nm,store_nm,store_exp,store_plc,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_uri,img_root,store_avgsal,store_score "
					+ "from store_list order by avl_tbl_cnt desc) where store_avgsal>=? and store_avgsal<=?) where r >= ? and r <= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iminSal);
			pstmt.setInt(2, imaxSal);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);

				do {
					BoardDataBean article = new BoardDataBean();

					article.setStore_no(rs.getInt("Store_no"));
					article.setRv_no(rs.getInt("Rv_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("Cate_nm"));
					article.setStore_nm(rs.getString("Store_nm"));
					article.setStore_exp(rs.getString("Store_exp"));
					article.setStore_plc(rs.getString("Store_plc"));
					article.setStore_tel(rs.getString("Store_tel"));
					article.setStore_info(rs.getString("Store_info"));
					article.setStore_exp_dt(rs.getString("Store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("Tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("Avl_tbl_cnt"));
					article.setStore_uri(rs.getString("store_uri"));
					article.setImg_root(rs.getString("img_root"));
					article.setStore_avgsal(rs.getInt("store_avgsal"));
					article.setStore_score(rs.getInt("store_score"));

					articleList.add(article); //// 여기~~~
				} while (rs.next());
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
	}*/
	///////////////////
	
	
	// read.jsp : DB 로부터 한줄의 데이터를 가져온다.
	/*
	 * public BoardDataBean getArticle(int num) throws Exception{ Connection conn =
	 * null; PreparedStatement pstmt = null; ResultSet rs = null; BoardDataBean
	 * article = null; try { conn = getConnection();
	 * 
	 * pstmt = conn.prepareStatement(
	 * "update board set readcount=readcount+1 where num=?"); pstmt.setInt(1, num);
	 * pstmt.executeUpdate();
	 * 
	 * pstmt = conn.prepareStatement( "select * from board where num = ?");
	 * pstmt.setInt(1, num); rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()) { article = new BoardDataBean();
	 * article.setNum(rs.getInt("num")); article.setWriter(rs.getString("writer"));
	 * article.setEmail(rs.getString("email"));
	 * article.setSubject(rs.getString("subject"));
	 * article.setPasswd(rs.getString("passwd"));
	 * article.setReg_date(rs.getTimestamp("reg_date"));
	 * article.setReadcount(rs.getInt("readcount"));
	 * article.setRef(rs.getInt("ref")); article.setRe_step(rs.getInt("re_step"));
	 * article.setRe_level(rs.getInt("re_level"));
	 * article.setContent(rs.getString("content"));
	 * article.setIp(rs.getString("ip")); article.setRoot(rs.getString("root")); }
	 * }catch(Exception ex) { ex.printStackTrace(); }finally { if(rs != null) try
	 * {rs.close();} catch(SQLException ex) {} if(pstmt != null) try
	 * {pstmt.close();} catch(SQLException ex) {} if(conn != null) try
	 * {conn.close();} catch(SQLException ex) {} } return article; }
	 */

	// updateForm.jsp : 수정폼에 한줄의 데이터를 가져올때

	/*
	 * public BoardDataBean updateGetArticle(int num) throws Exception{ Connection
	 * conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
	 * BoardDataBean article = null; try { conn = getConnection();
	 * 
	 * pstmt = conn.prepareStatement( "select * from board where num = ?");
	 * pstmt.setInt(1, num); rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()) { article = new BoardDataBean();
	 * article.setNum(rs.getInt("num")); article.setWriter(rs.getString("writer"));
	 * article.setEmail(rs.getString("email"));
	 * article.setSubject(rs.getString("subject"));
	 * article.setPasswd(rs.getString("passwd"));
	 * article.setReg_date(rs.getTimestamp("reg_date"));
	 * article.setReadcount(rs.getInt("ref"));
	 * article.setRe_step(rs.getInt("re_step"));
	 * article.setRe_level(rs.getInt("re_level"));
	 * article.setContent(rs.getString("content"));
	 * article.setIp(rs.getString("ip")); article.setRoot(rs.getString("root")); }
	 * }catch(Exception ex) { ex.printStackTrace(); }finally { if (rs != null) try {
	 * rs.close();} catch(SQLException ex) {} if (pstmt != null) try {
	 * pstmt.close();} catch(SQLException ex) {} if (conn != null) try {
	 * conn.close();} catch(SQLException ex) {} } return article; }
	 */

	/*
	 * //updatePro.jsp : 실제 데이터를 수정하는 메서드 public int updateArticle(BoardDataBean
	 * article) throws Exception{ Connection conn = null; PreparedStatement pstmt =
	 * null; ResultSet rs = null;
	 * 
	 * String dbpasswd = ""; String sql = ""; int x = -1;
	 * 
	 * try { conn = getConnection();
	 * 
	 * pstmt = conn.prepareStatement( "select passwd from board where num = ?");
	 * pstmt.setInt(1, article.getNum()); rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()) { dbpasswd = rs.getString("passwd"); //수정시에는 굳이 모든 컬럼을 다 변경할 필요
	 * x if(dbpasswd.equals(article.getPasswd())) {
	 * sql="update board set writer=?,email=?,subject=?,passwd=?";
	 * sql+=",content=? where num=?"; pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setString(1, article.getWriter()); pstmt.setString(2,
	 * article.getEmail()); pstmt.setString(3, article.getSubject());
	 * pstmt.setString(4, article.getPasswd()); pstmt.setString(5,
	 * article.getContent()); pstmt.setInt(6, article.getNum());
	 * pstmt.executeUpdate();
	 * 
	 * x=1; }else { x=0; } } }catch(Exception ex) { ex.printStackTrace(); }finally {
	 * if (rs != null) try { rs.close(); } catch(SQLException ex) {} if (pstmt !=
	 * null) try { pstmt.close(); } catch(SQLException ex) {} if (conn != null) try
	 * { conn.close(); } catch(SQLException ex) {} } return x; }
	 */

	/*
	 * // deletePro.jsp : 실제 데이터를 삭제하는 메서드 public int deleteArticle(int num, String
	 * passwd) throws Exception{ Connection conn = null; PreparedStatement pstmt =
	 * null; ResultSet rs = null; String dbpasswd =""; int x=-1; try { conn =
	 * getConnection();
	 * 
	 * pstmt = conn.prepareStatement( "select passwd from board where num = ?");
	 * pstmt.setInt(1, num); rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()) { dbpasswd = rs.getString("passwd");
	 * if(dbpasswd.equals(passwd)) { pstmt = conn.prepareStatement(
	 * "delete from board where num=?"); pstmt.setInt(1, num);
	 * pstmt.executeUpdate(); x=1; // 글삭제 성공 }else x=0; // 비밀번호 틀린 경우 }
	 * }catch(Exception ex) { ex.printStackTrace(); }finally { if (rs != null) try {
	 * rs.close(); } catch(SQLException ex) {} if (pstmt != null) try {
	 * pstmt.close(); } catch(SQLException ex) {} if (conn != null) try {
	 * conn.close(); } catch(SQLException ex) {} } return x; }
	 */
}
