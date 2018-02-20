package review;

import java.sql.*;
import javax.sql.*;

import bbs.BoardDBBean;
import bbs.BoardDataBean;

import javax.naming.*;
import java.util.*;

public class ReviewDBBean {
    private static ReviewDBBean instance = new ReviewDBBean();
    
    
    public static ReviewDBBean getInstance() {
        return instance;
    }
   
    private ReviewDBBean() {
    }
   
    private Connection getConnection() throws Exception {
	String jdbcDriver = "jdbc:apache:commons:dbcp:pool";         
        return DriverManager.getConnection(jdbcDriver);
    }
    public void insertArticle(ReviewDataBean article) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    /*
	    int RV_NO
	    int STORE_NO
	    String MEM_NM
	    Stirng STORE_NM
	    StringVISIT_DATE
	    Stirng RV_TITLE
	    String RV_CONTENT
	    int LIKE_CNT
	    int R_VIEW_CNT
	    	   */
        try {
            conn = getConnection();
            String sql="";
            

          // 쿼리를 작성    
            sql = "insert into review(rv_no, store_no, mem_nm, store_nm, visit_date, rv_title";
	        sql+="mrv_content, like_cnt, r_view_cnt) values (rv_no.NEXTVAL, ?, ?, ?,?,?,?,?,?)";
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setInt(1, article.getStoreno());
	        pstmt.setString(2, article.getMemnm());
	        pstmt.setString(3, article.getStorenm());
	        pstmt.setString(4, article.getVisitdate());
	        pstmt.setString(5, article.getRvtitle());
	        pstmt.setString(6, article.getRvcontent());
	        pstmt.setInt(7, article.getRviewcnt());
	        pstmt.setInt(8, article.getLikecnt());
	        pstmt.executeUpdate();
        } catch(Exception ex) {
        	ex.printStackTrace();
        } finally {
        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        
    }
	public List getArticles(int start, int end) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List articleList=null;
        
        
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            		"select RV_NO, STORE_NO, MEM_NM, STORE_NM, VISIT_DATE, "+
            		"RV_TITLE, RV_CONTENT, LIKE_CNT, R_VIEW_CNT from "+
            		"(select rownum RV_NO, STORE_NO, MEM_NM, STORE_NM, VISIT_DATE, "+
            		"RV_TITLE, RV_CONTENT, LIKE_CNT, R_VIEW_CNT from "+
            		"(select * from review m order by rv_no desc) "+
            		"where rownum <= ?) where rownum >= ?");
            pstmt.setInt(1, end);
	        pstmt.setInt(2, start);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList(end);
                do{
                	ReviewDataBean article= new ReviewDataBean();
                  article = new ReviewDataBean();
                  article.setRvno(rs.getInt("rv_no"));
    	          article.setStoreno(rs.getInt("store_no"));
                  article.setMemnm(rs.getString("mem_nm"));
                  article.setStorenm(rs.getString("store_nm"));
                  article.setVisitdate(rs.getString("visit_date"));
                  article.setRvtitle(rs.getString("rv_title"));
                  article.setRvcontent(rs.getString("rv_content"));
                  article.setLikecnt(rs.getInt("like_cnt"));
    	          article.setRviewcnt(rs.getInt("r_view_cnt")); 
 
                  articleList.add(article);
		}while(rs.next());
	    }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	return articleList;
    }
	        
	        
	        
}
	        
	    