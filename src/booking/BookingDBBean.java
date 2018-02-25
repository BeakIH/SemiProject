package booking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/*import board.Exception;
import board.ResultSet;
import board.String;
*/
public class BookingDBBean {
	private static BookingDBBean instance = new BookingDBBean();
	
	public static BookingDBBean getInstance(){
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	// 예약신청 발생했을 때 insert하는 메서드 
	public void insertBooking(BookingDataBean booking) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null; 
		System.out.println("메뉴?:::"+booking.getBkMenu());
		System.out.println("nm?:::"+booking.getEmpNo());

		try {
			conn = getConnection();
			//가라 데이터 집어넣기 - 수정해서 가라데이터 집어넣어줘야함
			pstmt = conn.prepareStatement("insert into booking values(booking_seq.NEXTVAL,?,?,?,?,?,?,?,?,'N',?,?,?)");
			/*pstmt.setInt(1, booking.getBkNo());*/
			/*pstmt.setInt(2, booking.getWtNo());*/
			pstmt.setInt(1, booking.getEmpNo());
			
			pstmt.setInt(2, booking.getMemNo());
			pstmt.setString(3, booking.getMemNm());
			pstmt.setString(4, booking.getMemTel());
			
			
			pstmt.setString(5, booking.getStoreNm());
			pstmt.setString(6, booking.getBkDate());
			pstmt.setString(7, booking.getBkCnt());
			pstmt.setString(8, booking.getBkMenu());
			//pstmt.setString(11, booking.getCofirmYn()); //N값 넣어줘야됨
			pstmt.setInt(9, booking.getBkTblCnt());
			pstmt.setInt(10, booking.getStoreNo());
			pstmt.setString(11, booking.getBkPriSum());
			pstmt.executeUpdate();
		 
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
	
	// 예약건 중에서 해당매장에 해당하는 예약건만 관리자 화면에서 뿌려주는 메소드  
	public ArrayList<BookingDataBean> bookingAdminCall(int store_no) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ArrayList<BookingDataBean> list = new ArrayList<BookingDataBean>();
		ResultSet rs = null;
		try{			
			
			conn = getConnection();
			
			String sql = "select * from booking where store_no = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, store_no);

			rs = pstmt.executeQuery();
			while (rs.next()) {

				BookingDataBean dto = new BookingDataBean();

				dto.setBkNo(rs.getInt("bk_no"));
				dto.setEmpNo(rs.getInt("emp_no"));
				dto.setStoreNo(rs.getInt("mem_no"));
				dto.setMemNm(rs.getString("mem_nm"));
				dto.setMemTel(rs.getString("mem_tel"));
				dto.setStoreNm(rs.getString("store_nm"));
				dto.setBkDate(rs.getString("bk_date"));
				dto.setBkCnt(rs.getString("bk_cnt"));
				dto.setBkMenu(rs.getString("bk_menu"));
				dto.setCofirmYn(rs.getString("confirm_yn"));
				dto.setBkTblCnt(rs.getInt("bk_tbl_cnt"));
				dto.setStoreNo(rs.getInt("store_no"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		
		} finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		
		return list;
    } //bookingAdminCall ends.
}
