package review;

import java.sql.*;
import javax.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import review.ReviewDataBean;

import javax.naming.*;
import java.util.*;

//ReviewDBBean bd = ReviewDBBean.getInstance()
public class ReviewDBBean {
	private static ReviewDBBean instance = new ReviewDBBean();

	public static ReviewDBBean getInstance() {
		return instance;
	}

	private ReviewDBBean() {
	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}

	public void insert(ReviewDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = article.getRvno();
		int number = 0;
		String sql = "";
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select max(rv_no) from review");
			rs = pstmt.executeQuery();

			if (rs.next())
				number = rs.getInt(1) + 1;
			else
				number = 1;

			sql = "insert into review(rv_no, store_no, mem_nm, store_nm, visit_date, rv_title, rv_content, like_cnt, r_view_cnt)\r\n"
					+ "value (RV_NO.NEXTVAL,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article.getStoreno());
			pstmt.setString(3, article.getMemnm());
			pstmt.setString(3, article.getStorenm());
			pstmt.setString(4, article.getVisitdate());
			pstmt.setString(5, article.getRvtitle());
			pstmt.setString(6, article.getRvcontent());
			pstmt.setInt(7, article.getLikecnt());
			pstmt.setInt(8, article.getRviewcnt());
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

	public List<ReviewDataBean> selectList(int firstRow, int endRow) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = "";
		try {
			sql = "select rv_no, store_no, mem_nm, store_nm, visit_date, rv_title, rv_content, like_cnt, r_view_cnt "
					+ "from (select rownum rnum, rv_no, store_no, mem_nm, store_nm, visit_date, rv_title, rv_content, like_cnt, r_view_cnt "
					+ "from (select * from review m order by m.mem_nm desc) " + "where rownum <= 2) where rnum >= 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				articleList = new ArrayList(endRow);
				do {
					ReviewDataBean article = new ReviewDataBean();
					article.setRvno(rs.getInt("rv_no"));
					article.setStoreno(rs.getInt("store_no"));
					article.setMemnm(rs.getString("mem_nm"));
					article.setStorenm(rs.getString("store_nm"));
					article.setVisitdate(rs.getString("visit_date"));
					article.setRvtitle(rs.getString("rv_title"));
					article.setRvcontent(rs.getString("rv_content"));
					article.setLikecnt(rs.getInt("like_cnt"));
					article.setRviewcnt(rs.getInt("r_view_cnt"));
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
