package list;

import java.sql.*;

import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class ListDBBean {
	// 미리 객체를 생성해놓음 private 를 통해서 접근허용 x
	private static ListDBBean instance = new ListDBBean();

	// 싱글턴패턴을 사용하기 위해 해당 메서드로 접근해서 사용하도록함
	public static ListDBBean getInstance() {
		return instance; // 객체를 리턴함
	}

	private ListDBBean() {

	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}

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

	public int getArticleCount(int searchn, String search, int iSortValue, int iCateName, int iminSal, int imaxSal, int floor_no) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		System.out.println("searchn::"+searchn);
		System.out.println("search::"+search);
		System.out.println("iSortValue::"+iSortValue);
		System.out.println("iCateName::"+iCateName);
		System.out.println("iminSal::"+iminSal);
		System.out.println("imaxSal::"+imaxSal);
		System.out.println("floor_no::"+floor_no);
		System.out.println("==========================");
		// 음식 , 가게명, 층별
		String[] column_name = {"store_info", "store_nm"};
		String[] column_name1 = { "avg_price", "avg_price", "preference", "avl_tbl_cnt" };
		String[] column_name2 = { "'한식'", "'양식'", "'중식'", "'일식'" };
		int x = 0;
		int check = 0;
		
		String sql ="";
		
		try {
			conn = getConnection();
			
			if(search != "" && searchn !=0 && iSortValue != -1 && iCateName != -1 && iminSal != -1 && imaxSal != -1 && floor_no != -1) { // 파라미터값이 전부 존재하는 경우
				sql = "select count(*) from store_list where " + column_name[searchn] + " like '%" + search + "%' and avg_price>=? and avg_price<=? and cate_nm="+column_name2[iCateName]+" and store_floor="+floor_no+" order by "+column_name1[iSortValue]+" desc";
				check = 1;
			}else if(search != "" && searchn !=0 && iSortValue != -1 && iCateName != -1 && iminSal != -1 && imaxSal != -1) { // 층을 제외한 나머지파라미터가 있는경우의  검색 데이터 개수
				sql = "select count(*) from store_list where " + column_name[searchn] + " like '%" + search + "%' and avg_price>=? and avg_price<=? and cate_nm="+column_name2[iCateName]+" order by "+column_name1[iSortValue]+" desc";
				check = 1;
			}else if(search != "" && searchn !=0 && iSortValue != -1 && iCateName != -1) {// 검색 + 정렬 + 음식종류
				sql = "select count(*) from store_list where " + column_name[searchn] + " like '%" + search + "%' and cate_nm="+column_name2[iCateName]+" order by "+column_name1[iSortValue]+" desc";
			}else if(search != "" && searchn !=0 && iSortValue != -1 ) {
				sql = "select count(*) from store_list where " + column_name[searchn] + " like '%" + search + "%' order by "+column_name1[iSortValue]+" desc";
			}else{
				System.out.println("여기도는지 꼭확인");
				sql = "select count(*) from store_list";
			}
			
			pstmt = conn.prepareStatement(sql);
			
			if(check == 1) { // 가격 정렬인경우 여길 돌아야함 
				pstmt.setInt(1, iminSal);
				pstmt.setInt(2, imaxSal);
			}
			
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

	public List getArticles(int start, int end, int searhn, String searchKeyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		// 음식 , 가게명
		String[] column_name = { "store_info", "store_nm"};

		try {
			conn = getConnection();

			String sql = "select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,rownum r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm "
					+ "from store_list order by avl_tbl_cnt desc) where " + column_name[searhn] + " like '%" + searchKeyword
					+ "%' order by avl_tbl_cnt desc ) where r >= ? and r <= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);

				do {
					ListDataBean article = new ListDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));

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
		String[] column_name = { "avg_price", "avg_price", "preference", "avl_tbl_cnt" };
		
		try {
			conn = getConnection();

			if (selectValue == 1) {// 낮은가격순 정렬인 경우 정렬을 오름차순으로 해야하므로
				sql = "select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,r "
						+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,rownum r "
						+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm "
						+ "from store_list order by avl_tbl_cnt desc) order by avl_tbl_cnt ) order by "
						+ column_name[selectValue] + " asc";
			} else {
				sql = "select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,r "
						+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,rownum r "
						+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm "
						+ "from store_list order by avl_tbl_cnt desc) order by avl_tbl_cnt ) order by "
						+ column_name[selectValue] + " desc";
			}
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);

				do {
					ListDataBean article = new ListDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));

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

			sql = "select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,rownum r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm "
					+ "from store_list order by avl_tbl_cnt desc) order by avl_tbl_cnt ) where cate_nm="
					+ column_name[cate_nm];

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(10);

				do {
					ListDataBean article = new ListDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));

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

			String sql = "select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,rownum r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm "
					+ "from store_list order by avl_tbl_cnt desc) where avg_price>=? and avg_price<=?) where r >= ? and r <= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iminSal);
			pstmt.setInt(2, imaxSal);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);

				do {
					ListDataBean article = new ListDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));

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
	
	// 층별 정렬 기능 메서드
	public List getFloor(int floor_no) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;

		try {
			conn = getConnection();

			String sql = "select * from store_list where store_floor="+floor_no;

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(10);

				do {
					ListDataBean article = new ListDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));

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
	
	public List getArticlesCateSal(int iCateName,int iminSal,int imaxSal) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String[] column_name = { "'한식'", "'양식'", "'중식'", "'일식'" };
		
		try {
			conn = getConnection();

			String sql = "select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,rownum r "
					+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm "
					+ "from store_list order by avl_tbl_cnt desc) where avg_price>=? and avg_price<=? and cate_nm="+column_name[iCateName]+") where r >= ? and r <= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iminSal);
			pstmt.setInt(2, imaxSal);
			pstmt.setInt(3, 1);
			pstmt.setInt(4, 10);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(10);

				do {
					ListDataBean article = new ListDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));

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

	public List getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;

		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,r "
							+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm,rownum r "
							+ "from (select store_no,emp_no,cate_nm,store_nm,store_exp,store_floor,store_tel,store_info,store_exp_dt,tot_tbl_cnt,avl_tbl_cnt,store_url,simg_root,avg_price,preference,cur_tbl_cnt,pimg_root,emp_nm "
							+ "from store_list order by avl_tbl_cnt desc) order by avl_tbl_cnt ) where r >= ? and r <= ?"); // 한페이지
																															// (11~20)
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);
				do {
					ListDataBean article = new ListDataBean();
					
					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));

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

	// 리스트에서 목록 선택시 관련 정보를 뿌려주기 위한 검색 메서드 ( store_no 와 관련된 모든 데이터를 셀렉트 )
	public List getInfo(int store_no) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(
					"select * from store_list s,preorder p where s.store_no=p.store_no and s.store_no=?");
			pstmt.setInt(1, store_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				articleList = new ArrayList(20);// end 자리에 10을 가라로 넣어둠
				do {
					ListDataBean article = new ListDataBean();
					
					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));
					
					// 메뉴관련정보
					article.setMenu_no(rs.getInt("menu_no"));
					article.setMenu_nm(rs.getString("menu_nm"));
					article.setMenu_price(rs.getInt("menu_price"));
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

	public List getAllData() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(
					"select * from store_list");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				articleList = new ArrayList(20);// end 자리에 10을 가라로 넣어둠
				do {
					ListDataBean article = new ListDataBean();
					
					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));
					
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
	public List getTotalArticles(String search,int searchn,int isortValue) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql ="";
		String[] column_name = { "store_info", "store_nm"};
		
		String[] column_name2 = { "avg_price", "avg_price", "preference", "avl_tbl_cnt" };
				
		try {
			conn = getConnection();

			if(isortValue == 1) {
				sql = "select * from store_list where "+column_name[searchn]+" like '%" + search
						+ "%' order by " + column_name2[isortValue] +" asc";
			}else {
				sql = "select * from store_list where "+column_name[searchn]+" like '%" + search
						+ "%' order by " + column_name2[isortValue] +" desc";
			}

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList();

				do {
					ListDataBean article = new ListDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setEmp_nm(rs.getString("emp_nm"));
				
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
	
	public List getTotalArticlesLeftCheck(String search,int searchn,int iCateName) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql ="";
		String[] column_name = { "store_info", "store_nm"};
		
		String[] column_name2 = { "'한식'", "'양식'", "'중식'", "'일식'" };
				
		try {
			conn = getConnection();

			sql = "select * from store_list where "+column_name[searchn]+" like '%" + search
						+ "%' and cate_nm="+column_name2[iCateName];

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList();

				do {
					ListDataBean article = new ListDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setEmp_nm(rs.getString("emp_nm"));
				
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
	
	// 전체검색
	public List getAllArticles(String search, int searchn, int iSortValue, int iCateName, int iminSal, int imaxSal, int floor_no) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql ="";

		String[] column_name = {"store_info", "store_nm"};
		String[] column_name1 = { "avg_price", "avg_price", "preference", "avl_tbl_cnt" };
		String[] column_name2 = { "'한식'", "'양식'", "'중식'", "'일식'" };
		
		try {
			conn = getConnection();
			
			sql = "select * from store_list where "+column_name[searchn]+" like '%" + search
					+ "%' and cate_nm="+column_name2[iCateName]+" and store_floor="+floor_no;
			
			if(iSortValue == 1) {
				sql = "select * from store_list where "+column_name[searchn]+" like '%" + search
						+ "%' and cate_nm="+column_name2[iCateName]+" and avg_price >="+iminSal+" and avg_price <="+imaxSal+" and store_floor="+floor_no+" order by " + column_name1[iSortValue] +" asc";
			}else {
				sql = "select * from store_list where "+column_name[searchn]+" like '%" + search 
						+ "%' and cate_nm="+column_name2[iCateName]+" and avg_price >="+iminSal+" and avg_price <="+imaxSal+" and store_floor="+floor_no+" order by " + column_name1[iSortValue] +" desc";
			}
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				articleList = new ArrayList();
				
				do {
					ListDataBean article = new ListDataBean();
					
					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setEmp_nm(rs.getString("emp_nm"));
					
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
	
	//  가격검색 + 음식종류 + 검색어 
	public List getSearchFoodSal(String search, int searchn, int iCateName, int iminSal, int imaxSal, int floor_no) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql="";

		String[] column_name = {"store_info", "store_nm"};
		String[] column_name1 = { "'한식'", "'양식'", "'중식'", "'일식'" };
		try {
			conn = getConnection();
			
			if(floor_no== -1) {
				sql = "select * from store_list where "+column_name[searchn]+" like '%"+search+"%' and cate_nm="+column_name1[iCateName]+" and  avg_price>=? and avg_price<=?";
			}else {
				sql = "select * from store_list where "+column_name[searchn]+" like '%"+search+"%' and cate_nm="+column_name1[iCateName]+" and  avg_price>=? and avg_price<=? and store_floor="+floor_no;
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iminSal);
			pstmt.setInt(2, imaxSal);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(10);

				do {
					ListDataBean article = new ListDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));

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
	
	// 가격검색 + 검색어 
	public List getSearchSal(String search, int searchn, int iminSal, int imaxSal) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		
		String[] column_name = {"store_info", "store_nm"};
		try {
			conn = getConnection();
			
			String sql = "select * from store_list where "+column_name[searchn]+" like '%"+search+"%' and avg_price>=? and avg_price<=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iminSal);
			pstmt.setInt(2, imaxSal);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				articleList = new ArrayList(10);
				
				do {
					ListDataBean article = new ListDataBean();
					
					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));
					
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
	
	// 음식종류 + 검색어
	public List getSearchFood(String search, int searchn, int iCateName) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;

		String[] column_name = {"store_info", "store_nm"};
		String[] column_name1 = { "'한식'", "'양식'", "'중식'", "'일식'" };
		try {
			conn = getConnection();

			String sql = "select * from store_list where "+column_name[searchn]+" like '%"+search+"%' and cate_nm="+column_name1[iCateName];

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(10);

				do {
					ListDataBean article = new ListDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setEmp_nm(rs.getString("emp_nm"));

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
	
	// 좌측 음식종류별 선택시 정렬하기위함
	public List getTotalArticles2(int iSortValue,int iCateName) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql ="";
		String[] column_name = { "'한식'", "'양식'", "'중식'", "'일식'" };
		
		String[] column_name2 = { "avg_price", "avg_price", "preference", "avl_tbl_cnt" };
				
		try {
			conn = getConnection();

			if(iSortValue == 1) {
				sql = "select * from store_list where cate_nm="+column_name[iCateName]+" order by "+ column_name2[iSortValue] +" asc";
			}else {
				sql = "select * from store_list where cate_nm="+column_name[iCateName]+" order by "+ column_name2[iSortValue] +" desc";
			}

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList();

				do {
					ListDataBean article = new ListDataBean();

					article.setStore_no(rs.getInt("store_no"));
					article.setEmp_no(rs.getInt("emp_no"));
					article.setCate_nm(rs.getString("cate_nm"));
					article.setStore_nm(rs.getString("store_nm"));
					article.setStore_exp(rs.getString("store_exp"));
					article.setStore_floor(rs.getString("store_floor"));
					article.setStore_tel(rs.getString("store_tel"));
					article.setStore_info(rs.getString("store_info"));
					article.setStore_exp_dt(rs.getString("store_exp_dt"));
					article.setTot_tbl_cnt(rs.getInt("tot_tbl_cnt"));
					article.setAvl_tbl_cnt(rs.getInt("avl_tbl_cnt"));
					article.setStore_url(rs.getString("store_url"));
					article.setSimg_root(rs.getString("simg_root"));
					article.setPimg_root(rs.getString("pimg_root"));
					article.setCur_tbl_cnt(rs.getInt("cur_tbl_cnt"));
					article.setAvg_price(rs.getInt("avg_price"));
					article.setPreference(rs.getInt("preference"));
					article.setEmp_nm(rs.getString("emp_nm"));
				
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
}
