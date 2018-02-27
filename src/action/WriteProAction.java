package action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.BoardDataBean;
import bbs.BoardDBBean;

public class WriteProAction implements CommandAction {// 입력된 글 처리

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");// 한글 인코딩
		
        Enumeration params = request.getParameterNames();
        System.out.println("------------프로----------------");
        while (params.hasMoreElements()){
            String name = (String)params.nextElement();
            System.out.println(name + " : " +request.getParameter(name));
        }
        System.out.println("----------------------------");

		BoardDataBean article = new BoardDataBean();// 데이터처리 빈
        article.setB_no(Integer.parseInt(request.getParameter("b_no"))); //글번호 db1
        article.setEmp_no(Integer.parseInt(request.getParameter("emp_no"))); //직원번호 db2
        article.setB_title(request.getParameter("b_title")); //공지글 제목 db3
        article.setEmp_nm(request.getParameter("emp_nm")); //게시직원명 db4
        article.setB_content(request.getParameter("b_content")); //글내용 db5
        SimpleDateFormat formatter = new SimpleDateFormat ("yyyy.MM.dd");
        Date currentTime = new Date();
        String dtime = formatter.format(currentTime);
        article.setPost_date(dtime); //게시일자 db6
        article.setStore_no(Integer.parseInt(request.getParameter("store_no")));
        article.setBoard_pw(request.getParameter("board_pw"));
        

        
        //article.setbViewCnt(Integer.parseInt(request.getParameter("bviewcnt"))); //조회수 db7
        

        

		BoardDBBean dbPro = BoardDBBean.getInstance();// DB처리
		dbPro.insertArticle(article);
		
		return "/notice/writePro.jsp";
	}
}

