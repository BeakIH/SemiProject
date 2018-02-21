package reserve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import reserve.ReserveDBBean;
import reserve.StoreDataBean;

public class ReserveDBBean {
	private static ReserveDBBean instance = new ReserveDBBean();

	// 싱글턴패턴을 사용하기 위해 해당 메서드로 접근해서 사용하도록함
	public static ReserveDBBean getInstance() {
		return instance; // 객체를 리턴함
	}

	private ReserveDBBean() {

	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}


	// 리스트에서 목록 선택시 관련 정보를 뿌려주기 위한 검색 메서드
		public List getInfo(int store_no, String dept) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			Connection connSub = null;
			PreparedStatement pstmtSub = null;
			ResultSet rsSub = null;
			
			List<StoreDataBean> articleList  = new ArrayList();
			

			try {
				conn = getConnection();
				if(dept == "all") {
					pstmt = conn.prepareStatement(
							"select * from store_list");
				}else {
					pstmt = conn.prepareStatement(
						"select * from store_list where store_no = ?");
					pstmt.setInt(1, store_no);
				}
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					
					do {
						StoreDataBean article = new StoreDataBean();
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
//						// 메뉴관련정보
//						article.setMenu_no(rs.getInt("menu_no"));
//						article.setMenu_nm1(rs.getString("menu_nm1"));
//						article.setMenu_nm1_sal(rs.getInt("menu_nm1_sal"));
//						article.setMenu_nm2(rs.getString("menu_nm2"));
//						article.setMenu_nm2_sal(rs.getInt("menu_nm2_sal"));
						List<MenuDataBean> menuList = new ArrayList<MenuDataBean>();
						connSub = getConnection();
						pstmtSub = connSub.prepareStatement(
								"SELECT menu_no, store_no, cate_nm, menu_nm, menu_price FROM preorder where store_no = ?");
						pstmtSub.setInt(1, rs.getInt("store_no"));
						rsSub = pstmtSub.executeQuery();
						
						if (rsSub.next()) {
							
							do {
								MenuDataBean menu = new MenuDataBean();
								menu.setMenu_no(rsSub.getInt("menu_no"));
								menu.setStore_no(rsSub.getInt("store_no"));
								menu.setCate_nm(rsSub.getString("cate_nm"));
								menu.setMenu_nm(rsSub.getString("menu_nm"));
								menu.setMenu_price(rsSub.getInt("menu_price"));
								
								menuList.add(menu);
								
							} while (rsSub.next());
						}
						article.setMenuList(menuList);
						
						if (rsSub != null)
							try {
								rsSub.close();
							} catch (SQLException ex) {
							}
						if (pstmtSub != null)
							try {
								pstmtSub.close();
							} catch (SQLException ex) {
							}
						if (connSub != null)
							try {
								connSub.close();
							} catch (SQLException ex) {
							}
						
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
}
