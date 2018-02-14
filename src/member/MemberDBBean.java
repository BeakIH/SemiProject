package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDBBean {
	public void insertMember(MemberDataBean member) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
	       try {
	            conn = getConnection(); 
	            //DriverManager.getConnection(jdbc:apache:commons:dbcp:pool);
	            pstmt = conn.prepareStatement(
	            "insert into MEMBER values (?,?,?,?,?,?,?,?,?,?,?)");
	            pstmt.setInt(1, member.getMemNo());
	            pstmt.setInt(2, member.getHisNo());
	            pstmt.setString(3, member.getMemNm());
	            pstmt.setString(4, member.getMemId());
	            pstmt.setString(5, member.getMemPw());
	            pstmt.setString(6, member.getMemTel());
	            pstmt.setString(7, member.getAddress());
	            pstmt.setString(8, member.getEmail());
	            pstmt.setString(9, member.getEmailYn());
	            pstmt.setString(10, member.getFvrtStr1());
	            pstmt.setString(11, member.getFvrtStr2());
	            
	            pstmt.executeUpdate();
	        
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	    }

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
}
