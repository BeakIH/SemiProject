package booking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import board.BoardDataBean;
import board.Exception;
import board.ResultSet;
import board.String;

public class BookingDBBean {
	private static BookingDBBean instance = new BookingDBBean();
	
	public static BookingDBBean getInstance(){
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	// 예약신청 발생했을 때 
	public void insertBooking(BookingDataBean booking) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null; 
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into booking values(?,?,?,?,?,?,?,?,?,?,'N',?,?)");
			pstmt.setInt(1, booking.getBkNo());
			pstmt.setInt(2, booking.getWtNo());
			pstmt.setInt(3, booking.getEmpNo());
			pstmt.setInt(4, booking.getMemNo());
			pstmt.setString(5, booking.getMemNm());
			pstmt.setString(6, booking.getMemTel());
			pstmt.setString(7, booking.getStoreNm() );
			pstmt.setString(8, booking.getBkDate());
			pstmt.setString(9, booking.getBkCnt());
			pstmt.setString(10, booking.getBkMenu());
			//pstmt.setString(11, booking.getCofirmYn());
			pstmt.setInt(11, booking.getBkTblCnt());
			pstmt.setInt(12, booking.getStoreNo());
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
	
	// insert된 예약 건에 대한 매장확인 (confirm_yn컬럼의 값을 Y로 업데이트)
	// confirm_yn이 y로 업데이트 되면 store_list 테이블의 avl_tbl_cnt 값은 trigger에 의하여 변경됨.
	public void updateConfirm(int store_no) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null; 
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("update booking set confirm_yn = 'Y' where store_no = ?");
			pstmt.setInt(1, store_no);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		
		} finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    } //updateConfirm ends.
	
	
	
}
