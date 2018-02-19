package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import emp.EmpDataBean;
import member.MemberDataBean;

public class LoginDBBean {
	
	private static LoginDBBean instance = new LoginDBBean();
	

	private LoginDBBean(){}
	public static LoginDBBean getInstance() {
		return instance;
	}
	 


//	public int userCheck(String userid, String userpw) throws Exception {
//		//그냥 입력한값을 가져온거지
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		int x = 0; // 아이디 없음
//		String dbpasswd = "";
//		try { // 로그인 아이디가 관리자일 경우
//			conn = getConnection();
//			String sql = "select ADM_ID, ADM_PW from EMP where ADM_ID = ?";
//		
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, userid);
//			rs = pstmt.executeQuery();  //해당아이디가 있는지 검사
//
//			if (rs.next()) { //있을경우
//				dbpasswd = rs.getString("ADM_PW"); //관리자 패스워드를 가져옴
//				if (dbpasswd.equals(userpw)) { // 비밀번호 비교
//					x = 1; // 관리자 id로 로그인성공
//				}
//			} 
//			// 관리자가 아닌 경우 
//			else {
//				sql = "select mem_id , mem_pw from member where mem_id =?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, userid);
//				rs = pstmt.executeQuery();
//				if(rs.next()) {
//					String passwd = rs.getString("mem_pw");
//					if(passwd.equals(userpw)) {
//						x =2 ; // 일반회원일 떄 로그인 성공
//					}else {
//						x= -1; // 비밀번호틀림
//					}
//				}
//				
//			}
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		} finally {
//			if (rs != null)
//				try {
//					rs.close();
//				} catch (SQLException ex) {
//				}
//			if (pstmt != null)
//				try {
//					pstmt.close();
//				} catch (SQLException ex) {
//				}
//			if (conn != null)
//				try {
//					conn.close();
//				} catch (SQLException ex) {
//				}
//		}
//		return x;  //x = 0 회원아님 , 1 관리자 , 2 일반회원 , -1 비밀번호가 다름
//	}

	public List userCheck2(String userid, String userpw) throws Exception {
		//그냥 입력한값을 가져온거지
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List noList ; // 아이디 없음
		String dbpasswd = "";
		try { // 로그인 아이디가 관리자일 경우
			conn = getConnection();
			String sql = "select ADM_ID, ADM_PW, STORE_NO from EMP where ADM_ID = ?";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();  //해당아이디가 있는지 검사

			if (rs.next()) { //있을경우
				dbpasswd = rs.getString("ADM_PW"); //관리자 패스워드를 가져옴
				if (dbpasswd.equals(userpw)) { // 비밀번호 비교
					noList = new ArrayList(10);

					EmpDataBean no = new EmpDataBean();
					
					no.setAdmId(rs.getString("admId"));
					no.setAdmPw(rs.getString("admPw"));
					no.setStoreNo(rs.getInt("store_no"));
					no.setAdmYn(1);
					noList.add(no); // 관리자 id로 로그인성공
				}
			} 
			// 관리자가 아닌 경우, 회원이거나 미가입
			else {
				sql = "select mem_id , mem_pw from member where mem_id =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					String passwd = rs.getString("mem_pw");
					if(passwd.equals(userpw)) {						
						MemberDataBean no = new MemberDataBean();
						
						no.setMemId(rs.getString("mem_id"));
						no.setMemPw(rs.getString("mem_pw"));
						no.setMemYn(2);
						noList.add(no);
						// 일반회원일 떄 로그인 성공
					}else {
						// 비밀번호틀림
						MemberDataBean no = new MemberDataBean();
						
						no.setMemYn(-1);
						noList.add(no);
					}
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
		return noList;  //x = 0 회원아님 , 1 관리자 , 2 일반회원 , -1 비밀번호가 다름
	}
	
	
	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}


	
}
