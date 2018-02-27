package reserve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import store.list.JdbcUtil;
import store.list.StoreListDataBean;

public class MemSelectDBBean {

	
	private static MemSelectDBBean instance = new MemSelectDBBean();

	// 싱글턴패턴을 사용하기 위해 해당 메서드로 접근해서 사용하도록함
	public static MemSelectDBBean getInstance() {
		return instance; // 객체를 리턴함
	}

	private MemSelectDBBean() {

	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	//세션값 id값을 받아와 member테이블 셀렉트하는 메서드
	public List MemInfo (String mem_id) throws Exception {
	       Connection conn = null;
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;
	       List<MemSelectDateBean> articleList2 = new ArrayList();
	       try {
	           conn = getConnection();

	           pstmt = conn.prepareStatement(
	           "select * from member where mem_id = ?");
	           pstmt.setString(1, mem_id);
	           rs = pstmt.executeQuery();

	           if (rs.next()) {
	        	  
	        	   do {
	        	   MemSelectDateBean article = new MemSelectDateBean();
	               article.setMem_no(rs.getInt("mem_no"));
/*	               article.setHis_no(rs.getInt("his_no"));
*/	               article.setMem_nm(rs.getString("mem_nm"));
	               article.setMem_id(rs.getString("mem_id"));
	               article.setMem_pw(rs.getString("mem_pw"));
	               article.setMem_tel(rs.getString("mem_tel"));
	               article.setAddress(rs.getString("address"));
	               article.setEmail(rs.getString("email"));
	               article.setEmail_yn(rs.getString("email_yn"));
	               article.setFvrt_str_1(rs.getString("fvrt_str_1"));
	               article.setFvrt_str_2(rs.getString("fvrt_str_2"));
	              /* article.setMem_yn(rs.getString("mem_yn"));*/
	               
	              
	               
	               articleList2.add(article);
		    }while (rs.next());
	        }
	       } catch(Exception ex) {
	           ex.printStackTrace();
	       } finally {
	           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	       }
		return articleList2;
	   }
	
	
}
