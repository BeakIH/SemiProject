package emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import emp.EmpDataBean;

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

	public ArrayList<EmpDataBean> getEmpList(int storeNo) throws Exception {
		ArrayList<EmpDataBean> list = new ArrayList<EmpDataBean>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			String sql = "select * from emp1 where store_No = ? order by emp_no";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, storeNo);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {

				EmpDataBean dto = new EmpDataBean();

				dto.setEmpNo(rs.getInt("emp_No"));
				dto.setEmpNm(rs.getString("emp_Nm"));
				dto.setStoreNo(rs.getInt("store_No"));
				dto.setPosition(rs.getString("position"));
				dto.setAdmYn(rs.getString("adm_Yn"));
				dto.setEmpStatus(rs.getString("emp_Status"));

				list.add(dto);
			}
			
			conn.commit();
			conn.setAutoCommit(true);
			
		} catch (ClassNotFoundException | SQLException sqle) {
			conn.rollback();
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

	// 직원 추가를 위한 메소드
	public void insertEmp(EmpDataBean emp) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("insert into emp1 values (seq.nextval, ?, ?, ?, 0, 1)");
			pstmt.setString(1, emp.getEmpNm());
			pstmt.setInt(2, emp.getStoreNo());
			pstmt.setString(3, emp.getPosition());
			
			pstmt.executeUpdate();
			conn.commit();
			conn.setAutoCommit(true);

		} catch (ClassNotFoundException | SQLException sqle) {
			conn.rollback();
		} finally {
			try {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public EmpDataBean getData(int storeNo) throws Exception {
		EmpDataBean dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			String sql = "select * from emp1 where store_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, storeNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new EmpDataBean();
				dto.setEmpNm(rs.getString("empNm"));
				dto.setPosition(rs.getString("position"));
			}

			conn.commit();
			conn.setAutoCommit(true);

		} catch (ClassNotFoundException | SQLException sqle) {
			conn.rollback();
		} finally {
			try {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
}
