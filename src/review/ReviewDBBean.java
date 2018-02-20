package review;

import java.sql.*;
import javax.sql.*;

import bbs.BoardDataBean;

import javax.naming.*;
import java.util.*;

public class ReviewDBBean {
    public void insertArticle(ReviewDataBean article) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	    	
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
			pstmt = conn.prepareStatement("insert into review(message_id, guest_name, password, message) values (message_id_seq.NEXTVAL, ?, ?, ?)");
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();
        } catch(Exception ex) {
        	ex.printStackTrace();
        } finally {
        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
}