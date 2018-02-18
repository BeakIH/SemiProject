package store.list;

import java.sql.*;
import java.text.*;
import java.util.*;
import java.util.Date;

import board.BoardDataBean;


public class StoreListDBBean { //DAO

	private static StoreListDBBean instance = new StoreListDBBean();
	public static StoreListDBBean getInstance() {
		return instance;
	}
	
	// �� �޼ҵ� ����
	public StoreListDBBean() {}
	
	//DB����
	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	} //getConnection ends.

	
   public ArrayList<StoreListDataBean> getUpdateCurCnt() {
      ArrayList<StoreListDataBean> list = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         Date date = new Date(System.currentTimeMillis());
         SimpleDateFormat simple = new SimpleDateFormat("m");
         String sysdate = simple.format(date).toString();
         String x = sysdate.substring(1); // ���� 2�ڸ��ϱ� �ε����� 0�������� 1���̾Ҵ�. 1�� �ڸ� ���Ҷ�..
         if (x.equals("5")) {
            System.out.println("5�и��� ������Ʈ�˴ϴ�.");
            String sql = "update booking set confirm_yn = 'y'";
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            conn.setAutoCommit(false);
            int check = pstmt.executeUpdate();
            if (check == 1) {
               sql = "select store_nm, cur_tbl_cnt, avl_tbl_cnt from store_list";
               pstmt = conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
               list = new ArrayList<StoreListDataBean>();
               while (rs.next()) {
                  StoreListDataBean dto = new StoreListDataBean();
                  // ������ dto ��ü�� ȭ���� ������ ���� ����ִ� �ڵ� set��
                  list.add(dto);
               }
            }
         } else {
            System.out.println("�ɳ�");
         }
         conn.commit();
         conn.setAutoCommit(true);
      } catch (
      Exception e) {
         e.printStackTrace();
         try {   conn.rollback();} catch (SQLException e1) {e1.printStackTrace();}
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
   
   
 //storeInfo.jsp : 수정폼에 한줄의 데이터를 가져올때.
   public BoardDataBean updateGetArticle(int num) throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       BoardDataBean article=null;
       try {
           conn = getConnection();

           pstmt = conn.prepareStatement(
           "select store_no, cate_nm,  from board where store_no = ?");
           pstmt.setInt(1, num);
           rs = pstmt.executeQuery();

           if (rs.next()) {
               article = new BoardDataBean();
               article.setNum(rs.getInt("num"));
               article.setWriter(rs.getString("writer"));
               article.setEmail(rs.getString("email"));
               article.setSubject(rs.getString("subject"));
               article.setPasswd(rs.getString("passwd"));
               article.setReg_date(rs.getTimestamp("reg_date"));
               article.setReadcount(rs.getInt("readcount"));
               article.setRef(rs.getInt("ref"));
               article.setRe_step(rs.getInt("re_step"));
               article.setRe_level(rs.getInt("re_level"));
               article.setContent(rs.getString("content"));
               article.setIp(rs.getString("ip"));    
	    }
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
	return article;
   }
   
 //storeInfoPro.jsp : 실제 데이터를 수정하는 메소드
   public int updateArticle(BoardDataBean article) throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs= null;

       String dbpasswd="";
       String sql="";
       int x=-1;
       try {
           conn = getConnection();
          
	    pstmt = conn.prepareStatement("select passwd from board where num = ?");
           pstmt.setInt(1, article.getNum());
           rs = pstmt.executeQuery();
          
	if(rs.next()){
	    dbpasswd= rs.getString("passwd");
	    if(dbpasswd.equals(article.getPasswd())){
		sql="update board set writer=?,email=?,subject=?,passwd=?";
		sql+=",content=? where num=?";
               pstmt = conn.prepareStatement(sql);

               pstmt.setString(1, article.getWriter());
               pstmt.setString(2, article.getEmail());
               pstmt.setString(3, article.getSubject());
               pstmt.setString(4, article.getPasswd());
               pstmt.setString(5, article.getContent());
               pstmt.setInt(6, article.getNum());
               pstmt.executeUpdate();
               x= 1;
	    }else{
	    	x= 0;
	    }
	  }
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
	    if (rs != null) try { rs.close(); } catch(SQLException ex) {}
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
	 return x;
   }

public StoreListDataBean get(int i) {
	// TODO Auto-generated method stub
	return null;
}


	


}