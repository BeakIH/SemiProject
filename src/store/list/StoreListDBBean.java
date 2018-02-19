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
   
   
 //storeInfo.jsp : 매장정보 폼에서 한줄의 데이터를 가져온다.
   public StoreListDataBean updateGetArticle(int store_no) throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       StoreListDataBean article=null;
       try {
           conn = getConnection();

           pstmt = conn.prepareStatement(
           "select store_no, cate_nm, store_exp, store_tel, store_exp_dt,store_url from store_list where store_no = ?");
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