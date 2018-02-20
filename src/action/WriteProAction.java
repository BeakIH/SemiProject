package action;

import java.sql.Timestamp; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.BoardDataBean;
import bbs.BoardDBBean;

public class WriteProAction implements CommandAction {// 입력된 글 처리

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");// 한글 인코딩
		

		BoardDataBean article = new BoardDataBean();// 데이터처리 빈
        article.setbNo(Integer.parseInt(request.getParameter("bNo"))); //글번호 db1
        article.setempNo(Integer.parseInt(request.getParameter("empNo"))); //직원번호 db2
        article.setbTitle(request.getParameter("btitle")); //공지글 제목 db3
        article.setempNm(request.getParameter("empnm")); //게시직원명 db4
        article.setbContent(request.getParameter("bContent")); //글내용 db5
        article.setpostDate(new Timestamp(System.currentTimeMillis())); //게시일자 db6
        //article.setbViewCnt(Integer.parseInt(request.getParameter("bviewcnt"))); //조회수 db7
        
        //article.setAdm_pw(request.getParameter("admpw"));
        

		BoardDBBean dbPro = BoardDBBean.getInstance();// DB처리
		dbPro.insertArticle(article);

		return "/notice/writePro.jsp";
	}
}

// 2, 3, 4, 5