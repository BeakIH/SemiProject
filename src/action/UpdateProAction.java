package action;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import bbs.BoardDataBean;
import bbs.BoardDBBean;

public class UpdateProAction implements CommandAction {

    public String requestPro( HttpServletRequest request,
        HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");

        String pageNum = request.getParameter("pageNum");

	BoardDataBean article = new BoardDataBean();
        article.setbNo(Integer.parseInt(request.getParameter("bNo")));
        article.setempNo(Integer.parseInt(request.getParameter("empno")));
        article.setbTitle(request.getParameter("btitle"));
        article.setempNm(request.getParameter("empnm"));
        article.setbContent(request.getParameter("bcontent"));
        article.setbViewCnt(Integer.parseInt(request.getParameter("bviewcnt")));
        //article.setAdm_pw(request.getParameter("admpw"));
 
	BoardDBBean dbPro = BoardDBBean.getInstance();
        int check = dbPro.updateArticle(article);

        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("check", new Integer(check));

        return "/notice/UpdatePro.jsp";
    }
}
