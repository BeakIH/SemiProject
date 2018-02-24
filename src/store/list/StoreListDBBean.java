package store.list;

import java.sql.*;
import java.text.*;
import java.util.*;
import java.util.Date;


public class StoreListDBBean { //DAO

	private static StoreListDBBean instance = new StoreListDBBean();
	public static StoreListDBBean getInstance() {
		return instance;
	}
	
	// 빈 메소드 생성
	public StoreListDBBean() {}
	
	//DB연결
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
         String x = sysdate.substring(1); // 분은 2자리니까 인덱스는 0부터지만 1을뽑았다. 1의 자리 비교할라구..
         if (x.equals("5")) {
            System.out.println("현재 5분때 시간입니다.");
            String sql = "update 문 들어갈 곳(cur_cnt컬럼)";
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            conn.setAutoCommit(false);
            int check = pstmt.executeUpdate();
            if (check == 1) {
               sql = "값을 가져올 sql";
               pstmt = conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
               list = new ArrayList<StoreListDataBean>();
               while (rs.next()) {
                  StoreListDataBean dto = new StoreListDataBean();
                  // 생성한 dto 객체의 화면의 보여줄 값을 담아주는 코드 set을
                  list.add(dto);
               }
            }
         } else {
            System.out.println("냥냥");
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
   
   
 //storeInfo.jsp : 매장정보 폼에서 한줄의 데이터를 가져온다.
   public StoreListDataBean updateGetArticle(int store_no) throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       StoreListDataBean article=null;
       try {
           conn = getConnection(false);

           pstmt = conn.prepareStatement(
           "select * from store_list, emp where emp.store_no = storeList.store_no and store_no = ?");
           pstmt.setInt(1, store_no);
           rs = pstmt.executeQuery();

           if (rs.next()) {
               article = new StoreListDataBean();
               article.setStoreNm(rs.getString("storeNm"));
               article.setCateNm(rs.getString("cateNm"));
               article.setStoreExp(rs.getString("storeExp"));
               article.setStoreTel(rs.getString("storeTel"));
               article.setStoreExpDt(rs.getString("storeExpDt"));
               article.setStoreUrl(rs.getString("storeUrl"));
                 
	    }
           conn.commit();
		   conn.setAutoCommit(true); 
           
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
	return article;
   }
   
 //storeInfoPro.jsp : 실제 매장정보를 수정하는 메소드
   public int updateArticle(StoreListDataBean article) throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs= null;

       String dbstoreno="";
       String sql="";
       int x=-1;
       try {
           conn = getConnection();
          
	    pstmt = conn.prepareStatement("select store_no from store_list where store_no = ?");
           pstmt.setInt(1, article.getStoreNo());
           rs = pstmt.executeQuery();
          
	if(rs.next()){
	    dbstoreno= rs.getString("storeNo");
	    if(dbstoreno.equals(article.getStoreNo())){
		sql="update store_list set store_no=?, cate_nm=?, store_exp=?, store_tel=?, store_exp_dt=?,store_url=? where store_no=?";
               pstmt = conn.prepareStatement(sql);
               
               pstmt.setString(1, article.getStoreNm());
               pstmt.setString(2, article.getCateNm());
               pstmt.setString(3, article.getStoreExp());
               pstmt.setString(4, article.getStoreTel());
               pstmt.setString(5, article.getStoreExpDt());
               pstmt.setString(6, article.getStoreUrl());
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