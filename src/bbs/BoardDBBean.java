package bbs;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

//BoardDBBean bd = BoardDBBean.getInstance()
public class BoardDBBean {   
    private static BoardDBBean instance = new BoardDBBean();
    
   
    public static BoardDBBean getInstance() {
        return instance;
    }
   
    private BoardDBBean() {
    }
   
    private Connection getConnection() throws Exception {
	String jdbcDriver = "jdbc:apache:commons:dbcp:pool";         
        return DriverManager.getConnection(jdbcDriver);
    }
    //writePro.jsp
    public void insertArticle(BoardDataBean article) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
	ResultSet rs = null;
        //답변글인지 일반글인지를 구분해서 입력시켜주는 로직!!!
	int bNo=article.getbNo();
	

	int number=0;
        String sql="";

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select max(b_No) from board");
	        rs = pstmt.executeQuery();

	    if (rs.next())
	      number=rs.getInt(1)+1;//글번호
	    else
	      number=1;

            // 쿼리를 작성    
            sql = "insert into board(b_no,emp_no,B_TITLE,";
	        sql+="emp_nm,B_CONTENT,POST_DATE) values(BOARD_SEQ.NEXTVAL,?,?,?,?,?)";
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setInt(1, article.getempNo());
	        pstmt.setString(2, article.getbTitle());
	        pstmt.setString(3, article.getempNm());
	        pstmt.setString(4, article.getbContent());
	        pstmt.setTimestamp(5, article.getpostDate());
	        pstmt.executeUpdate();
        } catch(Exception ex) {
        	ex.printStackTrace();
        } finally {
        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        
    }
	        

            
           
          
            

   
    //list.jsp : 페이징을 위해서 전체 DB에 입력된 행의수가 필요하다...!!!
    public int getArticleCount() throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement("select count(*) from board");
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x= rs.getInt(1);
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

    //list.jsp ==> Paging!!! DB로부터 여러행을 결과로 받는다.
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public List getArticles(int start, int end) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List articleList=null;
        
        
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            "select B_NO,EMP_NO,B_TITLE,EMP_NM,B_CONTENT,POST_DATE,B_VIEW_CNT,r  " +
            "from (select B_NO,EMP_NO,B_TITLE,EMP_NM,B_CONTENT,POST_DATE,B_VIEW_CNT,rownum r " +
            "from (select B_NO,EMP_NO,B_TITLE,EMP_NM,B_CONTENT,POST_DATE,B_VIEW_CNT " +
            "from board) order by B_NO desc) where r >= ? and r <= ? ");
            pstmt.setInt(1, start);
	        pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList(end);
                do{
                  BoardDataBean article= new BoardDataBean();
                  
 

		          article.setbNo(rs.getInt("b_no"));
		          article.setempNo(rs.getInt("emp_no"));
                  article.setbTitle(rs.getString("b_title"));
                  article.setempNm(rs.getString("emp_nm"));
                  article.setbContent(rs.getString("b_content"));
                  article.setpostDate(rs.getTimestamp("post_date"));
		          //article.setbViewCnt(rs.getInt("b_view_cnt"));
 
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

    //content.jsp : DB로부터 한줄의 데이터를 가져온다.
    public BoardDataBean getArticle(int bno) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
            "update board set B_VIEW_CNT=B_VIEW_CNT+1 where b_no = ?");
            pstmt.setInt(1, bno);
	    pstmt.executeUpdate();

            pstmt = conn.prepareStatement(
            "select * from board where b_no = ?");
            pstmt.setInt(1, bno);
            rs = pstmt.executeQuery();

            if (rs.next()) {
		          article.setbNo(rs.getInt("B_NO"));
		          article.setempNo(rs.getInt("EMP_NO"));
                  article.setbTitle(rs.getString("B_TITLE"));
                  article.setempNm(rs.getString("EMP_NM"));
                  article.setbContent(rs.getString("B_CONTENT"));
                  article.setpostDate(rs.getTimestamp("POST_DATE"));
		          article.setbViewCnt(rs.getInt("B_VIEW_CNT"));   
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

    //updateForm.jsp : 수정폼에 한줄의 데이터를 가져올때.
    @SuppressWarnings("null")
	public BoardDataBean updateGetArticle(int num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
            "select * from board where b_no = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
		          article.setbNo(rs.getInt("B_NO"));
		          article.setempNo(rs.getInt("EMP_NO"));
                article.setbTitle(rs.getString("B_TITLE"));
                article.setempNm(rs.getString("EMP_NM"));
                article.setbContent(rs.getString("B_CONTENT"));
                article.setpostDate(rs.getTimestamp("POST_DATE"));
		          article.setbViewCnt(rs.getInt("B_VIEW_CNT"));    
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

    //updatePro.jsp : 실제 데이터를 수정하는 메소드.
    public int updateArticle(BoardDataBean article) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;

        String dbpasswd="";
        String sql="";
	int x=-1;
        try {
            conn = getConnection();
           
	    pstmt = conn.prepareStatement("select adm_pw from emp_adm where emp_no = ?");
            pstmt.setInt(1, article.getempNo());
            rs = pstmt.executeQuery();
           
	if(rs.next()){
	    dbpasswd= rs.getString("adm_pw");
	    if(dbpasswd.equals(article.getadm_pw())){
		sql="update board set B_TITLE=?,B_CONTENT=? ";
		sql+="where emp_no=?";
                pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, article.getbTitle());
                pstmt.setString(2, article.getbContent());
                pstmt.setInt(3, article.getempNo());

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
   
    //deletePro.jsp : 실제 데이터를 삭제하는 메소드...
    public int deleteArticle(int num, String passwd) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        try {
	    conn = getConnection();

            pstmt = conn.prepareStatement(
            "select adm_pw from emp_adm where emp_no = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
           
            if(rs.next()){
		dbpasswd= rs.getString("passwd");
		if(dbpasswd.equals(passwd)){
		    pstmt = conn.prepareStatement("delete from board where emp_no=?");
                    pstmt.setInt(1, num);
                    pstmt.executeUpdate();
		    x= 1; //글삭제 성공
		}else
		    x= 0; //비밀번호 틀림
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
}
