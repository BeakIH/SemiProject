package booking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import board.BoardDataBean;

public class BookingDBBean {
	private static BookingDBBean instance = new BookingDBBean();
	// LogonDBBean m = LogonDBBean.getInstance();
	public static BookingDBBean getInstance() { //�̱����������� ��ü �����ص�
		return instance;	
	}
	
	public BookingDBBean() {}
	
	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	// �����ϱ�
	public void insertBooking(BookingDataBean booking) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into booking values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, booking.getBkNo());
			pstmt.setInt(2, booking.getWtNo());
			pstmt.setInt(3, booking.getEmpNo());
			pstmt.setInt(4, booking.getMemNo());
			pstmt.setString(5, booking.getMemNm());
			pstmt.setString(6, booking.getMemTel());
			pstmt.setString(7, booking.getStoreNm());
			pstmt.setTimestamp(8, booking.getBkDate());
			pstmt.setString(9, booking.getBkCnt());
			pstmt.setString(10, booking.getBkMenu());
			pstmt.setString(11, booking.getCofirmYn());
			pstmt.setString(12, booking.getBkStatus());
			pstmt.setInt(13, booking.getBkNo());
		
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		}
		
	}// ��������� ���� Ȯ�� 
	
	//���������� �Ѱܰ����� ��
	public void insertReserve(BookingDataBean booking) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into booking values(?,?,?,?)");
			
			pstmt.setString(1, booking.getStoreNm());//��������
			pstmt.setTimestamp(2, booking.getBkDate());//�����Ͻ�
			pstmt.setString(3, booking.getBkMenu());//���� �޴�
			pstmt.setString(4, booking.getBkCnt()); //���� �ο�
			
			
			
			
			
		
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		}
		
	}// ��������� ���� Ȯ�� 
	
	
	public int updateArticle(BookingDataBean article)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		String dbpasswd="";
		String sql="";
		
		int x = -1;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select passwd from board where num =?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(article.getPasswd())) {
					sql="update board set writer=?,email=?,subject=?,passwd=?,content=? where num = ?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());
					
					pstmt.executeUpdate();
					
			x = 1;
		}else {
			x= 0;
		}
		}
		}catch(Exception ex) {
				ex.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn!=null)try {conn.close();}catch(SQLException ex) {}
		}
		return x;
	}
	
}// class ends.
