package emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import store.list.JdbcUtil;

public class EmpDBBean {
	private static EmpDBBean instance = new EmpDBBean();

	public static EmpDBBean getInstance() {
		return instance;
	}

	public EmpDBBean() {
	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}

	public ArrayList<EmpDataBean> getEmpList() {
		ArrayList<EmpDataBean> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select empno, empNm, storeNo, position, admYn, empStatus from store_list ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			conn.setAutoCommit(false);
			list = new ArrayList<EmpDataBean>();
			while (rs.next()) {
				
				EmpDataBean dto = new EmpDataBean();
				list.add(dto);
			}
			conn.commit();
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public EmpDataBean get(int i) {
		return null;
	}
}
