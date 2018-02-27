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
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	EmpDataBean dto = null;

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

	public ArrayList<EmpDataBean> getEmpList(int store_no) throws Exception {
		ArrayList<EmpDataBean> list = new ArrayList<EmpDataBean>();
		try {
			conn = getConnection();

			String sql = "select * from emp where store_no = ? order by emp_no";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, store_no);

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

		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(
					"insert into emp(emp_no, emp_nm, store_no, position, adm_yn, emp_status) values (emp_seq.nextval, ?, ?, ?, 'N', '재직')");
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

	public EmpDataBean getData(String adm_id) throws Exception {

		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			String sql = "select * from emp where adm_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adm_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
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
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	public boolean checkPwd(String adm_id, String adm_pw) throws Exception {
		
		boolean b = false;
		
		try {
			conn = getConnection();

			String sql = "select * from emp where adm_id = ? and adm_pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adm_id);
			pstmt.setString(2, adm_pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				b = true;
			}
		} catch (ClassNotFoundException | SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return b;
	}

	public EmpDataBean selectEmp(int emp_no) throws Exception {

		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			String sql = "select * from emp where emp_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, emp_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new EmpDataBean();
				dto.setEmpNm(rs.getString("emp_nm"));
				dto.setEmpNo(rs.getInt("emp_no"));
				dto.setStoreNo(rs.getInt("store_no"));
				dto.setPosition(rs.getString("Position"));
				dto.setAdmId(rs.getString("adm_id"));
				dto.setAdmYn(rs.getString("adm_Yn"));
				dto.setEmpStatus(rs.getString("emp_status"));
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
		return dto;
	}

	public boolean modifyEmp(EmpDataBean dto) throws Exception {
		
		boolean b = false;
		
		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			String sql = "update emp set emp_nm=?, Position=? where emp_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmpNm());
			pstmt.setString(2, dto.getPosition());
			pstmt.setInt(3, dto.getEmpNo());

			if (pstmt.executeUpdate() == 1) {
				b = true;
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
		return b;
	}
}
