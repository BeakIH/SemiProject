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
	
	// 직원추가를 위한 메소드
	public void insertAdm(EmpDataBean emp) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		//EmpDataBean empData = new EmpDataBean();
	       try {
	            conn = getConnection(); 
	            //DriverManager.getConnection(jdbc:apache:commons:dbcp:pool);
	            pstmt = conn.prepareStatement(
	            "insert into emp values (?,?,?,?,?,?,?,?)");
	            pstmt.setInt(1, emp.getEmpNo());
	            pstmt.setString(2, emp.getEmpNm());
	            pstmt.setInt(3, emp.getStoreNo()); 
	            pstmt.setString(4, emp.getPosition());
	            pstmt.setString(5, emp.getAdmYn());
	            pstmt.setString(6, emp.getEmpStatus());
	            pstmt.setString(7, emp.getAdmId());
	            pstmt.setString(8, emp.getAdmPw());
	            
	            pstmt.executeUpdate();
	        
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	    }
}
