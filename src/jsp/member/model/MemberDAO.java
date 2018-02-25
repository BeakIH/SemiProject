package jsp.member.model;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;

import javax.sql.DataSource;

import jsp.util.DBConnection;

/**
 * MEMBER 테이블과 연관된 DAO로
 * 회원 데이터를 처리하는 클래스이다.
 * <br><br>
 * Data Access Object - 테이블 당 한개의 DAO를 작성한다.
 */
public class MemberDAO 
{
	
	
	   private static MemberDAO instance = new MemberDAO();

	   
	   //LogonDBBean.getInstance();   싱글턴패턴
	   public static MemberDAO getInstance() {
	      return instance;
	   }
	   
	   private MemberDAO() {}
	   
	   private Connection getConnection() throws Exception{
	      String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
	      return DriverManager.getConnection(jdbcDriver);
	   }
	   
	
	   public void insertMember(MemberBean member) throws Exception{
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      
	      try {
	         
	         conn = getConnection();
	         
	         //DriverManager.getConnection(jdbc:apache:commons:dbcp:pool);
	         String sql = "insert into MEMBER values(member_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)";  
	         pstmt = conn.prepareStatement(sql);
	         
	            pstmt.setString(1, member.getMem_nm());
	            pstmt.setString(2, member.getMem_id());
	            pstmt.setString(3, member.getMem_pw());
	            pstmt.setString(4, member.getMem_tel());
	            pstmt.setString(5, member.getAddress());
	            pstmt.setString(6, member.getEmail());
	            pstmt.setString(7, member.getEmail_yn());
	            pstmt.setString(8, member.getFvrt_str_1());
	            pstmt.setString(9, member.getFvrt_str_2());
	            
	         pstmt.executeUpdate();
	         
	      }catch(Exception ex) {
	         ex.printStackTrace();
	      }finally {
	    	  
	         if(pstmt !=null) try {pstmt.close();} catch(SQLException ex) {}
	         if(conn !=null) try {conn.close();} catch(SQLException ex) {}
	      }
	   }
	   
	   

	   
	//아이디중복체크  
	   
		//db연동 메서드
	   public int ConfirmId(String id) {
		 
		   Connection conn = null;
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;
		   int result = 0;
		   try {
			   conn = getOracle();
			   String sql = "select mem_id from member where mem_id = ?";
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, id);
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   result = 1;
			   }
		   } catch(Exception e) {
			   e.printStackTrace();
			   
		   }finally {
			   if(rs != null) try { rs.close();} catch(SQLException ex) {}
		         if(pstmt !=null)try {pstmt.close();   }catch(SQLException ex) {}
		         if(conn !=null) try {conn.close();} catch(SQLException ex) {}
		   }
		   return result;
	   	
	   }
	   //ConfirmId메서드
		private Connection getOracle() throws Exception {
	
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:comp/env");
			DataSource ds = (DataSource) env.lookup("jdbc/orcl");
			return ds.getConnection();
	}



	/**
     * 
       생년월일 
       
    public Date stringToDate(MemberBean member)
    {
        String year = member.getBirthyy();
        String month = member.getBirthmm();
        String day = member.getBirthdd();
        
        Date birthday  = null;
        
        if(year != null && month != null && day != null)
            birthday = Date.valueOf(year+"-"+month+"-"+day);
        
        return birthday;
        
    } // end stringToDate()
    

    
     * @return MemberBean
     **/
    public MemberBean getUserInfo(String id) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberBean member = null;
 
        try {
            // 쿼리
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM MEMBER WHERE mem_id=?");
 
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 회원정보를 DTO에 담는다.
            {
            	/**
                // DB의 생년월일정보 -> 년, 월, 일로 문자열 자른다.
                String birthday = rs.getDate("birth").toString();
                String year = birthday.substring(0, 4);
                String month = birthday.substring(5, 7);
                String day = birthday.substring(8, 10);
                
                // 이메일을 @ 기준으로 자른다.
                String mail = rs.getString("mail");
                int idx = mail.indexOf("@"); 
                String mail1 = mail.substring(0, idx);
                String mail2 = mail.substring(idx+1);
                **/
                // 자바빈에 정보를 담는다.
                member = new MemberBean();
                member.setMem_no(rs.getInt("mem_no"));
                member.setMem_nm(rs.getString("mem_nm"));
                member.setMem_id(rs.getString("mem_id"));
                member.setMem_pw(rs.getString("password"));
                member.setMem_tel(rs.getString("mem_tel"));
                member.setAddress(rs.getString("address"));
                member.setEmail(rs.getString("email"));
                member.setEmail_yn(rs.getString("email_yn"));
                member.setFvrt_str_1(rs.getString("fvr_str_1"));
                member.setFvrt_str_2(rs.getString("fvr_str_2"));
             }
 
            return member;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    }    // end getUserInfo
    
    
    /**
     * 회원정보를 수정 member 수정 정보 담고있는
     * @throws SQLException
     */
    public void updateMember(MemberBean member) throws SQLException{
        
        Connection conn = null;
        PreparedStatement pstmt = null;
 
        try {
 
            StringBuffer query = new StringBuffer();
            query.append("UPDATE MEMBER SET");
            query.append(" mem_pw=?, email=?, mem_tel=?, address=?");
            query.append(" WHERE mem_id=?");
 
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(query.toString());
 
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            pstmt.setString(1, member.getMem_pw());
            pstmt.setString(2, member.getEmail());
            pstmt.setString(3, member.getMem_tel());
            pstmt.setString(4, member.getAddress());
            pstmt.setString(5, member.getMem_id());
 
            pstmt.executeUpdate();
            // 완료시 커밋
            conn.commit(); 
                        
        } catch (Exception sqle) {
            conn.rollback(); // 오류시 롤백
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end updateMember
    
    
    /**
     * 회원정보를 삭제한다.
     * @param id 회원정보 삭제 시 필요한 아이디
     * @param pw 회원정보 삭제 시 필요한 비밀번호
     * @return x : deleteMember() 수행 후 결과값
     */
    @SuppressWarnings("resource")
    public int deleteMember(String id, String pw) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
        int x = -1;
 
        try {
            // 비밀번호 조회
            StringBuffer query1 = new StringBuffer();
            query1.append("SELECT mem_pw FROM MEMBER WHERE mem_id=?");
 
            // 회원 삭제
            StringBuffer query2 = new StringBuffer();
            query2.append("DELETE FROM MEMBER WHERE mem_id=?");
 
            conn = DBConnection.getConnection();
 
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            // 1. 아이디에 해당하는 비밀번호를 조회한다.
            pstmt = conn.prepareStatement(query1.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) 
            {
                dbpw = rs.getString("mem_pw");
                if (dbpw.equals(pw)) // 입력된 비밀번호와 DB비번 비교
                {
                    // 같을경우 회원삭제 진행
                    pstmt = conn.prepareStatement(query2.toString());
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                    conn.commit(); 
                    x = 1; // 삭제 성공
                } else {
                    x = 0; // 비밀번호 비교결과 - 다름
                }
            }
 
            return x;
 
        } catch (Exception sqle) {
            try {
                conn.rollback(); // 오류시 롤백
            } catch (SQLException e) {
                e.printStackTrace();
            }
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end deleteMember
    
 
    /**
     * 로그인시 아이디, 비밀번호 체크 메서드
     * @param id 로그인할 아이디
     * @param pw 비밀번호
     * @return x : loginCheck() 수행 후 결과값 
     */
    public int loginCheck(String id, String pw) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        int x = -1;
 
        try {
            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
            StringBuffer query = new StringBuffer();
            query.append("SELECT mem_pw FROM MEMBER WHERE mem_id=?");
 
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
            {
                dbPW = rs.getString("mem_pw"); // 비번을 변수에 넣는다.
 
                if (dbPW.equals(pw)) 
                    x = 1; // 넘겨받은 비번과 꺼내온 비번 비교. 같으면 인증성공
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
                
            } else {
                x = -1; // 해당 아이디가 없을 경우
            }
 
            return x;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end loginCheck()    
}
 
 


