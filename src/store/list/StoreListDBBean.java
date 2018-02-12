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

public StoreListDataBean get(int i) {
	// TODO Auto-generated method stub
	return null;
}


}